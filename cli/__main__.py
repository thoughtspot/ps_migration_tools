from typing import Any
import datetime as dt
import logging
import pathlib

import pandas as pd
import toml
import typer
import pytz
import os
from migration_tools import HTTPClient, connection_migrator, ENonCriticalError, EDBSchemaNotInstalled, EDatabaseNotSupported, DDL
from ._util import State
from ._ux import comment, console, output_message
from pathlib import Path
from string import Template
import time
from subprocess import check_output
from thoughtspot_rest_api_v1 import *
import urllib3
urllib3.disable_warnings()


log = logging.getLogger(__name__)

app = typer.Typer(
    help="""Migration tools.""",
    add_completion=False,
    no_args_is_help=True,
    # global settings
    context_settings={
        "help_option_names": ["--help", "-h"],
        "obj": State(),  # safely carry around global state
        "max_content_width": console.width,  # allow responsive console design
        "show_default": False,
        "token_normalize_func": lambda x: x.casefold(),  # allow case-insensitive commands
    },
)


def setup_folder_structure(data_dir, cfg_name):
    """
    Creates the directory structure required.

    < data-dir > / <project>
    ├─ config/
    │  ├─ ...
    │  └─ <project>.toml
    ├─ log/
    │  ├─ ...
    │  └─ yyyymmdd_HHMMSS_migration.log
    ├─ input/
    │  ├─ models
    │  |  ├─ falcon
    │  │  └─ target
    │  ├─ business_model
    │  ├─ connections_yaml
    │  ├─ ddl
    │  |  ├─ falcon
    │  │  └─ target
    ├─ output/
    │  ├─ ddl_comparison.txt
    │  ├─ mapping_overrides.csv
    │  ├─ <target>.yaml
    │  └─ delta_migrations
    │  │  ├─ new/
    │  │  │  ├─ ...
    │  │  │  └─ ___.csv
    │  │  ├─ cs_tools_cloud/
    │  │  │  ├─ ...
    │  │  │  └─ ___.csv
    │  │  ├─ cs_tools_falcon/
    │  │  │  ├─ ...
    │  │  │  └─ ___.csv
    │  │  ├─ info/
    │  │  │  ├─ ...
    │  │  │  └─ ___.csv
    │  │  ├─ modified/
    │  │  │  ├─ ...
    │  │  │  └─ ___.csv
    │  │  ├─ ...
    │  │  └─ ___.csv


    Parameters
    ---------
    data_dir : pathlib.Path

    """
    # Check if files already exist in the target path, as they will get overwritten
    files_found = False
    for dirpath, dirnames, files in os.walk(data_dir):
        if files:
            print(dirpath, ' has files')
            files_found = True

    if files_found:
        typer.confirm(
            (
                f"Files have been found in the target folder {data_dir} or any of its sub folders.",
                "Continuing might overwrite these. Do you want to continue?"),
            abort=True)

    # Initialise the project dir and create all required folders
    folders_to_create = [
        Path(data_dir).joinpath("config"),
        Path(data_dir).joinpath("log"),
        Path(data_dir).joinpath("input/models/falcon"),
        Path(data_dir).joinpath("input/models/target"),
        Path(data_dir).joinpath("input/business_model"),
        Path(data_dir).joinpath("input/connections_yaml"),
        Path(data_dir).joinpath("input/ddl/falcon"),
        Path(data_dir).joinpath("input/ddl/target"),
        Path(data_dir).joinpath("output"),
        Path(data_dir).joinpath("output/delta_migrations/new"),
        Path(data_dir).joinpath("output/delta_migrations/modified"),
        Path(data_dir).joinpath("output/delta_migrations/cs_tools_falcon"),
        Path(data_dir).joinpath("output/delta_migrations/cs_tools_cloud")
    ]

    for folder in folders_to_create:
        Path(folder).mkdir(parents=True, exist_ok=True)

    output_message(''.join(
        (f"The configuration has been initialised. Please open the file {data_dir}/config/{cfg_name} and ",
         "make the required changes before continuing.")), "success")


@ app.command(name="create_config")
def create_cfg(
    ctx: typer.Context,
    cfg_name: str = typer.Option(..., help="Name of config file")
):
    # Load the general configuration (templates etc)
    general_config = toml.load("config/general.toml")

    # Append the project/config name to the data_dir
    data_dir = f"{general_config['GENERAL_SETTINGS']['BASE_PROJECTS_FOLDER']}/{cfg_name.casefold()}"

    # Setup the required folder structure
    setup_folder_structure(data_dir, cfg_name.casefold())

    # Initialise the name of the config file
    project_config_file = f"{data_dir}/config/{cfg_name.casefold()}.toml"

    # Create config file from template
    with open(project_config_file, 'w') as f:
        f.write(
            Template(general_config.get('TEMPLATES').get('PROJECT_CONFIG')).substitute(
                {'data_dir': data_dir}))


@ app.command(name="create_config_old")
def create_cfg_old(
    ctx: typer.Context,
    cfg_name: str = typer.Option(..., help="Name of config file"),
    source_ts_url: str = typer.Option(..., help="URL of your ThoughtSpot cluster"),
    source_username: str = typer.Option(..., help="username of your source cluster"),
    source_password: str = typer.Option(..., help="password of your source cluster"),
    dest_ts_url: str = typer.Option(..., help="URL of your destination cluster"),
    dest_username: str = typer.Option(..., help="username of your destination cluster"),
    dest_password: str = typer.Option(..., help="password of your destination cluster"),
    data_dir: pathlib.Path = typer.Option(..., help="directory to store output data in"),
):
    with open('{}.toml'.format(cfg_name), 'w') as f:
        f.write("source_ts_url = '{}'\n".format(source_ts_url))
        f.write("source_username = '{}'\n".format(source_username))
        f.write("source_password = '{}'\n".format(source_password))
        f.write("dest_ts_url = '{}'\n".format(dest_ts_url))
        f.write("dest_username = '{}'\n".format(dest_username))
        f.write("dest_password = '{}'\n".format(dest_password))
        f.write("data_dir = '{}'\n".format(data_dir))


def get_cfg(cfg_name):
    # Load the general configuration (templates etc)
    general_config = toml.load("config/general.toml")
    setup_logging(general_config, cfg_name)

    project_config_dir = f"{general_config['GENERAL_SETTINGS']['BASE_PROJECTS_FOLDER']}/{cfg_name.casefold()}/config"
    project_config_file = f"{project_config_dir}/{cfg_name}"

    with open('{}.toml'.format(project_config_file), 'r') as file_handler:
        config_data = toml.load(file_handler)
        output_message("Successfully included {}.toml".format(project_config_file), "success")
        global source_ts_url
        global source_username
        global source_password
        global dest_ts_url
        global dest_username
        global dest_password
        global data_dir
        source_ts_url = config_data['DELTA_MIGRATION']['SOURCE_TS_URL']
        source_username = config_data['DELTA_MIGRATION']['SOURCE_USERNAME']
        source_password = config_data['DELTA_MIGRATION']['SOURCE_PASSWORD']
        dest_ts_url = config_data['DELTA_MIGRATION']['DEST_TS_URL']
        dest_username = config_data['DELTA_MIGRATION']['DEST_USERNAME']
        dest_password = config_data['DELTA_MIGRATION']['DEST_PASSWORD']
        data_dir = f"{general_config['GENERAL_SETTINGS']['BASE_PROJECTS_FOLDER']}/{cfg_name.casefold()}/output/delta_migrations"

    return config_data | general_config


# def get_cfg_old(cfg_name):
#     with open('{}.toml'.format(cfg_name), 'r') as file_handler:
#         config_data = toml.load(file_handler)
#         print("successfully included {}.toml".format(cfg_name))
#         global source_ts_url
#         global source_username
#         global source_password
#         global dest_ts_url
#         global dest_username
#         global dest_password
#         global data_dir
#         source_ts_url = config_data['source_ts_url']
#         source_username = config_data['source_username']
#         source_password = config_data['source_password']
#         dest_ts_url = config_data['dest_ts_url']
#         dest_username = config_data['dest_username']
#         dest_password = config_data['dest_password']
#         data_dir = config_data['data_dir']


"""
@app.command(name="test")
def test(
    ctx: typer.Context,
    cfg_name: str = typer.Option(..., help="Name of config file to test"),
):
    get_cfg(cfg_name)
    print(source_ts_url)
"""


@app.command(name="convert_ddls")
def convert_ddls(
    ctx: typer.Context,
    cfg_name: str = typer.Option(..., help="Name of config file"),
):
    console.print("MIGRATION TOOLS - Converting DDLS (using DBSchema)", style="bold blue")
    cfg = get_cfg(cfg_name)

    # TODO: Better error handling in the script, currently we need to check the log if it went well
    if Path(cfg['GENERAL_SETTINGS'].get('DBSCHEMA_STUB')).is_file():
        output = check_output([
            cfg['GENERAL_SETTINGS']['DDL_CONVERSION_SCRIPT'],
            str(cfg['GENERAL_SETTINGS'].get('DBSCHEMA_STUB')),
            str(cfg_name),
            str(cfg.get('MIGRATION').get('SOURCE_PLATFORM')),
            str(cfg.get('MIGRATION').get('TARGET_PLATFORM'))])

        for log_line in output.decode("utf-8").split('\n'):
            output_message(log_line)

        output_message("DDL conversion process completed", "success")
    else:
        raise EDBSchemaNotInstalled()


@ app.command(name="generate_target_ddl")
def generate_target_ddl(
    ctx: typer.Context,
    cfg_name: str = typer.Option(..., help="Name of config file"),
):
    console.print("MIGRATION TOOLS - Generate Target DDL", style="bold blue")
    ddl = DDL('./projects/myfirstproject/input/ddl/falcon/justeat.sql')


@ app.command(name="validate_models")
def validate_models(
    ctx: typer.Context,
    cfg_name: str = typer.Option(..., help="Name of config file"),


):
    """_summary_

    Args:
        ctx (typer.Context) .   :   _description_
        cfg_name (str, optional):   Name of the configuration file.
                                    Defaults to typer.Option(..., help="Name of config file").
    """

    console.print("MIGRATION TOOLS - Validate Models", style="bold blue")
    app = connection_migrator(get_cfg(cfg_name))
    app.compare_models()


@ app.command(name="migrate_yaml")
def migrate_yaml(
    ctx: typer.Context,
    cfg_name: str = typer.Option(..., help="Name of config file"),
):
    """
    Migrates the YAML file according to the mappings derived from the compare operation and the override file

    Args:
        ctx (typer.Context)     :   _description_
        cfg_name (str, optional):   Name of the configuration file.
                                    Defaults to typer.Option(..., help="Name of config file").
    """
    console.print("MIGRATION TOOLS - Migrating YAML file", style="bold blue")
    app = connection_migrator(get_cfg(cfg_name))
    app.compare_models()
    app.migrate_yaml()


@ app.command(name="deltas")
def gather_deltas(
    ctx: typer.Context,
    cfg_name: str = typer.Option(..., help="Name of config file"),
    # source_ts_url: str = typer.Option(..., help="URL of your ThoughtSpot cluster"),
    # source_username: str = typer.Option(..., help="username of your source cluster"),
    # source_password: str = typer.Option(..., help="password of your source cluster"),
    # data_dir: pathlib.Path = typer.Option(..., help="directory to store output data in"),
    backup_date: dt.datetime = typer.Option("2012-11-01", help="date of the backup taken"),
):
    """ """
    get_cfg(cfg_name)
    # ensure_directories(data_dir)
    log.info(f"Calculating deltas since {backup_date.date()}")
    ts = HTTPClient(ts_url=source_ts_url)
    r = ts.login(source_username, source_password)
    r.raise_for_status()

    # contextualize backup_date to the cluster's timezone
    r = ts.session_info()
    tz_name = r.json()["timezone"]
    backup_date = backup_date.replace(tzinfo=pytz.timezone(tz_name))

    # .created, .modified are represented as timestamps in milleseconds
    timestamp = backup_date.timestamp() * 1000

    file_args = {"sep": "|", "index": False, "encoding": "UTF-8"}
    column_dir_mapping = {"created": "new", "modified": "modified"}
    # Get Userlist
    df = pd.json_normalize(ts.user_list().json())

    (df.pipe(comment, msg="Total number of Users: {df.index.size:,}").to_csv(
        data_dir + "/" + "users_all.csv", **file_args))

    for column, sub_dir in column_dir_mapping.items():
        (
            df.query(f"{column} > @timestamp")
            .pipe(comment, msg="  --> {column: >8}: {df.index.size:,}", column=column)
            .to_csv(data_dir + "/" + sub_dir + "/" + "users_created.csv", **file_args)
        )
    # get Grouplist

    df = pd.json_normalize(ts.groups().json())
    df = df.rename(columns={"header.created": "created", "header.modified": "modified"})
    column_dir_mapping = {"created": "new", "modified": "modified"}

    (df.pipe(comment, msg="Total number of Groups: {df.index.size:,}").to_csv(
        data_dir + "/" + "groups_all.csv", **file_args))

    for column, sub_dir in column_dir_mapping.items():
        (
            df.query(f"{column} > @timestamp")
            .pipe(comment, msg="  --> {column: >8}: {df.index.size:,}", column=column)
            .to_csv(data_dir + "/" + sub_dir + "/" + "groups_created.csv", **file_args)
        )

    # create mapping table to map User.id (guid) and User.name (username)
    user_df = pd.json_normalize(ts.users().json())

    (
        user_df.rename(columns={"header.id": "id", "header.name": "name"})[["id", "name"]].to_csv(
            data_dir + "/" + "mapping_users.csv", **file_args
        )
    )

    # get high level information about metadata objects
    metadata = {
        "Liveboard": ts.pinboard_list,
        "Answer": ts.answer_list,
        "System Table": ts.table_list,
        "ThoughtSpot View": ts.view_list,
        "Worksheet": ts.worksheet_list,
    }

    for name, ts_api_method in metadata.items():
        df = (
            pd.json_normalize(ts_api_method().json(), record_path='headers')
            .pipe(comment, msg="Total number of {name}s: {df.index.size:,}", name=name)
            .merge(user_df, how="left", left_on="author", right_on="header.id")
            .rename(columns={"header.id": "id", "header.name": "name"})
        )

        for column, sub_dir in column_dir_mapping.items():
            filename = name.lower().replace(" ", "_")

            (
                df.query(f"{column} > @timestamp")
                .pipe(comment, msg="  --> {column: >8}: {df.index.size:,}", column=column)
                .to_csv(data_dir + "/" + sub_dir + "/" + f"{filename}_{column}.csv", **file_args)
            )


@app.command(name="create_groups")
def create_groups(
    ctx: typer.Context,
    cfg_name: str = typer.Option(..., help="Name of config file"),
    #dest_ts_url: str = typer.Option(..., help="URL of your ThoughtSpot (Cloud) cluster"),
    #dest_username: str = typer.Option(..., help="username of your destination cluster"),
    #dest_password: str = typer.Option(..., help="password of your destination cluster"),
    #data_dir: pathlib.Path = typer.Option(..., help="directory to read input data from"),
):
    """ """
    get_cfg(cfg_name)
    ts = HTTPClient(ts_url=dest_ts_url)
    r = ts.login(dest_username, dest_password)
    r.raise_for_status()
    group_dir = "new"
    filename = "groups_created.csv"
    file_args = {"sep": "|", "encoding": "UTF-8"}
    group_df = pd.read_csv(data_dir + "/" + group_dir + "/" + filename, **file_args)
    group_df = group_df.rename(
        columns={
            "header.displayName": "group_displayName",
            "header.name": "group_name",
            "header.description": "group_description"})
    for i in range(len(group_df)):
        try:
            Name = group_df["group_name"].iloc[i]
            Display = group_df["group_displayName"].iloc[i]
            Description = group_df["group_description"].iloc[i]
            ts.create_group(TechName=Name, DisplayName=Display, DESC=Description)
            print("successfully validated group: {}".format(Name))
        except Exception as e:
            print(str(e) + Name)
            pass


@app.command(name="migrate_answers")
def migrate_answers(
    ctx: typer.Context,
    cfg_name: str = typer.Option(..., help="Name of config file"),
    disable_ssl=False,
    #source_ts_url: str = typer.Option(..., help="URL of your ThoughtSpot cluster"),
    #source_username: str = typer.Option(..., help="username of your source cluster"),
    #source_password: str = typer.Option(..., help="password of your source cluster"),
    #dest_ts_url: str = typer.Option(..., help="URL of your ThoughtSpot (Cloud) cluster"),
    #dest_username: str = typer.Option(..., help="username of your destination cluster"),
    #dest_password: str = typer.Option(..., help="password of your destination cluster"),
    migration_mode: str = typer.Option(...,
                                       help="specify if you want to migrate modified or created objects values: created/modified"),
    validation_mode: str = typer.Option(..., help="run in validation mode only True/False"),
    #data_dir: pathlib.Path = typer.Option(..., help="directory to read input data from"),
):
    get_cfg(cfg_name)
    print("Starting Migration of {} answers in validation mode: {}".format(migration_mode, validation_mode))
    ts: TSRestApiV1 = TSRestApiV1(server_url=source_ts_url)
    ts.requests_session.verify = False

    try:
        ts.session_login(username=source_username, password=source_password)
        console.print("successfully logged in to " + source_ts_url, style="info")
    except requests.exceptions.HTTPError as e:
        console.print(e, style="error")
        print(e.response.content)

    ps: TSRestApiV1 = TSRestApiV1(server_url=dest_ts_url)
    ps.requests_session.verify = False
    try:
        ps.session_login(username=dest_username, password=dest_password)
        console.print("successfully logged in to " + dest_ts_url, style="info")
    except requests.exceptions.HTTPError as e:
        console.print(e, style="error")
        print(e.response.content)

    if validation_mode == 'False':
        Validate = False
    else:
        Validate = True
    if migration_mode == 'created':
        create_new = True
        subfolder = 'new'
    else:
        create_new = False
        subfolder = 'modified'

    NewAnswersDf = pd.read_csv(
        data_dir +
        "/" +
        subfolder +
        "/" +
        'answer_{}.csv'.format(migration_mode),
        header=[0],
        delimiter='|')
    AnswerList = NewAnswersDf['id'].to_list()
    #AnswerList = AnswerList[:2]
    print("Start:")
    NewObjectsList = []
    OwnerList = []
    FailedToLoad = []
    map_guid = []
    map_failed_guid = []
    for GUID in AnswerList:
        object_guid = GUID
        try:
            object_name = NewAnswersDf.loc[NewAnswersDf['id'] == GUID, 'name'].item()
            object_type = 'QUESTION_ANSWER_BOOK'
            print(object_name)
            owner_name = NewAnswersDf.loc[NewAnswersDf['id'] == GUID, 'authorName'].item()
            tml = ts.metadata_tml_export(guid=GUID)
            console.print("Export for " + '{}.answer.tml'.format(object_name) + " successfull", style="info")
            for i in range(0, 10):
                try:
                    if tml['answer']['table']['table_columns'][i]['headline_aggregation'] == 'TABLE_AGGR':
                        tml['answer']['table']['table_columns'][i]['headline_aggregation'] = 'SUM'
                    else:
                        pass
                except BaseException:
                    pass
            UploadObject = ps.metadata_tml_import(tml, create_new_on_server=create_new, validate_only=Validate)
            print("Status:")
            console.print(UploadObject['object'][0]['response']['status'], style="info")
            print("New GUID assigned:")
            print(UploadObject['object'][0]['response']['header']['id_guid'])
            NewObjectsList.append(UploadObject['object'][0]['response']['header']['id_guid'])
            Owner = UploadObject['object'][0]['response']['header']['owner_guid']
            OwnerList.append(Owner)
            new_guid = UploadObject['object'][0]['response']['header']['id_guid']
            map_guid.append([object_guid, new_guid, owner_name, object_name, object_type])
            if Validate == True:
                console.print("Validation for " + '{}.answer.tml'.format(object_name) + " successfull", style="info")
            else:
                console.print("Imported " + '{}.answer.tml'.format(object_name) + " successfully", style="info")
        except Exception as e:
            console.print("couldn't import " + object_name, style="error")
            print(str(e))
            FailedToLoad.append(object_name + '_' + GUID)
            object_name = object_name.replace("/", "")
            print(object_name)
            #dictionary_data = tml
            map_failed_guid.append([object_guid, owner_name, object_name, object_type])
            #a_file = open(".//failed_answers//{}.Answer.tml_{}".format(object_name,GUID), "wb")
            #pickle.dump(dictionary_data, a_file)
            # a_file.close()
            pass
    df = pd.DataFrame(map_guid, columns=["old_guid", "new_guid", "owner", "object_name", "object_type"])
    df_failed = pd.DataFrame(map_failed_guid, columns=["old_guid", "owner", "object_name", "object_type"])
    FailedToLoadAnswer = FailedToLoad
    answer_author = df
    if Validate == False:
        answer_author.to_csv(data_dir + "/info/" + 'answer_author.csv', index=False, encoding='UTF8')
        df_failed.to_csv(data_dir + "/info/" + 'answer_failed.csv', index=False, encoding='UTF8')
    else:
        pass

    print("Finished Migration/Validation of " + str(len(answer_author)) + " objects")
    if len(FailedToLoadAnswer) == 0:
        console.print(str(len(FailedToLoadAnswer)) + " Errors detected", style="info")
    else:
        console.print(str(len(FailedToLoadAnswer)) + " Errors detected", style="error")


@app.command(name="migrate_liveboards")
def migrate_liveboards(
        ctx: typer.Context,
    cfg_name: str = typer.Option(..., help="Name of config file"),
    #source_ts_url: str = typer.Option(..., help="URL of your ThoughtSpot cluster"),
    #source_username: str = typer.Option(..., help="username of your source cluster"),
    #source_password: str = typer.Option(..., help="password of your source cluster"),
    #dest_ts_url: str = typer.Option(..., help="URL of your ThoughtSpot (Cloud) cluster"),
    #dest_username: str = typer.Option(..., help="username of your destination cluster"),
    #dest_password: str = typer.Option(..., help="password of your destination cluster"),
    migration_mode: str = typer.Option(...,
                                       help="specify if you want to migrate modified or created objects values: created/modified"),
    validation_mode: str = typer.Option(..., help="run in validation mode only True/False"),
    #data_dir: pathlib.Path = typer.Option(..., help="directory to read input data from"),
):
    get_cfg(cfg_name)
    print("Starting Migration of {} answers in validation mode: {}".format(migration_mode, validation_mode))
    ts: TSRestApiV1 = TSRestApiV1(server_url=source_ts_url)
    ts.requests_session.verify = False
    try:
        ts.session_login(username=source_username, password=source_password)
        console.print("successfully logged in to " + source_ts_url, style="info")
    except requests.exceptions.HTTPError as e:
        console.print(e, style="error")
        print(e.response.content)

    ps: TSRestApiV1 = TSRestApiV1(server_url=dest_ts_url)
    ps.requests_session.verify = False
    try:
        ps.session_login(username=dest_username, password=dest_password)
        console.print("successfully logged in to " + dest_ts_url, style="info")
    except requests.exceptions.HTTPError as e:
        console.print(e, style="error")
        print(e.response.content)

    if validation_mode == 'False':
        Validate = False
    else:
        Validate = True
    if migration_mode == 'created':
        create_new = True
        subfolder = 'new'
    else:
        create_new = False
        subfolder = 'modified'

    print("Migrating Liveboards")
    NewLiveboardsDf = pd.read_csv(
        data_dir +
        "/" +
        subfolder +
        "/" +
        'liveboard_{}.csv'.format(migration_mode),
        header=[0],
        delimiter='|')
    LiveboardList = NewLiveboardsDf['id'].to_list()
    LiveboardList = LiveboardList[:8]
    NewObjectsList = []
    OwnerList = []
    FailedToLoad = []
    map_guid = []
    map_failed_guid = []
    counter = 0
    for GUID in LiveboardList:
        object_guid = GUID
        object_type = 'PINBOARD_ANSWER_BOOK'
        counter += 1
        print(counter)
        try:

            object_name = NewLiveboardsDf.loc[NewLiveboardsDf['id'] == GUID, 'name'].item()
            object_name = object_name.replace("/", "")
            owner_name = NewLiveboardsDf.loc[NewLiveboardsDf['id'] == GUID, 'authorName'].item()
            tml = ts.metadata_tml_export(guid=GUID)
            print("Export for " + '{}.Liveboard.tml'.format(object_name) + " successfull")
            for i in range(0, 100):
                for n in range(0, 100):
                    try:
                        if tml['pinboard']['visualizations'][i]['answer']['table']['table_columns'][n][
                                'headline_aggregation'] == 'TABLE_AGGR':
                            tml['pinboard']['visualizations'][i]['answer']['table']['table_columns'][n][
                                'headline_aggregation'] = 'SUM'
                        else:
                            pass
                    except BaseException:
                        pass
            try:
                UploadObject = ps.metadata_tml_import(tml, create_new_on_server=create_new, validate_only=Validate)
                print("Status:")
                console.print(UploadObject['object'][0]['response']['status'], style="info")
                print("New GUID assigned:")
                print(UploadObject['object'][0]['response']['header']['id_guid'])
                NewObjectsList.append(UploadObject['object'][0]['response']['header']['id_guid'])
                Owner = UploadObject['object'][0]['response']['header']['owner_guid']
                OwnerList.append(Owner)
                new_guid = UploadObject['object'][0]['response']['header']['id_guid']
                map_guid.append([object_guid, new_guid, owner_name, object_name, object_type])
                if Validate == True:
                    console.print(
                        "Validation for " +
                        '{}.Liveboard.tml'.format(object_name) +
                        " successfull",
                        style="info")
                else:
                    console.print("Imported " + '{}.Liveboard.tml'.format(object_name) + " successfully", style="info")
            except Exception as e:
                console.print("couldn't import " + object_name, style="error")
                console.print(str(e), style="error")
                error_code = str(e)
                map_failed_guid.append([object_guid, owner_name, object_name, object_type, error_code])
                pass
            # fix liveboards script run
            pass

        except Exception as e:
            print("couldn't save {}.Liveboard.tml with Guid: ".format(object_name, GUID))

            print(str(e))
            pass
    df = pd.DataFrame(map_guid, columns=["old_guid", "new_guid", "owner", "object_name", "object_type"])
    df_failed = pd.DataFrame(map_failed_guid, columns=["old_guid", "owner", "object_name", "object_type", "error_code"])
    #df_failed.to_csv(data_dir +"/"+ "info" + "/"+'failed_liveboards_mapping.csv', index=False,encoding = 'UTF8')
    liveboard_author = df
    if Validate == False:
        liveboard_author.to_csv(data_dir + "/" + "info" + "/" + 'liveboard_author.csv', index=False, encoding='UTF8')
        df_failed.to_csv(data_dir + "/" + "info" + "/" + 'liveboard_author_failed.csv', index=False, encoding='UTF8')
    else:
        pass
    print(str(len(map_failed_guid)) + " Errors detected")


@app.command(name="migrate_worksheets")
def migrate_worksheets(
    ctx: typer.Context,
    cfg_name: str = typer.Option(..., help="Name of config file"),
    #source_ts_url: str = typer.Option(..., help="URL of your ThoughtSpot cluster"),
    #source_username: str = typer.Option(..., help="username of your source cluster"),
    #source_password: str = typer.Option(..., help="password of your source cluster"),
    #dest_ts_url: str = typer.Option(..., help="URL of your ThoughtSpot (Cloud) cluster"),
    #dest_username: str = typer.Option(..., help="username of your destination cluster"),
    #dest_password: str = typer.Option(..., help="password of your destination cluster"),
    migration_mode: str = typer.Option(...,
                                       help="specify if you want to migrate modified or created objects values: created/modified"),
    validation_mode: str = typer.Option(..., help="run in validation mode only True/False"),
    #data_dir: pathlib.Path = typer.Option(..., help="directory to read input data from"),
):
    get_cfg(cfg_name)
    print("Starting Migration of {} answers in validation mode: {}".format(migration_mode, validation_mode))
    ts: TSRestApiV1 = TSRestApiV1(server_url=source_ts_url)
    ts.requests_session.verify = False
    try:
        ts.session_login(username=source_username, password=source_password)
        print("successfully logged in to " + source_ts_url)
    except requests.exceptions.HTTPError as e:
        print(e)
        print(e.response.content)

    ps: TSRestApiV1 = TSRestApiV1(server_url=dest_ts_url)
    ps.requests_session.verify = False
    try:
        ps.session_login(username=dest_username, password=dest_password)
        print("successfully logged in to " + dest_ts_url)
    except requests.exceptions.HTTPError as e:
        print(e)
        print(e.response.content)

    if validation_mode == 'False':
        Validate = False
    else:
        Validate = True
    if migration_mode == 'created':
        create_new = True
        subfolder = 'new'
    else:
        create_new = False
        subfolder = 'modified'

    NewWorksheetsDf = pd.read_csv(
        data_dir +
        "/" +
        subfolder +
        "/" +
        'worksheet_{}.csv'.format(migration_mode),
        header=[0],
        delimiter='|')
    WorksheetList = NewWorksheetsDf['id'].to_list()
    NewObjectsList = []
    OwnerList = []
    FailedToLoad = []
    map_guid = []
    for GUID in WorksheetList:
        object_guid = GUID
        try:
            object_type = 'LOGICAL_TABLE'
            object_name = NewWorksheetsDf.loc[NewWorksheetsDf['id'] == GUID, 'name'].item()
            owner_name = NewWorksheetsDf.loc[NewWorksheetsDf['id'] == GUID, 'authorName'].item()
            tml = ts.metadata_tml_export(guid=GUID)
            print("Export for " + '{}.Worksheet.tml'.format(object_name) + " successfull")
            UploadObject = ps.metadata_tml_import(tml, create_new_on_server=create_new, validate_only=Validate)
            # print("Status:")
            print(UploadObject['object'][0]['response']['status'])
            #print("New GUID assigned:")
            # print(UploadObject['object'][0]['response']['header']['id_guid'])
            NewObjectsList.append(UploadObject['object'][0]['response']['header']['id_guid'])
            #owner_name = UploadObject['object'][0]['response']['header']['owner_guid']
            new_guid = UploadObject['object'][0]['response']['header']['id_guid']
            map_guid.append([object_guid, new_guid, owner_name, object_name, object_type])
            if Validate == True:
                console.print("Validation for " + '{}.Worksheet.tml'.format(object_name) + " successfull", style="info")
            else:
                console.print("Imported " + '{}.Worksheet.tml'.format(object_name) + " successfully", style="info")
        except Exception as e:
            console.print("couldn't save {}.Worksheet.tml".format(object_name), style="error")
            FailedToLoad.append([object_guid, owner_name, object_name, object_type])
            print(str(e))
            pass

    df = pd.DataFrame(map_guid, columns=["old_guid", "new_guid", "owner", "object_name", "object_type"])
    df_failed = pd.DataFrame(FailedToLoad, columns=["old_guid", "owner", "object_name", "object_type"])
    worksheet_author = df
    if Validate == False:
        worksheet_author.to_csv(data_dir + "/info/" + 'worksheet_author.csv', index=False, encoding='UTF8')
        df_failed.to_csv(data_dir + "/info/" + 'worksheet_failed.csv', index=False, encoding='UTF8')
    else:
        pass
    print("Finished Migration/Validation of " + str(len(worksheet_author)) + " objects")
    if len(df_failed) == 0:
        console.print(str(len(df_failed)) + " Errors detected", style="info")
    else:
        console.print(str(len(df_failed)) + " Errors detected", style="error")


@app.command(name="transfer_ownership")
def transfer_ownership(
    ctx: typer.Context,
    cfg_name: str = typer.Option(..., help="Name of config file"),
    #dest_ts_url: str = typer.Option(..., help="URL of your ThoughtSpot cluster"),
    #dest_username: str = typer.Option(..., help="username of your source cluster"),
    #dest_password: str = typer.Option(..., help="password of your source cluster"),
    #data_dir: pathlib.Path = typer.Option(..., help="directory to store output data in"),
):
    get_cfg(cfg_name)
    log.info(f"Transfering Ownership for new objects")
    ts = HTTPClient(ts_url=dest_ts_url)
    r = ts.login(dest_username, dest_password)
    r.raise_for_status()

    #map_user = pd.read_csv(data_dir +"/"+'mapping_users.csv', header=[0],delimiter = '|')
    object_author_table = (
        pd.read_csv(data_dir + "/info/" + 'answer_author.csv', header=[0])
    )

    try:
        print("reading liveboards")
        liveboard_author = pd.read_csv(data_dir + "/info/" + 'liveboard_author.csv', header=[0])
        print(liveboard_author)
        object_author_table = pd.concat([object_author_table, liveboard_author], ignore_index=True, sort=False)
        console.print("append liveboard authors to object author table", style="info")
    except Exception:
        console.print("WARNING: liveboard author table not present, please migrate liveboards first", style="warning")
    print(object_author_table)

    #object_author_table = object_author_table.replace('@','%40', regex=True)
    for i in range(len(object_author_table)):
        ObjGUID = object_author_table['new_guid'].iloc[i]
        FromUser = 'api_service'
        ToUser = object_author_table['owner'].iloc[i]

        try:
            t = ts.transfer_ownership(FromUser, ToUser, ObjGUID)
            # console.print(str(t),style="info")
            console.print(
                "Transfering Ownership for " +
                object_author_table['object_name'].iloc[i] +
                " from " +
                FromUser +
                " to " +
                ToUser,
                style="info")
        except Exception as e:
            console.print(f"failed to assign authorship: {e}", style="error")
            pass


@app.command(name="add_tags")
def add_tags(
    ctx: typer.Context,
    cfg_name: str = typer.Option(..., help="Name of config file"),
    #dest_ts_url: str = typer.Option(..., help="URL of your ThoughtSpot cluster"),
    #dest_username: str = typer.Option(..., help="username of your source cluster"),
    #dest_password: str = typer.Option(..., help="password of your source cluster"),
    #data_dir: pathlib.Path = typer.Option(..., help="directory to store output data in"),
):

    get_cfg(cfg_name)
    ps: TSRestApiV1 = TSRestApiV1(server_url=dest_ts_url)
    ps.requests_session.verify = False
    try:
        ps.session_login(username=dest_username, password=dest_password)
        console.print("successfully logged in to " + dest_ts_url, style="info")
    except Exception as e:
        print(e)
        print(e.response.content)

    tagged_objects = (
        pd.read_csv(
            data_dir +
            "/" +
            "cs_tools_falcon" +
            "/" +
            'ts_tagged_object.csv',
            header=[0],
            delimiter='|') .pipe(
            comment,
            msg="ts_tagged_object.csv is present in cs_tools_falcon folder"))
    tag_names = (pd.read_csv(data_dir + "/" + "cs_tools_falcon" + "/" + 'ts_tag.csv', header=[0], delimiter='|')
                 .pipe(comment, msg="ts_tag.csv is present in cs_tools_falcon folder")
                 )
    tag_info = (
        pd.read_csv(data_dir + "/" + "info/" + 'answer_author.csv', header=[0], delimiter=',')
        .pipe(comment, msg="Reading object information")
        .merge(tagged_objects, how="inner", left_on='old_guid', right_on='object_guid')
        .merge(tag_names, how="left", left_on='tag_guid', right_on='tag_guid')
    )
    for i in range(len(tag_info)):
        try:
            guid = tag_info['new_guid'].iloc[i]
            tag_name = tag_info['tag_name'].iloc[i]
            object_name = tag_info['object_name'].iloc[i]
            ps.metadata_assigntag(
                object_guids=['{}'.format(guid)],
                object_type=['QUESTION_ANSWER_BOOK'],
                tag_names=[tag_name])
            console.print('{} Tag assigned to {}'.format(tag_name, object_name), style="info")
        except BaseException:
            console.print('failed to assign tag for object: ' + object_name, style="error")
        pass


@app.command(name="share_permissions")
def share_permissions(
    ctx: typer.Context,
    cfg_name: str = typer.Option(..., help="Name of config file"),
    #dest_ts_url: str = typer.Option(..., help="URL of your ThoughtSpot cluster"),
    #dest_username: str = typer.Option(..., help="username of your source cluster"),
    #dest_password: str = typer.Option(..., help="password of your source cluster"),
    #data_dir: pathlib.Path = typer.Option(..., help="directory to store output data in"),
):
    """ """
    get_cfg(cfg_name)
    ts: TSRestApiV1 = TSRestApiV1(server_url=dest_ts_url)
    try:
        ts.session_login(username=dest_username, password=dest_password)
    except requests.exceptions.HTTPError as e:
        print(e)
        print(e.response.content)
    # Start
    group_map = (
        pd.read_csv(data_dir + "/" + "cs_tools_falcon" + "/" + 'ts_group.csv', header=[0], delimiter='|')
        .pipe(comment, msg="Reading group mapping table")
    )
    user_map = (
        pd.read_csv(data_dir + "/" + "cs_tools_falcon" + "/" + 'ts_user.csv', header=[0], delimiter='|')
        .pipe(comment, msg="Reading user mapping table")
    )
    # read all ownerships

    permissions_df = pd.read_csv(
        data_dir +
        "/" +
        "cs_tools_falcon" +
        "/" +
        'ts_sharing_access.csv',
        header=[0],
        delimiter='|')
    new_objects = (
        pd.read_csv(data_dir + "/" + "info" + "/" + 'ownership.csv', header=[0], delimiter=',')
        .pipe(comment, msg="Reading object information")
        .merge(permissions_df, how="inner", left_on='object_guid', right_on='old_guid')
        .merge(user_map, how="left", left_on='shared_to_user_guid', right_on='user_guid')
        .merge(group_map, how="left", left_on='shared_to_group_guid', right_on='group_guid')
    )
    new_objects.to_csv(data_dir + "/" + "info" + "/" + "sharing_permissions.txt", index=False, encoding='utf8')
    sharing_df = new_objects
    # loop through sharing dataframe:
    for i in range(len(sharing_df)):
        try:
            if pd.isnull(sharing_df['shared_to_group_guid'].iloc[i]):
                user_guid = sharing_df['shared_to_user_guid'].iloc[i]
                object_guid = sharing_df['new_guid'].iloc[i]
                share_user_name = sharing_df['username'].iloc[i]
            else:
                user_guid = sharing_df['shared_to_group_guid'].iloc[i]
                object_guid = sharing_df['new_guid'].iloc[i]
                share_user_name = sharing_df['group_name'].iloc[i]
            sharing_type = sharing_df['share_mode'].iloc[i]
            object_type = sharing_df['object_type'].iloc[i]
            perms = {"permissions": {"{}".format(user_guid): {"shareMode": "{}".format(sharing_type)}}}
            ts.security_share(shared_object_type=object_type, shared_object_guids=[object_guid], permissions=perms)
            print("shared " + sharing_df['object_name'].iloc[i] + ' with ' + user_guid)
        except BaseException:
            print("failed to share" + object_guid + " with " + share_user_name)
            pass


def _load_environment_defaults(context_settings: dict[str, Any]) -> None:
    if os.environ.get("MIGRATION_TOOLS_CONFIG_PATH"):
        for name, value in toml.load(os.environ["MIGRATION_TOOLS_CONFIG_PATH"]).items():
            os.environ[name] = str(value)


def purge_logfiles(general_config, cfg_name):
    log_folder = f"{general_config['GENERAL_SETTINGS']['BASE_PROJECTS_FOLDER']}/{cfg_name.casefold()}/log/"
    output_message(f"Purging log files older than {general_config['GENERAL_SETTINGS']['LOG_FILE_PURGE_SECS']} seconds")
    with os.scandir(log_folder) as listOfEntries:
        for entry in listOfEntries:
            age = time.time() - entry.stat().st_mtime
            if age > general_config['GENERAL_SETTINGS']['LOG_FILE_PURGE_SECS']:
                output_message(f"Purging log file {os.path.join(log_folder, entry.name)} as age is {age}")
                os.remove(os.path.join(log_folder, entry.name))


def setup_logging(general_config, cfg_name):
    purge_logfiles(general_config, cfg_name)
    # Append the project/config name to the data_dir
    log_folder = f"{general_config['GENERAL_SETTINGS']['BASE_PROJECTS_FOLDER']}/{cfg_name.casefold()}/log/"
    log_file = f"{log_folder}{time.strftime('%Y%m%d-%H%M%S')}_migration.log"
    logging.basicConfig(
        filename=log_file,
        format='%(asctime)s [%(levelname)7s] %(message)s',
        encoding='utf-8',
        force=True,
        level=logging.DEBUG)
    output_message(f"Logging to {log_file}", "info")


def main():
    """
    Main entrypoint.
    """
    _load_environment_defaults(context_settings=app.info.context_settings)

    try:
        app(prog_name="migration_tools")
    except ENonCriticalError as E:
        # Non Critical errors, will just log a message
        output_message(E.message, "error")
    except Exception as E:
        # Other errors will log whatever available, including call stack to the log (because of the critical)
        msg = E.message if hasattr(E, 'message') else ''
        output_message(msg if msg != '' else "Whoopsie, something went wrong! Check log file for errors", "critical")
        raise E


if __name__ == "__main__":
    raise SystemExit(main())

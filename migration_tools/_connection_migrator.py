import copy
from difflib import SequenceMatcher
import xml.etree.ElementTree as ET
from ruamel import yaml
import csv
import glob
import os
import string
import time
import re
from pathlib import Path
from collections import Counter
import toml
from cli._ux import output_message
from rich.live import Live
from rich.panel import Panel
from rich.progress import Progress, SpinnerColumn, BarColumn, TextColumn
from rich.table import Table
from migration_tools._comparison_report import comparison_report, table_comparison_summary, table_issue_summary, \
    table_issue_detail, table_issue_list, table_info_list, report_section_title, table_current_mappings, table_file_list, table_setting_list
from migration_tools._error_handling import EInvalidDataTypes, EModelValidationError, EYAMLValidationError, \
    EYAMLPreparationError, EDatabaseNotSupported, EInputFilesMissing

# Requirements:
# ==> python3 -m pip install ruamel.yaml
# ==> python3 -m pip install toml
# ==> python3 -m pip install "typer[all]"


# ======================================================================================================================
# CLASS MigrationUtils
# ======================================================================================================================

class MigrationUtils:
    @staticmethod
    def fuzzy_strip(column):
        """
        Returns the column value in lowercase with parentheses and underscores replaced by spaces and then special spaces and 
        characters removed

        Args:
            column (str): The column value to be stripped

        Returns:
            _type_: The column value in lowercase, underscores, parentheses replaced by spaces and spaces special characters removed
        """
        return " ".join((column.casefold().translate(str.maketrans('', '', string.punctuation)).replace(' ', '').strip().encode("ascii", errors="ignore").decode()).split())
        # return " ".join((column.casefold().replace('(', ' ').replace(')', ' ').replace(
        #     '_', ' ').replace(' ', '').strip().encode("ascii", errors="ignore").decode()).split())

# ======================================================================================================================
# Notification Classes
# ======================================================================================================================


class VAL_NOTIFICATION:
    def __init__(self, table=None, msg=None):
        self.severity = '0-INFO'
        self.table = "" if table is None else table
        self.msg = "" if msg is None else msg
        self.classification = "Informational Message"

    def set_table(self, table):
        self.table = table


class E_VAL_ERROR(VAL_NOTIFICATION):

    def __init__(self, table=None):
        super().__init__(table)
        self.severity = '1-SEVERE'
        self.msg = "Validation Failed"
        self.classification = "Validation Error"


class E_NO_SUITABLE_MATCH(E_VAL_ERROR):
    def __init__(self, table):
        super().__init__(table)
        self.msg = "No suitable matching table could be found"
        self.classification = "Table Could Not Be Matched"


class E_COLUMN_NOT_FOUND(E_VAL_ERROR):
    def __init__(self, table, col):
        super().__init__(table)
        self.msg = f"Column {col} (or anything matching) has not been found."
        self.classification = "Column Not Found"


class E_FUZZY_MATCH_NOTIFICATION(E_VAL_ERROR):
    def __init__(self, table, msg):
        super().__init__(table)
        self.severity = '2-LOW'
        self.msg = msg
        self.classification = "Table Could Only Be Matched Via Fuzzy Match"


class E_STRICT_DATATYPE_NOTIFICATION(E_VAL_ERROR):
    def __init__(self, source_data_type, source_yaml_type, target_data_type, target_yaml_type, table=None):
        super().__init__(table)
        self.severity = '2-LOW'
        self._source_data_type = source_data_type
        self._target_data_type = target_data_type
        self.msg = f"Type {self._source_data_type} ({source_yaml_type}) might not be compatible with {self._target_data_type} ({target_yaml_type}) both ways"
        self.classification = "Source and Target Data Type might not be compatible both ways"


class E_DT_VAL_ERROR(E_VAL_ERROR):
    def __init__(self, source_data_type, target_data_type, table=None):
        super().__init__(table)
        self._source_data_type = source_data_type
        self._target_data_type = target_data_type
        self.classification = "Data Type Validation Error"


class E_VAL_INCOMPATIBLE_DATATYPES(E_DT_VAL_ERROR):
    def __init__(self, source_data_type, target_data_type, table=None):
        super().__init__(source_data_type, target_data_type, table)
        self.msg = f"Type {self._source_data_type} is not compatible with {self._target_data_type}"
        self.classification = "Source and Target Data Type Incompatible"


class E_VAL_LARGER_TARGET_DECIMAL(E_DT_VAL_ERROR):
    def __init__(self, source_data_type, target_data_type, critical_override, table=None):
        super().__init__(source_data_type, target_data_type, table)
        self.severity = "1-SEVERE" if critical_override else "2-LOW"
        self.msg = f"Target datatype decimal {self._target_data_type} is larger than source {self._source_data_type}"
        self.classification = "Target Data Type Precision Larger Than Source"


class E_VAL_SMALLER_TARGET_DECIMAL(E_DT_VAL_ERROR):
    def __init__(self, source_data_type, target_data_type, table=None):
        super().__init__(source_data_type, target_data_type, table)
        self.msg = f"Target datatype decimal {self._target_data_type} is smaller than source {self._source_data_type}"
        self.classification = "Target Data Type Precision Smaller Than Source"


class E_VAL_LARGER_TARGET_LENGTH(E_DT_VAL_ERROR):
    def __init__(self, source_data_type, target_data_type, critical_override, table=None):
        super().__init__(source_data_type, target_data_type, table)
        self.severity = "1-SEVERE" if critical_override else "2-LOW"
        self.msg = f"Target datatype length {self._target_data_type} is larger than source {self._source_data_type}"
        self.classification = "Target Data Type Length Larger Than Source"


class E_VAL_SMALLER_TARGET_LENGTH(E_DT_VAL_ERROR):
    def __init__(self, source_data_type, target_data_type, table=None):
        super().__init__(source_data_type, target_data_type, table)
        self.msg = f"Target datatype length {self._target_data_type} is smaller than source {self._source_data_type}"
        self.classification = "Target Data Type Length Smaller Than Source"


# ======================================================================================================================
# CLASS datatype
# ======================================================================================================================
class datatype:
    cdw: None
    basetype: None
    length: None
    decimal: None
    org_basetype: None
    org_length: None
    org_decimal: None
    lookup_type: None
    data_config: None

    def __init__(self, general_config, source_config, target_config, cdw, basetype, length=None, decimal=None):
        """
        Initialises the data type class

        Args:
            general_config (dict): The contents of the general configuration file
            source_config (dict): The contents of the data configuration for the source model
            target_config (dict): The contents of the data configuration for the target model
            cdw (str): The name of the the cloud data platform
            basetype (str): Base data type, e.g. VARCHAR, INTEGER, NUMBER etc
            length (int, optional): The length of the data type. Defaults to None.
            decimal (int, optional): The number of values after the decimal point. Defaults to None.
        """

        self._general_config = general_config
        self._source_config = source_config
        self._target_config = target_config
        self.cdw = cdw
        self.data_config = source_config if self.cdw.upper() == 'FALCON' else target_config

        # Convert to uppercase as it does not matter and is easier to work with
        self.basetype = basetype.upper()
        self.length = int(
            length) if length is not None and length != '' else None
        # Exception for Falcon
        if self.cdw == 'FALCON' and self.length == 0:
            self.length = 99999

        self.decimal = int(
            decimal) if decimal is not None and decimal != '' else None
        self.process_alias()
        self.lookup_type = self.format_type(True)

    def process_alias(self):
        """
        Replaces a data type with another as specified in the DATATYPE_REPLACE section in the config file
        """
        if 'DATATYPE_REPLACE' in self.data_config:
            for remap_dt in self.data_config['DATATYPE_REPLACE']:
                if self.basetype == remap_dt["data_type"] and \
                        self.length == (remap_dt["length"] if "length" in remap_dt else None) and \
                        self.decimal == (remap_dt["decimal"] if "decimal" in remap_dt else None):
                    self.org_basetype = self.basetype
                    self.org_length = self.length
                    self.org_decimal = self.decimal
                    self.basetype = remap_dt["new_data_type"].upper()
                    self.length = remap_dt["new_length"] if "new_length" in remap_dt else None
                    self.decimal = remap_dt["new_decimal"] if "new_decimal" in remap_dt else None

    def format_type(self, mask=False):
        """
        Returns a formatted data type based on the basetype, length and precision, i.e.
        <basetype> (<length>,<decimal>)

        Args:
            mask (bool, optional): Whether to mask the numbers with X or not. Defaults to False.

        Returns:
            _type_: _description_
        """
        precision = ('(' + (str(self.length) if not mask else 'X') +
                     (("," + (str(self.decimal) if not mask else 'X'))
                      if self.decimal is not None and self.decimal != 0 else '') +
                     ')') if self.length is not None and self.length != 0 else ''
        return self.basetype + precision

    def is_compatible_with(self, other_data_type):
        """
        Compares this data type to the passed other data type to see if they are compatible.
        Data types are compatible if they are in the same group in the data mappings

        Args:
            other_data_type (class datatype): the data type to compare this data type to

        Returns:
            bool: True if the data types are compatible, False otherwise
        """
        other_config = self._source_config if other_data_type.cdw.upper(
        ) == 'FALCON' else self._target_config

        # Now that we fixed the checks on source data types, this should never fail
        if self.lookup_type not in self.data_config['DATATYPE_MAPPINGS']:
            raise Exception

        return self.data_config['DATATYPE_MAPPINGS'][self.lookup_type]['GROUP'] == other_config['DATATYPE_MAPPINGS'][
            other_data_type.lookup_type]['GROUP']

    def compare(self, other_data_type):
        """
        Do a full comparison of this data type to the other data type in terms of data type,
        length and precision to see if they are suitable for mapping

        Args:
            other_data_type (class datatype): the data type to compare this data type to

        Returns:
            bool: True if the data types match and can be mapped, False otherwise
        """
        validation_status_new = []

        # Check if compatible
        if self.is_compatible_with(other_data_type):
            # Check length
            if self.length != other_data_type.length:
                if self.cdw == 'FALCON' and self.basetype == 'VARCHAR' and self._general_config.get(
                        'MODEL_VALIDATION').get('IGNORE_FALCON_VARCHAR_PRECISION'):
                    # We ignore to chose length for Falcon varchars
                    output_message("Ignoring length for Falcon VARCHAR type")
                else:
                    if self.length is None or other_data_type.length is None:
                        # Not all data types have a length, but we have proven they are
                        # compatible, so we accept the length
                        pass
                    else:
                        this_length = self.length if self.length is not None else 0
                        if this_length < other_data_type.length:
                            validation_status_new.append(
                                E_VAL_LARGER_TARGET_LENGTH(
                                    self.format_type(),
                                    other_data_type.format_type(),
                                    not self._general_config.get('MODEL_VALIDATION').get(
                                        'ACCEPT_LARGER_TARGET_LENGTH_DECIMAL')))

                        else:
                            validation_status_new.append(
                                E_VAL_SMALLER_TARGET_LENGTH(
                                    self.format_type(),
                                    other_data_type.format_type()))

            if self.decimal != other_data_type.decimal:
                this_length = self.decimal if self.decimal is not None else 0
                if this_length < other_data_type.decimal:
                    validation_status_new.append(
                        E_VAL_LARGER_TARGET_DECIMAL(
                            self.format_type(),
                            other_data_type.format_type(),
                            not self._general_config.get('MODEL_VALIDATION').get(
                                'ACCEPT_LARGER_TARGET_LENGTH_DECIMAL')))

                elif this_length > other_data_type.decimal:
                    validation_status_new.append(
                        E_VAL_SMALLER_TARGET_DECIMAL(
                            self.format_type(),
                            other_data_type.format_type()))

            other_config = self._source_config if other_data_type.cdw.upper(
            ) == 'FALCON' else self._target_config
            if self.data_config['DATATYPE_MAPPINGS'][self.lookup_type]['YAML_TYPE'] != other_config['DATATYPE_MAPPINGS'][
                    other_data_type.lookup_type]['YAML_TYPE']:
                validation_status_new.append(
                    E_STRICT_DATATYPE_NOTIFICATION(
                        self.format_type(),
                        self.data_config['DATATYPE_MAPPINGS'][self.lookup_type]['YAML_TYPE'],
                        other_data_type.format_type(),
                        other_config['DATATYPE_MAPPINGS'][
                            other_data_type.lookup_type]['YAML_TYPE']))
        else:
            validation_status_new.append(
                E_VAL_INCOMPATIBLE_DATATYPES(
                    self.format_type(),
                    other_data_type.format_type()))

        return validation_status_new

# ======================================================================================================================
# CLASS dbschema_model
# ======================================================================================================================


class dbschema_model:
    folder_name = None
    model = None
    database = None
    cdw = ""
    data_config = None

    def __init__(self, folder_name, general_config, source_config, target_config):
        """
        Initialises the dbschema_model class. Loads all the input files (DBS or CSV) and
        validates the data types used. Cleans up the model after loading (removing empty and
        databases, schemas to ignore)

        Args:
            folder_name (str): The name of the folder to read the input files from
            general_config (dict): The contents of the general configuration file
            source_config (dict): The contents of the data configuration for the source model
            target_config (dict): The contents of the data configuration for the target model

        Raises:
            Exception: Exception is raised when invalid data types have been encountered in the model
        """
        self._general_config = general_config
        self._source_config = source_config
        self._target_config = target_config
        self._source_files_processed = []
        self.folder_name = folder_name
        self.load_from_file()
        self.data_config = self._source_config if self.cdw.upper(
        ) == 'FALCON' else self._target_config
        self.valid_data_types = list(self.data_config['DATATYPE_MAPPINGS'])

        invalid_data_types = [
            {'db': db, 's': schema, 't': table, 'c': c,
                'dt': self.model[db]['schemas'][schema][table][c].format_type(True)}
            for db in self.model
            for schema in self.model[db]['schemas']
            for table in self.model[db]['schemas'][schema]
            for c in self.model[db]['schemas'][schema][table]
            if self.model[db]['schemas'][schema][table][c].format_type(True)
            not in list(
                [m for m in self.data_config['DATATYPE_MAPPINGS']])]

        if len(invalid_data_types) > 0:
            raise EInvalidDataTypes(invalid_data_types, self.cdw)

        self.cleanup_model()

    def cleanup_model(self):
        """
        Cleans up the loaded data model:
        1. Removes databases which are marked to ignore
        2. Removes databases with no content
        3. Removes schemas which are marked to ignore
        4. Removes schemas which are empty
        5. Removes tables with no columns
        """
        # Remove all databases, views to ignore and empty elements
        model_copy = copy.deepcopy(self.model)

        for db in model_copy:
            if db in self._general_config.get('MODEL_VALIDATION').get(
                    'EXCLUDE_DATABASES') or len(model_copy[db]['schemas']) == 0:
                output_message(f"Excluding database: {db}")
                self.model.pop(db)
            else:
                for schema in model_copy[db]['schemas']:
                    if f"{db}.{schema}" in self._general_config.get('MODEL_VALIDATION').get(
                            'EXCLUDE_SCHEMAS') or len(model_copy[db]['schemas'][schema]) == 0:
                        output_message(f"Excluding schema: {db}.{schema}")
                        self.model[db]['schemas'].pop(schema)
                    else:
                        for table in model_copy[db]['schemas'][schema]:
                            if len(model_copy[db]['schemas'][schema][table]) == 0:
                                self.model[db]['schemas'][schema].pop(table)

    def load_from_file(self):
        """
        Loads the input files from the source folder. Input files can be either
        in .dbs format (dbschema) or .csv files
        """
        self.model = {}
        # List all the dbs and csv files in the source folder
        model_list = glob.glob(self.folder_name + '*.dbs') + \
            glob.glob(self.folder_name + '*.csv')

        for db_file in model_list:
            self._source_files_processed.append(db_file)
            if Path(db_file).suffix == '.dbs':
                # For dbschema .dbs files, the database name is the file name, so we can have one db per file
                database_name = os.path.splitext(os.path.basename(db_file))[0]
                self.model[database_name] = {}
                tree = ET.parse(db_file)
                self.parse_dbs(database_name, tree.getroot())
            elif Path(db_file).suffix == '.csv':
                # For csv files, the database name is in the data, so we can have multiple dbs per file
                self.parse_csv(db_file)

    def get_stats(self):
        """
        Counts the number of tables, schemas, tables and columns in the model

        Returns:
            dict: The individual counts in a dictionary
        """
        return {
            "db_cnt": len([d for d in self.model]),
            "sch_cnt": len([s for d in self.model
                            for s in self.model[d]['schemas']]),
            "tbl_cnt": len([s for d in self.model
                            for s in self.model[d]['schemas']
                            for t in self.model[d]['schemas'][s]]),
            "col_cnt": len([c for d in self.model
                            for s in self.model[d]['schemas']
                            for t in self.model[d]['schemas'][s]
                            for c in self.model[d]['schemas'][s][t]])
        }

    def parse_csv(self, db_file):
        """
        Loads the data model from a csv file

        Args:
            db_file (str): File name of the csv file to process
        """

        output_message(
            f"Start parsing model(s) from csv file {db_file}...", "debug")
        if os.path.basename(os.path.dirname(db_file)) == 'falcon':
            source_platform = 'Falcon'
        else:
            source_platform = self._general_config.get(
                'MIGRATION').get('TARGET_PLATFORM')

        with open(db_file) as csv_file:
            csv_reader = csv.reader(csv_file)
            line_count = 0
            for row in csv_reader:
                # 'DATABASE_NAME','SCHEMA_NAME','TABLE_NAME','COLUMN_NAME','DATA_TYPE','LENGTH','DECIMAL']
                if line_count >= 0 and row[0] != "":
                    database_name = row[0]
                    schema_name = row[1]
                    table_name = row[2]
                    column_name = row[3]
                    data_type = row[4]
                    length = row[5] if row[5] != '' else None
                    decimal = row[6] if row[6] != '' else None
                    if database_name not in self.model:
                        self.model[database_name] = {}
                        self.model[database_name]['database_name'] = database_name
                        self.model[database_name]['source_database'] = source_platform
                        self.cdw = self.model[database_name]['source_database'].upper(
                        )
                        self.model[database_name]['total_schemas'] = 0
                        self.model[database_name]['total_tables'] = 0
                        self.model[database_name]['total_columns'] = 0
                        self.model[database_name]['schemas'] = {}
                    if schema_name not in self.model[database_name]['schemas']:
                        self.model[database_name]['schemas'][schema_name] = {}
                        self.model[database_name]['total_schemas'] += 1
                    if table_name not in self.model[database_name]['schemas'][schema_name]:
                        self.model[database_name]['schemas'][schema_name][table_name] = {
                        }
                        self.model[database_name]['total_tables'] += 1
                    if column_name not in self.model[database_name]['schemas'][schema_name][table_name]:
                        self.model[database_name]['schemas'][schema_name][table_name][column_name] = {
                        }
                        self.model[database_name]['total_columns'] += 1

                    self.model[database_name]['schemas'][schema_name][table_name][column_name] = datatype(
                        self._general_config, self._source_config, self._target_config,
                        self.cdw, data_type, length, decimal)

                line_count += 1

        stats = self.get_stats()

        output_message(''.join(
            (f"Parsed csv file {db_file} ({self.model[database_name]['source_database']}): ",
             f"Databases: {stats['db_cnt']} ",
             f"Schemas: {stats['sch_cnt']} ",
             f"Tables: {stats['tbl_cnt']} ",
             f"Columns: {stats['col_cnt']}")),
            "success")

    def parse_dbs(self, database_name, db_data):
        """
        Loads the model information from the DBS file. A DBS contains only one database and the file name
        is the database name

        Args:
            database_name (str): Name of the database we are loading schemas, tables etc for
            db_data (dict): The data from the dbs file
        """

        self.model[database_name]['database_name'] = database_name
        self.model[database_name]['source_database'] = db_data.attrib['database'] if db_data.attrib['database'].upper(
        ) != 'THOUGHTSPOT' else 'FALCON'
        self.cdw = self.model[database_name]['source_database'].upper()
        self.model[database_name]['schemas'] = {}
        self.model[database_name]['total_tables'] = 0
        self.model[database_name]['total_columns'] = 0

        output_message(
            f"Start parsing database {database_name} ({self.model[database_name]['source_database']}) from dbs...")
        for schema in db_data:
            if schema.tag == 'schema':
                schema_name = schema.attrib['name'].encode(
                    "ascii", errors="ignore").decode()
                tables = {}
                for table in schema:
                    if table.tag == 'table':
                        table_name = table.attrib['name'].encode(
                            "ascii", errors="ignore").decode()

                        columns = {}
                        for column in table:
                            if column.tag == "column":
                                columns[column.attrib['name'].encode("ascii", errors="ignore").decode()] = datatype(
                                    self._general_config, self._source_config, self._target_config, self.cdw,
                                    column.attrib['type'].upper(),
                                    column.attrib["length"] if "length" in column.attrib else None, column.attrib
                                    ["decimal"] if "decimal" in column.attrib else None)

                        tables[table_name] = columns
                        self.model[database_name]['total_columns'] += len(
                            columns)
                self.model[database_name]['schemas'][schema_name] = tables
                self.model[database_name]['total_tables'] += len(tables)
        self.model[database_name]['total_schemas'] = len(
            self.model[database_name]['schemas'])

        output_message(''.join(
            (f"Parsed database {database_name} ({self.model[database_name]['source_database']}): ",
             f"Schemas: {self.model[database_name]['total_schemas']} ",
             f"Tables: {self.model[database_name]['total_tables']} ",
             f"Columns: {self.model[database_name]['total_columns']}")))

    def write_to_csv(self, file_name='./output/test.csv'):
        """
        Test function to write the contents of the model to a csv file

        Args:
            file_name (str, optional): Name of the file to write to. Defaults to './output/test.csv'.
        """
        with open(file_name, "w") as stream:
            writer = csv.writer(stream)
            for db in self.model:
                for schema in self.model[db]['schemas']:
                    for table in self.model[db]['schemas'][schema]:
                        for column in self.model[db]['schemas'][schema][table]:
                            data = [
                                db,
                                schema,
                                table,
                                column,
                                self.model[db]['schemas'][schema][table][column].basetype,
                                self.model[db]['schemas'][schema][table][column].length,
                                self.model[db]['schemas'][schema][table][column].decimal]
                            writer.writerow(data)

    def get_column_list_for_table(self, database_name, schema_name, table_name):
        """
        Returns a list of all the columns in the table

        Args:
            database_name (str) : Name of the database
            schema_name (str)   : Name of the schema
            table_name (str)    : Name of the table

        Returns:
            list: A list of the column names in the table
        """

        return [column.casefold()
                for database in self.model if database.casefold() == database_name.casefold()
                for schema in self.model[database]['schemas'] if schema.casefold() == schema_name.casefold()
                for table in self.model[database]['schemas'][schema] if table.casefold() == table_name.casefold()
                for column in self.model[database]['schemas'][schema][table]]

    def similar_names(self, name1, name2):
        """
        Returns a similarity ratio of name1 and name2

        Args:
            name1 (_type_): The first name
            name2 (_type_): The name to check similarity with the first name

        Returns:
            float: The ratio of similarity
        """
        return SequenceMatcher(None, name1, name2).ratio()

    def table_fuzzy_search(self, source_db, source_schema, source_table,
                           source_column_list, mapping_details, mapping_category):
        """
        _summary_

        Args:
            source_db (str): _description_
            source_schema (str): _description_
            source_table (str): _description_
            source_column_list (list): _description_
            mapping_details (dict): _description_
            mapping_category (str): _description_

        Returns:
            _type_: _description_
        """
        result = False

        output_message(
            f'Executing fuzzy match for table {source_db}.{source_schema}.{source_table} with columns {",".join([MigrationUtils.fuzzy_strip(c) for c in source_column_list])}')

        output_message([MigrationUtils.fuzzy_strip(c) for c in self.get_column_list_for_table(
            'NA_SC_ANALYTICS_PROD', 'NA_SC_ANALYTICS_PROD_WI', 'OTR')])

        # This goes wrong when there is a (user uploaded) table which does not exist in source and no match can be found
        # for example, the column names are too different or there are more columns in source than on target
        output_message(','.join([f"{tdatabase}.{tschema}.{ttable} ({mapping_details.table_available_for_matching(mapping_category, tdatabase, tschema, ttable)}) " for tdatabase in self.model
                                 for tschema in self.model[tdatabase]['schemas']
                                 for ttable in self.model[tdatabase]['schemas'][tschema]
                                 # Fuzzy match the column name lists
                                 if [MigrationUtils.fuzzy_strip(c1) for c1 in source_column_list] ==
                                 [MigrationUtils.fuzzy_strip(c2)
                                  for c2 in self.get_column_list_for_table(tdatabase, tschema, ttable)] or
                                 all(
                                     elem
                                     in
                                     [MigrationUtils.fuzzy_strip(c2)
                                      for c2 in self.get_column_list_for_table(tdatabase, tschema, ttable)]
                                     for elem in [MigrationUtils.fuzzy_strip(c1) for c1 in source_column_list])
                                 ]))
        # --------------------------------------------------------------------------------------------------
        # Ranking explained:
        #       100.0 : Perfect match: same table name (case insensitive),
        #               same columns (fuzzy matched) and same number of columns
        # 75.0 - 85.0 : Different table names, same columns (fuzzy matched) and same number of columns.
        #               The closer the number is to 85, the more similar the two table names are
        #        50.0 : Same table name (case insensitive), source columns are present in target table,
        #               but target table has additional columns
        # 25.0 - 35.0 : Different table names, source columns are present in target table,
        #               but target table has additional columns. The closer the number is to 35, the more
        #               similar the two table names are
        #         0.0 : No match found
        # --------------------------------------------------------------------------------------------------
        matching_tables_prep = [{"database": tdatabase, "schema": tschema, "table": ttable,
                                 # Check if a target table is available for mapping, i.e. it has not been mapped to
                                 # any other source table already
                                 "available": mapping_details.table_available_for_matching(
                                     mapping_category, tdatabase, tschema, ttable),
                                 # -------------------------------------------------------------------------------
                                 # Score = 100 (perfect) => identical table names (case insensitive) and the same
                                 # amount of identical column names (fuzzy matched)
                                 "rank": 100
                                 if ttable.casefold() == source_table.casefold() and len(source_column_list) ==
                                 len(self.get_column_list_for_table(
                                     tdatabase, tschema, ttable))

                                 # -------------------------------------------------------------------------------
                                 # Score = 75 - 85 =>
                                 # The table names do not match (case insensitive), but the tables have the same
                                 # amount of fuzzy matching columns.
                                 # Base score is 75, but this can be increased based on the similarity of the
                                 # table names
                                 else
                                 round(75 + (10 * self.similar_names(ttable.casefold(),
                                                                     source_table.casefold())),
                                       1)
                                 if ttable.casefold() != source_table.casefold() and len(source_column_list) ==
                                 len(self.get_column_list_for_table(
                                     tdatabase, tschema, ttable))

                                 # -------------------------------------------------------------------------------
                                 # Score = 50 => identical column names (case insensitive). All columns of the
                                 # source table fuzzy match the target columns, but the target table has additional
                                 # columns.
                                 else 50
                                 if ttable.casefold() == source_table.casefold() and len(source_column_list) <
                                 len(self.get_column_list_for_table(
                                     tdatabase, tschema, ttable))


                                 # -------------------------------------------------------------------------------
                                 # Score = 25 - 35 =>
                                 # The table names do not match (case insensitive), all columns of the source
                                 # table fuzzy match the target columns, but the target table has additional
                                 # columns.
                                 # Base score is 25, but this can be increased based on the similarity of the
                                 # table names
                                 # There is an additional condition (configurable) that the source table must have
                                 # at least X columns
                                 else
                                 round(25 + (10 * self.similar_names(ttable.casefold(),
                                                                     source_table.casefold())),
                                       1)
                                 if ttable.casefold() != source_table.casefold() and len(source_column_list) <
                                 len(self.get_column_list_for_table(
                                     tdatabase, tschema, ttable)) and len(source_column_list)
                                 >= self._general_config.get('MODEL_VALIDATION').get('MIN_COL_COUNT_FUZZY')

                                 # -------------------------------------------------------------------------------
                                 # Score = 0 => No suitable match found
                                 else 0}

                                for tdatabase in self.model
                                for tschema in self.model[tdatabase]['schemas']
                                for ttable in self.model[tdatabase]['schemas'][tschema]
                                # Fuzzy match the column name lists
                                if [MigrationUtils.fuzzy_strip(c1) for c1 in source_column_list] ==
                                [MigrationUtils.fuzzy_strip(c2)
                                 for c2 in self.get_column_list_for_table(tdatabase, tschema, ttable)] or
                                all(
            elem
            in
            [MigrationUtils.fuzzy_strip(c2)
             for c2 in self.get_column_list_for_table(tdatabase, tschema, ttable)]
            for elem in [MigrationUtils.fuzzy_strip(c1) for c1 in source_column_list])
        ]

        # Remove matches with rank of 0
        matching_tables = [
            mt for mt in matching_tables_prep if float(mt['rank']) > 0]

        # --------------------------------------------------------------------------------------------
        # Build a list of similar tables, these are tables which are not matching candidates but are
        # highly similar in terms of column names
        # --------------------------------------------------------------------------------------------
        sim_tables = [{"table": f"{tdatabase}.{tschema}.{ttable}",
                      "sim_pct":
                       round(
                           (
                               len(
                                   list(
                                       # Columns appearing in both tables
                                       set([MigrationUtils.fuzzy_strip(c1) for c1 in source_column_list]) &
                                       set(
                                           [MigrationUtils.fuzzy_strip(c2)
                                            for c2 in self.get_column_list_for_table(tdatabase, tschema, ttable)]))) /
                               len(source_column_list)) * 100, 1)}
                      for tdatabase in self.model
                      for tschema in self.model[tdatabase]['schemas']
                      for ttable in self.model[tdatabase]['schemas'][tschema]
                      if f"{tdatabase}.{tschema}.{ttable}" not in [f"{mt['database']}.{mt['schema']}.{mt['table']}" for mt in matching_tables]]

        # Rank this table list based on similarity percentage
        sim_table_ranking = sorted([t for t in sim_tables if t['sim_pct'] > self._general_config.get(
            'MODEL_VALIDATION').get('MIN_COLUMN_SIMILARITY_PCT')], key=lambda d: d['sim_pct'], reverse=True)

        # ----------------------------------------------------------------------------------
        # Do we have any matching candidates (which are available, i.e. not already mapped)
        # ----------------------------------------------------------------------------------
        if len(matching_tables) > 0 and len([m['rank'] for m in matching_tables if m['available']]) > 0:
            # Get tha maximum rank of the available tables
            max_rank = max([m['rank']
                           for m in matching_tables if m['available']])

            # If the rank is higher than the set minimal rank for a match (config)
            if max_rank >= self._general_config.get('MODEL_VALIDATION').get('MINIMUM_SCORE_FOR_MATCH'):
                # Add details to the mapping comments
                mapping_details.add_notification(VAL_NOTIFICATION(
                    f"{source_db}.{source_schema}.{source_table}",
                    "Matching Candidates:"))

                # 'Pick' the candidate with the highest rank
                picked = False
                for m in matching_tables:
                    picked = not (
                        picked) and m['rank'] == max_rank and m['available']

                    # Add a comment with the score explanation
                    mapping_details.add_notification(
                        VAL_NOTIFICATION(
                            f"{source_db}.{source_schema}.{source_table}",
                            f"----{m['database']}.{m['schema']}.{m['table']} (Available:{m['available']}, " +
                            f"Score:{m['rank']}) {'    <==== BEST CANDIDATE' if picked else ''}",))

                    m['status_msg'] = ""
                    if picked:
                        if m['rank'] == 100:
                            m['status_msg'] = ''.join((
                                f"Table {m['table']} matched via identical match: ",
                                "same table name, same columns"))
                        elif m['rank'] >= 75:
                            m['status_msg'] = ''.join((
                                f"Table {m['table']} matched via fuzzy match: ",
                                "different table name, same columns"))
                        elif m['rank'] == 50:
                            m['status_msg'] = ''.join((
                                f"Table {m['table']} matched via fuzzy match: same table name, ",
                                "target has more columns than source which will result in a partial match"))
                        elif m['rank'] >= 25:
                            m['status_msg'] = ''.join((
                                f"Table {m['table']} matched via fuzzy match: different table name, ",
                                "target has more columns than source will might result in a partial match"))

                        mapping_details.add_notification(
                            VAL_NOTIFICATION(
                                f"{source_db}.{source_schema}.{source_table}",
                                "------" + str(m['status_msg'])))

                        result = m
                        break

        # Output similar tables. These table are currently not valid mappings, but they might help investigation
        if len(sim_table_ranking) > 0:
            mapping_details.add_notification(
                VAL_NOTIFICATION(
                    f"{source_db}.{source_schema}.{source_table}",
                    "Similar (non matching) tables:"))
            for t in sim_table_ranking:
                mapping_details.add_notification(
                    VAL_NOTIFICATION(
                        f"{source_db}.{source_schema}.{source_table}",
                        f"----{t['table']} (Similarity Percent: {t['sim_pct']})"))

        return result


# ======================================================================================================================
# CLASS business_model
# ======================================================================================================================

class business_model:
    COL_LOGICAL_COLUMN_NAME = 0
    COL_COLUMN_GUID = 2
    COL_LOGICAL_TABLE_NAME = 3
    COL_TABLE_GUID = 4
    COL_PHYSICAL_COLUMN_NAME = 5
    COL_PHYSICAL_TABLE_NAME = 7
    file_name = None
    src_model_tables = None

    def __init__(self, folder_name):
        self.folder_name = folder_name
        self.load_from_file()

    def load_from_file(self):
        # Should exist as otherwise an error would have been raised earlier
        for file in os.listdir(self.folder_name):
            if file.endswith(".xls") or file.endswith(".tsv"):
                self.file_name = self.folder_name + file

                self.src_model_tables = []
                if Path(self.file_name).is_file():
                    with open(self.file_name) as csv_file:
                        csv_reader = csv.reader(csv_file, delimiter='\t')
                        line_count = 0
                        for row in csv_reader:
                            if line_count > 0 and row[self.COL_PHYSICAL_TABLE_NAME] != "":
                                self.src_model_tables.append({
                                    "TableGUID": row[self.COL_TABLE_GUID],
                                    "LogicalTableName": row[self.COL_LOGICAL_TABLE_NAME],
                                    "PhysicalTableName": row[self.COL_PHYSICAL_TABLE_NAME],
                                    "ColumnGUID": row[self.COL_COLUMN_GUID],
                                    "LogicalColumnName": row[self.COL_LOGICAL_COLUMN_NAME],
                                    "PhysicalColumnName": row[self.COL_PHYSICAL_COLUMN_NAME]
                                })
                            line_count += 1
                break

    def locate_by_id(self, table_id):
        table_details = None
        if table_id in {t['TableGUID'] for t in self.src_model_tables}:
            table_details = [
                t for t in self.src_model_tables if t['TableGUID'] == table_id]
            output_message(
                f"Located user uploaded table source business model. Actual name is {table_details[0]['PhysicalTableName']}")
            # As this is a 100% sure match overwrite table and columns to the mappings by
            # locating this matched name as the target but with this source db and schema
        return table_details


##########################################################################
# Class connections_yaml
##########################################################################

# ======================================================================================================================
# CLASS connections_yaml
# ======================================================================================================================

class connections_yaml:
    source_model = None
    target_model = None
    business_model = None
    source_file_name = None
    source_schema_list = None
    remap_overrides = None
    mapping_details = None
    tables_used_for_renaming = None

    def __init__(self, general_config, source_config, target_config, source_model,
                 target_model, mapping_details):
        self._general_config = general_config
        self._source_config = source_config
        self._target_config = target_config

        yaml_found = False
        for file in os.listdir(self._general_config.get('FILE_LOCATIONS').get('SRC_YAML_FOLDER')):
            if file.endswith(".yaml"):
                yaml_found = True
                break

        if not yaml_found:
            raise EInputFilesMissing('input yaml', self._general_config.get(
                'FILE_LOCATIONS').get('SRC_YAML_FOLDER'))

        self.source_file_name = self._general_config.get(
            'FILE_LOCATIONS').get('SRC_YAML_FOLDER') + file
        self.source_model = source_model
        self.target_model = target_model
        self.business_model = business_model(self._general_config.get(
            'FILE_LOCATIONS').get('BUSINESS_MODEL_FOLDER'))
        self.tables_used_for_renaming = []
        self.mapping_details = mapping_details
        self.load_yaml_from_file()
        self.prepare_yaml()
        output_message("--YAML Preparation completed...")

    def load_yaml_from_file(self):
        with open(self.source_file_name) as file:
            self.contents = yaml.load(file, Loader=yaml.RoundTripLoader)

        for table in self.contents['table']:
            table['external_table']['mapping_status'] = 'UNMAPPED'
            for col in table['column']:
                col['mapping_status'] = 'UNMAPPED'

    def identify_similar_tables(self):
        similar_tables = set()
        for table in self.contents['table']:
            col_list = [c['name'] for t in self.contents['table']
                        if t['external_table']['table_name'] == table['external_table']['table_name']
                        for c in t['column']]

            tables_with_similar_columns = [
                t['name'] for t in self.contents['table'] if [
                    MigrationUtils.fuzzy_strip(
                        c1['name']) for c1 in t['column']] == [
                    MigrationUtils.fuzzy_strip(c2) for c2 in col_list]]
            if len(tables_with_similar_columns) > 1:
                similar_tables.add(tuple(tables_with_similar_columns))

        if len(similar_tables):
            msg = "".join(
                ("We have found tables with similar column definitions in the YAML file. This might cause the ",
                 "fuzzy matching to match tables incorrectly. The tables with similar column names are:\n"))
            for t in similar_tables:
                msg += ",".join(t) + "\n"
            output_message(msg, "warning")

    def prepare_yaml(self):
        output_message("Preparing YAML remapping file for migration....")
        errors = []
        self.identify_similar_tables()

        for table in self.contents['table']:
            output_message(''.join(
                (f"Preparing YAML for table: {table['external_table']['db_name']}.",
                 f"{table['external_table']['schema_name']}.",
                 f"{table['external_table']['table_name']}")))

            # -----------------------------------------------------------------------------------------------------
            # Step 1 - Extract Falcon table details: Extract the database, schema and table name from the formatted
            # table_name <dbname>_<schema>_<table>
            # -----------------------------------------------------------------------------------------------------
            # For all combinations of <dbname>_<schema> present in the source model,
            # if the formatted name starts with them, extract them
            db_schemas = [{"db": db.lower(),
                           "schema": schema.lower()}
                          for db in self.source_model.model for schema in self.source_model.model[db]['schemas']
                          if table['external_table']['table_name'].lower().startswith(
                db.lower() + "_" + schema.lower())]

            if len(db_schemas) == 1:
                table['external_table']['falcon_db'] = db_schemas[0]['db']
                table['external_table']['falcon_schema'] = db_schemas[0]['schema']
                table['external_table']['falcon_table'] = table['external_table']['table_name'][
                    len(db_schemas[0]['db']) + len(db_schemas[0]['schema']) + 2:]
                table['external_table']['old_falcon_db'] = table['external_table']['db_name']
                table['external_table']['old_falcon_schema'] = table['external_table']['schema_name']
                table['external_table']['old_falcon_table'] = table['external_table']['table_name']
                table['external_table']['db_name'] = db_schemas[0]['db']
                table['external_table']['schema_name'] = db_schemas[0]['schema']
                table['external_table']['table_name'] = table['external_table']['table_name'][
                    len(db_schemas[0]['db']) + len(db_schemas[0]['schema']) + 2:]
                output_message(''.join(
                    (f"Mapped to table: {table['external_table']['db_name']}.",
                     f"{table['external_table']['schema_name']}.{table['external_table']['table_name']}")))
            else:
                # Cannot extract database and schema name from YAML falcon table_name
                errors.append(''.join(
                    ("Cannot extract database and schema name from YAML falcon table_name ",
                     table['external_table']['table_name'].lower())))

            # ---------------------------------------------
            # Step 2 - Fix names for user uploaded tables
            # ---------------------------------------------
            if table['external_table']['falcon_db'].lower() == 'falconuserdatadatabase' and \
                    table['external_table']['falcon_schema'].lower() == 'falconuserdataschema' and \
                    table['external_table']['falcon_table'].lower()[:9] == 'userdata_':
                output_message(
                    "Identified as user uploaded table. Trying to locate in business model.")
                model_table = self.business_model.locate_by_id(table['id'])
                # As this is a 100% sure match overwrite table and columns to the mappings by locating this matched
                # name as the target but with this source db and schema
                if model_table is not None:
                    table['external_table']['falcon_table'] = model_table[0]['PhysicalTableName']
                    for col in model_table:
                        mcol = [c for c in table['column']
                                if c['id'] == col['ColumnGUID']]
                        mcol[0]['external_column'] = col['PhysicalColumnName']
                else:
                    # Cannot locate user uploaded table in business model
                    errors.append(
                        (f"Cannot locate user uploaded table {table['external_table']['falcon_table'].lower()} ",
                         f"with id {table['id']} in business model"))

        if len(errors) > 0:
            raise EYAMLPreparationError(errors)

    def compare_yaml_to_source(self):
        # for table in self.contents['table']:
        yaml_tables = [
            f"{st['external_table']['db_name'].lower()}.{st['external_table']['schema_name'].lower()}." +
            f"{st['external_table']['falcon_table'].lower()}" for st in self.contents['table']]
        # f"{st['external_table']['table_name'].lower()}" for st in self.contents['table']]
        src_tables = [
            f"{d.lower()}.{s.lower()}.{t.lower()}"
            for d in self.source_model.model
            for s in self.source_model.model[d]['schemas'] for t in self.source_model.model[d]['schemas'][s]]

        missing_model = (set(yaml_tables).difference(src_tables))

        if len(missing_model) > 0:
            msg = "Identified tables in the remapping YAML which do not exist in our source model.\n"
            msg += '\n'.join(missing_model)
            output_message(msg, "warning")
            # A missing table in the source model should be picked up and fixed by the
            # main migration, given that it exists in the target model

    def migrate(self):
        st = time.time()
        output_message("Starting YAML migration process...")
        errors = []
        self.tables_used_for_renaming = []
        self.table_columns = {}

        # ============
        job_progress = Progress(
            "{task.description}",
            SpinnerColumn(),
            BarColumn(),
            TextColumn("[progress.percentage]{task.percentage:>3.0f}%"),
        )

        t_cnt = len([t for t in self.contents['table']])
        c_cnt = len([c for t in self.contents['table'] for c in t['column']])

        job_tables = job_progress.add_task(
            "Processing table mappings", total=t_cnt)
        job_columns = job_progress.add_task(
            "Processing column mappings", total=c_cnt)

        total = sum(task.total for task in job_progress.tasks)
        overall_progress = Progress()
        overall_task = overall_progress.add_task("All Jobs", total=int(total))

        progress_table = Table.grid()
        progress_table.add_row(
            Panel.fit(
                overall_progress,
                title="[b]Overall YAML Remapping Progress",
                subtitle="All yaml remapping tasks to be executed",
                border_style="green",
                padding=(
                    2,
                    2)),
            Panel.fit(
                job_progress,
                title="[b]YAML remapping Tasks",
                subtitle="Individual YAML remapping tasks being executed",
                border_style="red",
                padding=(
                    1,
                    2)),
        )

        with Live(progress_table, refresh_per_second=10):
            for table in self.contents['table']:
                output_message(
                    f"\nMigrating table {table['external_table']['falcon_table']}")
                # ------------------------------------------------------------------------------------------------
                # Most of the mapping should have been done in the DDL compare already, so let's first check if we
                # have a mapping for this table and the columns
                # ------------------------------------------------------------------------------------------------
                # Get the table mappings
                yaml_table_mappings = self.mapping_details.get(
                    'YAML', 'TABLE', table['external_table']['falcon_db'],
                    table['external_table']['falcon_schema'],
                    table['external_table']['falcon_table'])
                table_mappings = self.mapping_details.get(
                    'DDL', 'TABLE', table['external_table']['falcon_db'],
                    table['external_table']['falcon_schema'],
                    table['external_table']['falcon_table'])
                col_mappings = self.mapping_details.get(
                    'DDL', 'COLUMN', table['external_table']['falcon_db'],
                    table['external_table']['falcon_schema'],
                    table['external_table']['falcon_table'])
                yaml_columns = [c['external_column'].casefold() for t in self.contents['table']
                                if t['external_table']['falcon_db'].casefold() ==
                                table['external_table']['falcon_db'].casefold() and
                                t['external_table']['falcon_schema'].casefold() ==
                                table['external_table']['falcon_schema'].casefold() and
                                t['external_table']['falcon_table'].casefold() ==
                                table['external_table']['falcon_table'].casefold() for c in t['column']]
                if len(yaml_table_mappings) == 1 and yaml_table_mappings[0].status == 'OVERRIDE':
                    table['external_table']["db_name"] = yaml_table_mappings[0].tar_database
                    table['external_table']["schema_name"] = yaml_table_mappings[0].tar_schema
                    table['external_table']["table_name"] = yaml_table_mappings[0].tar_table
                    table['external_table']['mapping_status'] = 'MAPPED'
                    for col in table['column']:
                        col['mapping_status'] = 'MAPPED'
                        col_mappings = self.mapping_details.get(
                            'YAML', 'COLUMN', table['external_table']['falcon_db'],
                            table['external_table']['falcon_schema'],
                            table['external_table']['falcon_table'],
                            col['external_column'],
                            True)
                        if len(col_mappings) == 1:
                            col['external_column'] = col_mappings[0].tar_column
                            col['data_type'] = col_mappings[0].tar_datatype.upper()
                        else:
                            errors.append(
                                ("Cannot find override column for YAML overriden table ",
                                 f"{table['external_table']['db_name']}.{table['external_table']['schema_name']}.",
                                 f"{table['external_table']['table_name']} in override file"))
                        if not overall_progress.finished:
                            job_progress.advance(job_columns)
                            completed = sum(
                                task.completed for task in job_progress.tasks)
                            overall_progress.update(
                                overall_task, completed=completed)

                elif len(table_mappings) == 1:
                    #  Table mapped
                    table['external_table']["db_name"] = table_mappings[0].tar_database
                    table['external_table']["schema_name"] = table_mappings[0].tar_schema
                    table['external_table']["table_name"] = table_mappings[0].tar_table
                    table['external_table']['mapping_status'] = 'MAPPED'

                    output_message(
                        ''.join(
                            ("Table mapped successfully mapped to ",
                             f"{table['external_table']['db_name']}.{table['external_table']['schema_name']}.",
                             f"{table['external_table']['table_name']}")))
                    if [MigrationUtils.fuzzy_strip(m.src_column.casefold()) for m in col_mappings].sort() == [
                            MigrationUtils.fuzzy_strip(y) for y in yaml_columns].sort():
                        output_message("All columns successfully mapped")

                        for col in table['column']:
                            col['mapping_status'] = 'MAPPED'
                            col_mappings = self.mapping_details.get(
                                'DDL', 'COLUMN', table['external_table']['falcon_db'],
                                table['external_table']['falcon_schema'],
                                table['external_table']['falcon_table'],
                                col['external_column'],
                                True)

                            if len(col_mappings) == 1:
                                col['external_column'] = col_mappings[0].tar_column
                                dt = datatype(
                                    self._general_config,
                                    self._source_config,
                                    self._target_config,
                                    self._general_config.get(
                                        'MIGRATION').get('TARGET_PLATFORM'),
                                    col_mappings[0].tar_datatype.upper(),
                                    col_mappings[0].tar_datatype_length,
                                    col_mappings[0].tar_datatype_decimal)
                                col['data_type'] = self._target_config['DATATYPE_MAPPINGS'][
                                    dt.format_type(True)]['YAML_TYPE']
                            else:
                                errors.append(''.join(
                                    ("Cannot find override column for DDL overriden table ",
                                     f"{table['external_table']['db_name']}.{table['external_table']['schema_name']}.",
                                     f"{table['external_table']['table_name']} in override file")))
                            if not overall_progress.finished:
                                job_progress.advance(job_columns)
                                completed = sum(
                                    task.completed for task in job_progress.tasks)
                                overall_progress.update(
                                    overall_task, completed=completed)

                else:
                    # So we have no mapping for the table, this is most likely that the table did not exist in the
                    # source model (as the DDL compare is done source model<->target model). If we get here in the
                    # process means that it does appear in the remapping YAML, so we will need to try to map the
                    # YAML directly to target

                    tar_tables_with_matching_columns = self.target_model.table_fuzzy_search(
                        table['external_table']
                        ['falcon_db'],
                        table['external_table']
                        ['falcon_schema'],
                        table['external_table']
                        ['falcon_table'],
                        [sc['external_column']
                         for sc in table['column']],
                        self.mapping_details, 'DDL')
                    if tar_tables_with_matching_columns:
                        if tar_tables_with_matching_columns['rank'] == 100:
                            table['external_table']["db_name"] = tar_tables_with_matching_columns['database']
                            table['external_table']["schema_name"] = tar_tables_with_matching_columns['schema']
                            table['external_table']["table_name"] = tar_tables_with_matching_columns['table']
                            table['external_table']['mapping_status'] = 'MAPPED'
                        else:
                            # No 100% mapping, outputting for confirmation
                            self.mapping_details.merge_record(
                                mapping_record(
                                    mapping_category="YAML", mapping_type="TABLE",
                                    src_database=table['external_table']['falcon_db'],
                                    src_schema=table['external_table']['falcon_schema'],
                                    src_table=table['external_table']['falcon_table'],
                                    tar_database=tar_tables_with_matching_columns['database'],
                                    tar_schema=tar_tables_with_matching_columns['schema'],
                                    tar_table=tar_tables_with_matching_columns['table']))

                        for col in table['column']:

                            # There must always be a match, as we compared on column lists
                            c_mapping = [
                                {"dt": self.target_model.model[d]['schemas'][s][t][c],
                                 "column_name": c} for d in self.target_model.model
                                if d == tar_tables_with_matching_columns['database'].lower()
                                for s in self.target_model.model[d]['schemas']
                                if s.lower() == tar_tables_with_matching_columns['schema'].lower()
                                for t in self.target_model.model[d]['schemas'][s]
                                if t.lower() == tar_tables_with_matching_columns['table'].lower()
                                for c in self.target_model.model[d]['schemas'][s][t]
                                if MigrationUtils.fuzzy_strip(col['external_column']) == MigrationUtils.fuzzy_strip(c)][
                                0]

                            if tar_tables_with_matching_columns['rank'] == 100:
                                col['mapping_status'] = 'MAPPED'
                                col['external_column'] = c_mapping['column_name']
                                col['data_type'] = self._target_config['DATATYPE_MAPPINGS'][
                                    c_mapping['dt'].format_type(True)]['YAML_TYPE']
                            else:
                                # Also output the columns for confirmation
                                self.mapping_details.merge_record(
                                    mapping_record(
                                        mapping_category="YAML", mapping_type="COLUMN",
                                        src_database=table['external_table']['falcon_db'],
                                        src_schema=table['external_table']['falcon_schema'],
                                        src_table=table['external_table']['falcon_table'],
                                        src_column=col['external_column'],
                                        src_datatype=col['data_type'],
                                        src_datatype_length=None, src_datatype_decimal=None,
                                        tar_database=tar_tables_with_matching_columns['database'],
                                        tar_schema=tar_tables_with_matching_columns['schema'],
                                        tar_table=tar_tables_with_matching_columns['table'],
                                        tar_column=c_mapping['column_name'],
                                        tar_datatype=c_mapping['dt'].basetype,
                                        tar_datatype_length=c_mapping['dt'].length,
                                        tar_datatype_decimal=c_mapping['dt'].decimal))
                            if not overall_progress.finished:
                                job_progress.advance(job_columns)
                                completed = sum(
                                    task.completed for task in job_progress.tasks)
                                overall_progress.update(
                                    overall_task, completed=completed)

                    else:
                        self.mapping_details.merge_record(
                            # table_mapping_record=mapping_record(
                            mapping_record(
                                mapping_category="YAML", mapping_type="TABLE",
                                src_database=table['external_table']['falcon_db'],
                                src_schema=table['external_table']['falcon_schema'],
                                src_table=table['external_table']['falcon_schema'],
                                tar_database=table['external_table']['falcon_db'],
                                tar_schema=table['external_table']['falcon_schema'],
                                tar_table=table['external_table']['falcon_schema']))
                        for col in table['column']:
                            self.mapping_details.merge_record(
                                mapping_record(
                                    mapping_category="YAML", mapping_type="COLUMN",
                                    src_database=table['external_table']['falcon_db'],
                                    src_schema=table['external_table']['falcon_schema'],
                                    src_table=table['external_table']['falcon_table'],
                                    src_column=col['external_column'],
                                    src_datatype=col['data_type'],
                                    src_datatype_length=None, src_datatype_decimal=None,
                                    tar_database=table['external_table']['falcon_db'],
                                    tar_schema=table['external_table']['falcon_schema'],
                                    tar_table=table['external_table']['falcon_table'],
                                    tar_column=col['external_column'],
                                    tar_datatype=col['data_type'],
                                    tar_datatype_length=None, tar_datatype_decimal=None))
                            if not overall_progress.finished:
                                job_progress.advance(job_columns)
                                completed = sum(
                                    task.completed for task in job_progress.tasks)
                                overall_progress.update(
                                    overall_task, completed=completed)

                if not overall_progress.finished:
                    job_progress.advance(job_tables)
                    completed = sum(
                        task.completed for task in job_progress.tasks)
                    overall_progress.update(overall_task, completed=completed)

        self.mapping_details.export()
        # Validate the YAML for unmapped, duplicates
        if len(errors) > 0:
            output_message(
                "\nThe following errors occurred during migration:" + f"--{errors[0]}", "error")

        yaml_validated = self.validate_yaml_mappings()
        et = time.time()
        elapsed_time = round(et - st, 1)
        status_msg = f"Migration completed in {elapsed_time} seconds."
        output_message(status_msg, "success" if yaml_validated else "error")

        if not yaml_validated:
            raise EYAMLValidationError(self._general_config)

        output_message(''.join(("The YAML file was successfully migrated and can be found here ",
                                f'{os.getcwd()}/{self._general_config["FILE_LOCATIONS"]["TAR_YAML_FILE_NAME"][2:]}.')),
                       "success")
        self.cleanup_and_write()

    def cleanup_and_write(self):
        # Cleans up YAML from the additional attributes
        if self._general_config.get('YAML_PROCESSING').get('YAML_CLEANUP'):
            for table in self.contents['table']:
                tbl_cleanup = self._general_config.get(
                    'YAML_PROCESSING').get('YAML_TABLE_CLEAN_UP')
                # ONLY FOR ADW
                if self._general_config.get('MIGRATION').get('TARGET_PLATFORM') == "ADW":
                    tbl_cleanup.append('db_name')
                for key in tbl_cleanup:
                    if key in table['external_table']:
                        table['external_table'].pop(key)

                for col in table['column']:
                    for key in self._general_config.get('YAML_PROCESSING').get('YAML_COL_CLEAN_UP'):
                        if key in col:
                            col.pop(key)
        with open(self._general_config.get('FILE_LOCATIONS').get('TAR_YAML_FILE_NAME'), 'w') as file:
            yaml.dump(self.contents, file, Dumper=yaml.RoundTripDumper)

    def validate_yaml_mappings(self):
        output_message("Validating YAML mappings....")
        success = True

        # Do all tables have a mapping?
        unmapped_tables = [
            {'database': t['external_table']['falcon_db'],
             'schema': t['external_table']['falcon_schema'],
             'table': t['external_table']['falcon_table']} for t in self.contents['table']
            if t['external_table']['mapping_status'] != "MAPPED"]

        if len(unmapped_tables) > 0:
            success = False
            output_message("We have unmapped tables:")
            output_message(unmapped_tables)

        unmapped_columns = [
            {'database': t['external_table']['falcon_db'],
             'schema': t['external_table']['falcon_schema'],
             'table': t['external_table']['falcon_table'],
             'column': c['external_column'],
             'st': c['mapping_status']} for t in self.contents['table'] for c in t['column']
            if c['mapping_status'] != "MAPPED"]
        if len(unmapped_columns) > 0:
            success = False
            output_message("We have unmapped columns:")
            output_message(unmapped_columns)

        dup_sources = [
            t
            for t in Counter(
                [(f"{t['external_table']['falcon_db']}.{t['external_table']['falcon_schema']}.",
                  f"{t['external_table']['falcon_table']}") for t in self.contents['table']])
            if
            Counter(
                [(f"{t['external_table']['falcon_db']}.{t['external_table']['falcon_schema']}.",
                  f"{t['external_table']['falcon_table']}") for t in self.contents['table']])[t] > 1]
        if len(dup_sources) > 0:
            success = False
            output_message(
                "The following sources have been mapped more than once:")
            output_message(dup_sources)

        dup_targets = [
            t
            for t in Counter(
                [(f"{t['external_table']['db_name']}.{t['external_table']['schema_name']}.",
                  f"{t['external_table']['table_name']}") for t in self.contents['table']])
            if
            Counter(
                [(f"{t['external_table']['db_name']}.{t['external_table']['schema_name']}.",
                  "{t['external_table']['table_name']}") for t in self.contents['table']])[t] > 1]
        if len(dup_targets) > 0:
            success = False
            output_message(
                "The following targets have been mapped more than once:")
            output_message(dup_targets)

        if success:
            output_message("Validation successful")

        return success

# ======================================================================================================================
# CLASS mapping_record
# ======================================================================================================================


class mapping_record:
    mapping_category = None
    mapping_type = None
    src_database = None
    src_schema = None
    src_table = None
    src_column = None
    src_datatype = None
    src_datatype_length = None
    src_datatype_decimal = None
    tar_database = None
    tar_schema = None
    tar_table = None
    tar_column = None
    tar_datatype = None
    tar_datatype_length = None
    tar_datatype_decimal = None
    status = None
    rank = None

    def __init__(self, **mapping_details):
        if 'status' not in mapping_details or mapping_details['status'] is None:
            mapping_details['status'] = 'UNMAPPED'
        self._set_values(mapping_details)

    def __iter__(self):
        return iter(
            [self.mapping_category, self.mapping_type, self.src_database, self.src_schema, self.src_table, self.
             src_column, self.src_datatype, self.src_datatype_length, self.src_datatype_decimal, self.tar_database,
             self.tar_schema, self.tar_table, self.tar_column, self.tar_datatype, self.tar_datatype_length, self.
             tar_datatype_decimal, self.status, self.rank])

    def update(self, **mapping_details):
        self._set_values(mapping_details)

    def _set_values(self, mapping_details):
        for mapping_col, mapping_value in mapping_details.items():
            setattr(self, mapping_col, mapping_value)

    def mark_mapped(self):
        self.status = 'MAPPED'

# ======================================================================================================================
# CLASS mapping_details
# ======================================================================================================================


class mapping_details:
    mappings = []
    comments = {}
    notifications = {}

    def __init__(self, general_config, source_config, target_config, source_cdw,
                 target_cdw, source_files_processed, target_files_processed):
        self._general_config = general_config
        self._source_config = source_config
        self._target_config = target_config
        self._source_files_processed = source_files_processed
        self._target_files_processed = target_files_processed
        self.source_cdw = source_cdw
        self.target_cdw = target_cdw
        self.load_overrides()

    def add_notification(self, notification):
        if notification.table not in self.notifications:
            self.notifications[notification.table] = []
        self.notifications[notification.table].append(notification)

    def merge_record(self, mapping_record):
        updated = False
        # For each mapping check if we need to update or insert it, if the existing mapping is an override
        # the mapping will not be updated
        for m in self.mappings:
            if m.mapping_category.casefold() == mapping_record.mapping_category.casefold() and \
                    m.mapping_type.casefold() == mapping_record.mapping_type.casefold() and \
                    m.src_database.casefold() == mapping_record.src_database.casefold() and \
                    m.src_schema.casefold() == mapping_record.src_schema.casefold() and \
                    m.src_table.casefold() == mapping_record.src_table.casefold() and \
                    ((m.mapping_type.casefold() == 'column'
                      and m.src_column.casefold() == mapping_record.src_column.casefold())
                     or m.mapping_type.casefold() == 'table'):
                if m.status.casefold() != 'override':
                    m.__dict__.update(mapping_record.__dict__)
                updated = True
        if not updated:
            self.mappings.append(mapping_record)

    def validate_override_file(self):
        invalid_data_types = [
            {'db': dt.tar_database, 's': dt.tar_schema, 't': dt.tar_table,
                'c': dt.tar_column, 'dt': dt.tar_datatype}
            for dt in self.mappings
            if dt.tar_datatype
            not in list([re.sub(r'\([^)]*\)', '', m) for m in self._target_config['DATATYPE_MAPPINGS']]) and dt.tar_datatype
            != '']

        if len(invalid_data_types) > 0:
            raise EInvalidDataTypes(invalid_data_types, "override file")

    def load_overrides(self, filter='OVERRIDE'):
        if Path(self._general_config.get('FILE_LOCATIONS').get('MANUAL_OVERRIDES')).is_file():
            with open(self._general_config.get('FILE_LOCATIONS').get('MANUAL_OVERRIDES')) as csv_file:
                csv_reader = csv.reader(csv_file, delimiter=',')
                line_count = 0
                for row in csv_reader:
                    if line_count > 0 and row[16] == filter:
                        self.merge_record(mapping_record(mapping_category=row[0],
                                                         mapping_type=row[1],
                                                         src_database=row[2],
                                                         src_schema=row[3],
                                                         src_table=row[4],
                                                         src_column=row[5],
                                                         src_datatype=row[6],
                                                         src_datatype_length=row[7],
                                                         src_datatype_decimal=row[8],
                                                         tar_database=row[9],
                                                         tar_schema=row[10],
                                                         tar_table=row[11],
                                                         tar_column=row[12],
                                                         tar_datatype=row[13],
                                                         tar_datatype_length=row[14],
                                                         tar_datatype_decimal=row[15],
                                                         status=row[16],
                                                         rank=row[17]))
                    line_count += 1
            self.validate_override_file()

    def export(self, status_filter=["UNMAPPED", "OVERRIDE"]):
        export_set = [m for m in self.mappings if m.status in status_filter]
        if len(export_set) > 0:
            with open(self._general_config.get('FILE_LOCATIONS').get('MANUAL_OVERRIDES'), "w") as stream:
                writer = csv.writer(stream)
                # Not to happy with the list comp here, must be a better way to get props in order without methods
                writer.writerow([x for ind, x in enumerate(
                    list(mapping_record.__dict__.keys())) if 19 > ind > 0])
                writer.writerows(export_set)

    def get(self, mapping_category, mapping_type, db_name, schema_name,
            table_name, column_name=None, fuzzy_col_match=False):
        return [m for m in self.mappings
                if m.status != 'UNMAPPED'
                and m.mapping_category == mapping_category
                and m.mapping_type == mapping_type
                and m.src_database.casefold() == db_name.casefold()
                and m.src_schema.casefold() == schema_name.casefold()
                and m.src_table.casefold() == table_name.casefold()
                and (column_name is None or (not (fuzzy_col_match)
                                             and m.src_column.casefold() == column_name.casefold())
                     or (fuzzy_col_match
                         and MigrationUtils.fuzzy_strip(m.src_column).casefold() ==
                         MigrationUtils.fuzzy_strip(column_name).casefold()))
                ]

    def table_available_for_matching(self, mapping_category, db_name, schema_name, table_name):
        return len([m for m in self.mappings
                    if m.mapping_type == 'TABLE'
                    and m.mapping_category == mapping_category
                    and m.tar_database == db_name
                    and m.tar_schema == schema_name
                    and m.tar_table == table_name]) == 0

    def generate_report(self, ddl_mapping_time, src_stats, tar_stats):
        report = comparison_report(self._general_config)

        report.add_report_element(report_section_title(
            'Model Comparison - Validation Summary', True))

        # Comparison Summary Table
        report.add_report_element(table_comparison_summary(
            title="DDL Comparison Summary",
            caption=f"All elements validated in {str(round(ddl_mapping_time, 2))} seconds",
            headers=["Elements", "Source", "Target", "Total"],
            data=[
                ["Number of databases", src_stats['db_cnt'], tar_stats['db_cnt'], src_stats['db_cnt'] +
                 tar_stats['db_cnt']],
                ["Number of schemas", src_stats['sch_cnt'], tar_stats['sch_cnt'], src_stats['sch_cnt'] +
                 tar_stats['sch_cnt']],
                ["Number of tables", src_stats['tbl_cnt'], tar_stats['tbl_cnt'], src_stats['tbl_cnt'] +
                 tar_stats['tbl_cnt']],
            ]
        ))

        # --------------------------------------------------------------------------------------------------
        # Ranking explained:
        #       100.0 : Perfect match: same table name (case insensitive),
        #               same columns (fuzzy matched) and same number of columns
        # 75.0 - 85.0 : Different table names, same columns (fuzzy matched) and same number of columns.
        #               The closer the number is to 85, the more similar the two table names are
        #        50.0 : Same table name (case insensitive), source columns are present in target table,
        #               but target table has additional columns
        # 25.0 - 35.0 : Different table names, source columns are present in target table,
        #               but target table has additional columns. The closer the number is to 35, the more
        #               similar the two table names are
        #         0.0 : No match found
        # --------------------------------------------------------------------------------------------------

        report_clarification = f"""
The fuzzy matching process used in the mapping process produced the table mappings displayed above.
Incorrect mappings can be overridden in the mapping overrides file, which can be found here:
{os.getcwd()}/{self._general_config["FILE_LOCATIONS"]["MANUAL_OVERRIDES"][2:]}

Scoring explained:

      Score │ Explanation
════════════╪══════════════════════════════════════════════════════════════════════════════════════════
      100.0 │ Perfect match:
            │ - Same table name (case insensitive)
            │ - Same columns (fuzzy matched) and same number of columns
75.0 - 85.0 │ - Different table names
            │ - Same columns (fuzzy matched) and same number of columns
            │ - The closer the number is to 85, the more similar the two table names are
       50.0 │ - Same table name (case insensitive)
            │ - Source columns are present in target table, but target table has additional columns
25.0 - 35.0 │ - Different table names
            │ - Source columns are present in target table, but target table has additional columns
            │ - The closer the number is to 35, the more similar the two table names are
        0.0 │ No suitable match found
"""
        report.add_report_element(
            table_current_mappings(
                title="Projected mappings",
                clarification=report_clarification,
                headers=["Source FQN", "Target FQN", "Score"],
                data=[[f"{m.src_database}.{m.src_schema}.{m.src_table}"
                       if m.src_database is
                       not None and m.src_schema is
                       not None and m.src_table is not None else "---No suitable match found---",
                       f"{m.tar_database}.{m.tar_schema}.{m.tar_table}"
                       if m.tar_database is
                       not None and m.tar_schema is
                       not None and m.tar_table is not None else "---No suitable match found---",
                       float("{:.2f}".format(float(m.rank) if m.rank is not None and m.rank != '' else 0))]
                      for m in self.mappings if m.mapping_type == 'TABLE']))

        totals = dict(
            sorted(
                {**{'2-LOW': 0, '1-SEVERE': 0},
                    **dict(Counter([c.severity for t in self.notifications for c in self.notifications[t]]))}.items()))

        # Issue Summary
        issue_summary_data = []
        notification_data = dict(sorted(Counter(
            [f"{c.severity} - {c.classification}" for t in self.notifications for c in self.notifications[t]
             if c.severity != '0-INFO']).items()))
        total_count = 0
        for n in notification_data:
            issue_summary_data.append([n, notification_data[n]])
            total_count += notification_data[n]

        report.add_report_element(table_issue_summary(
            title="Summary of issues detected",
            headers=['Issue', 'Count'],
            data=issue_summary_data,
            footers=['TOTAL', total_count],
            msg_if_empty="\n" +
            "**************************************************************************************************\n" +
            "* SUCCESS: Source and target model have been successfully validated and no issues have been found.\n"
            "**************************************************************************************************\n"
        ))

        # Table Issue Summary
        issue_summary_data = []
        for table in self.notifications:
            cnts = dict(sorted({**{'2-LOW': 0, '1-SEVERE': 0}, **
                                dict(Counter([c.severity for c in self.notifications[table]]))}.items()))

            if cnts['2-LOW'] + cnts['1-SEVERE'] > 0:
                issue_summary_data.append(
                    [table, cnts['1-SEVERE'], cnts['2-LOW']])

        report.add_report_element(table_issue_summary(
            title="Summary of table issues detected",
            headers=['Qualified Table Name', 'Severe Issues', 'Minor Issues'],
            data=issue_summary_data,
            footers=['TOTAL', totals['1-SEVERE'], totals['2-LOW']],
            msg_if_empty="\n" +
            "**************************************************************************************************\n" +
            "* SUCCESS: Source and target model have been successfully validated and no issues have been found.\n"
            "**************************************************************************************************\n"
        ))

        report.add_report_element(report_section_title(
            'Model Comparison - Detailed Results per table', True))

        for table in self.notifications:
            cnts = dict(sorted({**{'2-LOW': 0, '1-SEVERE': 0}, **
                                dict(Counter([c.severity for c in self.notifications[table]]))}.items()))

            # Table issue count
            report.add_report_element(report_section_title(
                f'Detailed validation information for {table}'))

            report.add_report_element(table_issue_detail(
                headers=["Qualified Table Name",
                         "Severe Issues", "Minor Issues"],
                data=[[table, cnts['1-SEVERE'], cnts['2-LOW']]]))

            # Table Issue List
            issue_list_data = sorted(
                [c for c in self.notifications[table] if c.severity != '0-INFO'],
                key=lambda d: d.severity)
            issue_data = []
            for cmt in issue_list_data:
                issue_data.append([cmt.severity, cmt.msg])

            report.add_report_element(table_issue_list(
                headers=["Issue Severity", "Issue Description"],
                data=issue_data,
                msg_if_empty="No issues have been reported on this table"
            ))

            report_clarification = """
Above we listed any additional information relevant to the mapping process:
Matching candidates :   The list of tables identified as possible matching candidates with their mapping score.
                        The best candidate will be marked.
Similar tables      :   These are similar tables to the source table, which did not score high enough to be a
                        matching candidate. This gives insight into possible other matches if no proper match has
                        been found
Similarity Percent  :   How similar are the two tables in terms of columns.
                        100% means all the columns of the source table appear in the target table
                        (but target might have more)
"""
            # Table Info List
            info_list_data = []
            for cmt in [c for c in self.notifications[table] if c.severity == '0-INFO']:
                info_list_data.append([cmt.msg])
            report.add_report_element(table_info_list(
                headers=["Additional Information"],
                clarification=report_clarification,
                data=info_list_data,
                msg_if_empty="No additional information available for this table"
            ))

        # Used files table
        report.add_report_element(table_file_list(
            title="Files processed",
            headers=["File Type", "File Location"],
            data=[
                [f"Source Model Files ({len(self._source_files_processed)})", "\n".join(
                    self._source_files_processed)],
                [f"Target Model Files ({len(self._target_files_processed)})", "\n".join(
                    self._target_files_processed)],
                ["Source Business Model", self._general_config.get(
                    'FILE_LOCATIONS').get('BUSINESS_MODEL_FOLDER')]
            ]
        ))

        # Output settings to report
        fmt_settings = [[cat, setting, self._general_config[cat][setting]] for cat in self._general_config if cat not in [
            'DELTA_MIGRATION', 'TEMPLATES'] for setting in self._general_config[cat]]
        report.add_report_element(table_setting_list(
            title="Migration Tools Configuration",
            headers=["Category", "Parameter", "Setting"],
            data=fmt_settings,
            force_justification=['left', 'left', 'left']
        ))

        report.to_file()

    def has_issues(self):
        return len([c for t in self.notifications for c in self.notifications[t]
                    if c.severity in ['2-LOW', '1-SEVERE']])


# ======================================================================================================================
# CLASS connection_migrator
# ======================================================================================================================

class connection_migrator:
    source_model = None
    target_model = None
    mapping_details = None

    def __init__(self, general_config):  # , project_name):
        self._general_config = general_config

        # Validate platforms
        self.check_platform_supported(
            general_config["MIGRATION"]["SOURCE_PLATFORM"])
        self.check_platform_supported(
            general_config["MIGRATION"]["TARGET_PLATFORM"])

        self._source_config = toml.load(
            f"config/{self._general_config['MIGRATION']['SOURCE_PLATFORM'].casefold()}.toml")
        self._target_config = toml.load(
            f"config/{self._general_config['MIGRATION']['TARGET_PLATFORM'].casefold()}.toml")

        # Load the source dbschema model
        self.source_model = dbschema_model(self._general_config.get('FILE_LOCATIONS').get(
            'SOURCE_MODEL_FOLDER'), self._general_config, self._source_config, self._target_config)
        # Load the target dbschema model
        self.target_model = dbschema_model(self._general_config.get('FILE_LOCATIONS').get(
            'TARGET_MODEL_FOLDER'), self._general_config, self._source_config, self._target_config)

        # Debugging
        # self.source_model.write_to_csv('./projects/cmc/output/falcon.csv')
        # self.target_model.write_to_csv('./projects/cmc/output/redshift.csv')

        # Initialise the mapping details
        self.mapping_details = mapping_details(
            self._general_config,
            self._source_config,
            self._target_config,
            self.source_model.cdw,
            self.target_model.cdw,
            self.source_model._source_files_processed,
            self.target_model._source_files_processed)

    def check_platform_supported(self, cdp_name):
        if not Path(f"config/{cdp_name.casefold()}.toml").is_file():
            raise EDatabaseNotSupported(cdp_name)

    def identify_mismatch_candidates(self):
        # Identify source tables for which there are multiple candidates on the
        # target model and there is no table with the same name
        similar_tables = {}
        for db in self.source_model.model:
            for schema in self.source_model.model[db]['schemas']:
                for table in self.source_model.model[db]['schemas'][schema]:
                    col_list = [c for d in self.source_model.model if d.lower() == db.lower()
                                for s in self.source_model.model[d]['schemas'] if s.lower() == schema.lower()
                                for t in self.source_model.model[d]['schemas'][s] if t.lower() == table.lower()
                                for c in self.source_model.model[d]['schemas'][s][t]]

                    tables_with_similar_columns = [
                        f"{tdatabase}.{tschema}.{ttable}"
                        for tdatabase in self.target_model.model
                        for tschema in self.target_model.model[tdatabase]['schemas']
                        for ttable in self.target_model.model[tdatabase]['schemas'][tschema]
                        if [MigrationUtils.fuzzy_strip(c1) for c1 in col_list] ==
                        [MigrationUtils.fuzzy_strip(c2)
                         for c2 in self.target_model.get_column_list_for_table(tdatabase, tschema, ttable)]]
                    if len(tables_with_similar_columns) > 1:
                        similar_tables[f"{db}.{schema}.{table}"] = tables_with_similar_columns

        # Filter all entries where there is no target table with the same name as the source table
        similar_tables_different_names = [
            {"source": s, "target": similar_tables[s]} for s in similar_tables
            if s.split(".")[2] not in [t.split(".")[2] for t in similar_tables[s]]]

        if len(similar_tables_different_names) > 0:
            msg = "We have found tables with similar column definitions in the source and target model and no " + \
                "matching names. This might cause the fuzzy matching to match tables incorrectly. The tables " + \
                "with similar column names are:\n"
            for t in similar_tables_different_names:
                msg += f"\nSource table : {t['source']} \nTarget tables: {','.join(t['target'])}"

            output_message(msg, "warning")

    def map_target_to_source_dt(self, source_dt):
        matched_dts = [re.sub(r'\([^)]*\)', '', dt) for dt in self._target_config['DATATYPE_MAPPINGS']
                       if self._target_config['DATATYPE_MAPPINGS'][dt]['TARGET_TYPE'] == source_dt.upper()]
        if len(matched_dts) == 0:
            # TODO: Can this still happen now we have a data type check at the beginning?
            output_message(
                (f"Could not map source data type {source_dt} to any target data type on CDW ",
                 self._general_config.get('MIGRATION').get('TARGET_PLATFORM')),
                "critical")
        else:
            return matched_dts[0]

    def compare_models(self):
        # Requirements:
        # - SOURCE_MODEL_FOLDER not empty
        # - TARGET_MODEL_FOLDER not empty
        # - BUSINESS_MODEL_FOLDER exists

        if len(os.listdir(self._general_config.get('FILE_LOCATIONS').get('SOURCE_MODEL_FOLDER'))) == 0:
            output_message(
                ("No source model(s) specified in ",
                 self._general_config.get('FILE_LOCATIONS').get('SOURCE_MODEL_FOLDER')), "error")

        if len(os.listdir(self._general_config.get('FILE_LOCATIONS').get('TARGET_MODEL_FOLDER'))) == 0:
            output_message(
                ("No target model(s) specified in ",
                 self._general_config.get('FILE_LOCATIONS').get('TARGET_MODEL_FOLDER')), "error")

        model_found = False
        for file in os.listdir(self._general_config.get('FILE_LOCATIONS').get('BUSINESS_MODEL_FOLDER')):
            if file.endswith(".xls") or file.endswith(".tsv"):
                model_found = True
                break

        if not model_found:
            output_message(
                f"No business model specified in {self._general_config.get('FILE_LOCATIONS').get('BUSINESS_MODEL_FOLDER')}",
                "error")
        else:
            output_message("Start comparing data models....")

            job_progress = Progress(
                "{task.description}",
                SpinnerColumn(),
                BarColumn(),
                TextColumn("[progress.percentage]{task.percentage:>3.0f}%"),
            )

            stats = self.source_model.get_stats()

            job_databases = job_progress.add_task(
                "Validating Databases", total=stats['db_cnt'])
            job_schemas = job_progress.add_task(
                "Validating Schemas", total=stats['sch_cnt'])
            job_tables = job_progress.add_task(
                "Validating Tables", total=stats['tbl_cnt'])
            job_columns = job_progress.add_task(
                "Validating Columns", total=stats['col_cnt'])

            total = sum(task.total for task in job_progress.tasks)
            overall_progress = Progress()
            overall_task = overall_progress.add_task(
                "All Jobs", total=int(total))

            progress_table = Table.grid()
            progress_table.add_row(
                Panel.fit(
                    overall_progress,
                    title="[b]Overall Validation Progress",
                    subtitle="All validation tasks to be executed",
                    border_style="green",
                    padding=(
                        2,
                        2)),
                Panel.fit(
                    job_progress,
                    title="[b]Validation Tasks",
                    subtitle="Individual validation tasks being executed",
                    border_style="red",
                    padding=(
                        1,
                        2)),
            )

            st = time.time()
            self.identify_mismatch_candidates()

            with Live(progress_table, refresh_per_second=10):

                for db in self.source_model.model:
                    for s in self.source_model.model[db]['schemas']:
                        for t in self.source_model.model[db]['schemas'][s]:
                            output_message(
                                f"Processing source table {db}.{s}.{t}...")
                            # Initialise mapping record
                            mapping_records = self.mapping_details.get(
                                'DDL', 'TABLE', db, s, t)
                            if len(mapping_records) > 0 and mapping_records[0].status == 'OVERRIDE':
                                output_message(
                                    'Found an override entry for this table')
                                table_mapping_record = mapping_records[0]
                                db_match = table_mapping_record.tar_database
                                s_match = table_mapping_record.tar_schema
                                t_match = table_mapping_record.tar_table
                            else:
                                output_message(
                                    'No mapping details available yet')
                                table_mapping_record = mapping_record(
                                    mapping_category="DDL",
                                    mapping_type="TABLE",
                                    src_database=db,
                                    src_schema=s,
                                    src_table=t)

                            if table_mapping_record.status != "OVERRIDE":
                                output_message("Trying to fuzzy match table")
                                # Identify tables with the same columns, which has not already been used
                                # in another mapping
                                db_match = None
                                s_match = None
                                t_match = None
                                matching_tables = self.target_model.table_fuzzy_search(
                                    db, s, t, self.source_model.get_column_list_for_table(
                                        db, s, t), self.mapping_details, 'DDL')

                                if matching_tables:
                                    output_message(
                                        f"Found a match with score: {matching_tables['rank']} => {matching_tables['database']}.{matching_tables['schema']}.{matching_tables['table']}")
                                    table_mapping_record.rank = matching_tables['rank']
                                    db_match = matching_tables['database']
                                    s_match = matching_tables['schema']
                                    t_match = matching_tables['table']
                                    if matching_tables['rank'] == 100:
                                        table_mapping_record.mark_mapped()
                                    else:
                                        self.mapping_details.add_notification(
                                            E_FUZZY_MATCH_NOTIFICATION(
                                                f"{db}.{s}.{t}", f"{matching_tables['status_msg']}, please review"))
                                else:
                                    output_message(
                                        'No suitable matching table could be found.')
                                    self.mapping_details.add_notification(
                                        E_NO_SUITABLE_MATCH(f"{db}.{s}.{t}"))

                            if (db_match is not None and s_match is not None
                                    and t_match is not None):
                                table_mapping_record.update(
                                    tar_database=db_match,
                                    tar_schema=s_match,
                                    tar_table=t_match)

                                # Column mapping
                                for c in self.source_model.model[db]['schemas'][s][t]:
                                    col_mapping_records = self.mapping_details.get(
                                        'DDL', 'COLUMN', db, s, t, c)
                                    if len(col_mapping_records) > 0 and col_mapping_records[0].status == 'OVERRIDE':
                                        column_mapping_record = col_mapping_records[0]
                                        c_match = column_mapping_record.tar_column
                                    else:
                                        column_mapping_record = mapping_record(
                                            mapping_category="DDL",
                                            mapping_type="COLUMN",
                                            src_database=db,
                                            src_schema=s,
                                            src_table=t,
                                            src_column=c,
                                            src_datatype=self.source_model.model[db]['schemas'][s][t][c].basetype,
                                            src_datatype_length=(
                                                self.source_model.model[db]['schemas'][s][t][c].length),
                                            src_datatype_decimal=(
                                                self.source_model.model[db]['schemas'][s][t][c].decimal),
                                            tar_database=db_match,
                                            tar_schema=s_match,
                                            tar_table=t_match)

                                    if column_mapping_record.status != 'OVERRIDE':
                                        c_match = None
                                        if MigrationUtils.fuzzy_strip(c.casefold()) in [MigrationUtils.fuzzy_strip(
                                            c.casefold())
                                                for c in self.target_model.model[db_match]['schemas'][s_match][t_match]]:
                                            column_mapping_record.update(
                                                tar_column=c)
                                            c_match = [
                                                c1
                                                for c1 in self.target_model.model[db_match]['schemas'][s_match]
                                                [t_match]
                                                if MigrationUtils.fuzzy_strip(c1.casefold()) == MigrationUtils.fuzzy_strip(
                                                    c.casefold())][0]
                                        else:
                                            self.mapping_details.add_notification(
                                                E_COLUMN_NOT_FOUND(f"{db}.{s}.{t}", c))

                                        if c_match is not None:
                                            output_message(
                                                f"Checking matched columns for compatibility: {db}.{s}.{t}.{c}:{self.source_model.model[db]['schemas'][s][t][c].format_type(False)}==>{db_match}.{s_match}.{t_match}.{c_match}:{self.target_model.model[db_match]['schemas'][s_match][t_match][c_match].format_type(False)}")

                                            dt_val = self.source_model.model[db]['schemas'][s][t][c].compare(
                                                self.target_model.model[db_match]['schemas'][s_match][t_match][c_match])

                                            for dts in dt_val:
                                                dts.set_table(f"{db}.{s}.{t}")
                                                dts.msg = f"Column {c}<-->{c_match}: {dts.msg}"
                                                self.mapping_details.add_notification(
                                                    dts)

                                            column_mapping_record.update(
                                                tar_datatype=self.target_model.model[db_match][
                                                    'schemas'][s_match][t_match][c_match].basetype,
                                                tar_datatype_length=self.target_model.model[db_match][
                                                    'schemas'][s_match][t_match][c_match].length,
                                                tar_datatype_decimal=self.target_model.model[db_match][
                                                    'schemas'][s_match][t_match][c_match].decimal,
                                                status=table_mapping_record.status)

                                        self.mapping_details.merge_record(
                                            column_mapping_record)
                                    if not overall_progress.finished:
                                        job_progress.advance(job_columns)
                                        completed = sum(
                                            task.completed for task in job_progress.tasks)
                                        overall_progress.update(
                                            overall_task, completed=completed)

                            else:
                                # Table does not exist, we are going to export it for confirmation, for ease we are
                                # making the suggestion that the target db, schema, table are the same as source
                                # (can be edited anyway)
                                if self._general_config.get('MODEL_VALIDATION').get('COPY_SOURCE_DEF_WHEN_NOT_FOUND'):
                                    table_mapping_record.update(
                                        tar_database=db, tar_schema=s, tar_table=t)

                                # The table does not exists so we need to generated unmapped entries for
                                # all its columns too, we assume here that when the table will exist it
                                # will have identical nameing
                                for c in self.source_model.model[db]['schemas'][s][t]:
                                    col_mapping_records = self.mapping_details.get(
                                        'DDL', 'TABLE', db, s, t, c)
                                    if len(col_mapping_records) > 0 and col_mapping_records[0].status == 'OVERRIDE':
                                        column_mapping_record = col_mapping_records[0]
                                    else:
                                        column_mapping_record = mapping_record(
                                            mapping_category="DDL",
                                            mapping_type="COLUMN",
                                            src_database=db,
                                            src_schema=s,
                                            src_table=t,
                                            src_column=c,
                                            src_datatype=self.source_model.model[db]['schemas'][s][t][c].basetype,
                                            src_datatype_length=self.source_model.model[
                                                db]['schemas'][s][t][c].length,
                                            src_datatype_decimal=self.source_model.model[db]['schemas'][s][t][c].decimal)

                                        if self._general_config.get('MODEL_VALIDATION').get(
                                                'COPY_SOURCE_DEF_WHEN_NOT_FOUND'):
                                            column_mapping_record.update(
                                                tar_database=db,
                                                tar_schema=s,
                                                tar_table=t,
                                                tar_column=c,
                                                tar_datatype=self.map_target_to_source_dt(
                                                    self.source_model.model[db]['schemas'][s][t][c].basetype),
                                                tar_datatype_length=self.source_model.model[
                                                    db]['schemas'][s][t][c].length,
                                                tar_datatype_decimal=self.source_model.model[db]['schemas'][s][t][c].decimal)
                                    if column_mapping_record.status != 'OVERRIDE':
                                        self.mapping_details.merge_record(
                                            column_mapping_record)

                                    if not overall_progress.finished:
                                        job_progress.advance(job_columns)
                                        completed = sum(
                                            task.completed for task in job_progress.tasks)
                                        overall_progress.update(
                                            overall_task, completed=completed)

                            self.mapping_details.merge_record(
                                table_mapping_record)

                            if not overall_progress.finished:
                                job_progress.advance(job_tables)
                                completed = sum(
                                    task.completed for task in job_progress.tasks)
                                overall_progress.update(
                                    overall_task, completed=completed)

                        if not overall_progress.finished:
                            job_progress.advance(job_schemas)
                            completed = sum(
                                task.completed for task in job_progress.tasks)
                            overall_progress.update(
                                overall_task, completed=completed)

                    if not overall_progress.finished:
                        job_progress.advance(job_databases)
                        completed = sum(
                            task.completed for task in job_progress.tasks)
                        overall_progress.update(
                            overall_task, completed=completed)

            et = time.time()
            elapsed_time = round(et - st, 1)

            if self.mapping_details.has_issues() > 0:
                issue_text = '\nThe DDL Comparison raised ' + \
                    f'{self.mapping_details.has_issues()} issues. The mapping overrides file can be found here: ' + \
                    os.getcwd() + "/" + \
                    self._general_config["FILE_LOCATIONS"]["MANUAL_OVERRIDES"][2:] + '.'
                msg_style = "error"
            else:
                issue_text = "No major issues where detected."
                msg_style = "success"

            status_msg = f"Data models validated in {elapsed_time} seconds.\n" + \
                "The validation report can be found here: " + \
                os.getcwd() + "/" + self._general_config["FILE_LOCATIONS"]["DDL_COMPARISON_REPORT"][2:] + \
                f"\n{issue_text}"
            output_message(status_msg, msg_style)

            self.mapping_details.generate_report(
                elapsed_time, self.source_model.get_stats(),
                self.target_model.get_stats())
            self.mapping_details.export()

    def migrate_yaml(self):
        if not self.mapping_details.has_issues() > 0:
            connections = connections_yaml(
                self._general_config,
                self._source_config,
                self._target_config,
                self.source_model,
                self.target_model,
                self.mapping_details)

            connections.compare_yaml_to_source()
            connections.migrate()
            self.mapping_details.export()

        else:
            raise EModelValidationError(
                self.mapping_details.has_issues(), self._general_config)

# TODO: Cover all failure scenarios in myfirstproject
# TODO: Extra groovy parameters --> template


# TODO: Summarise data type errors and missing tables in separate files so easy to distribute to customer (maybe separate section in report as well)
# TODO: Migration pipeline translates certain field names in YAML (so must be in Falcon too?) What is the logic and functionality here? So we can replicate
# TODO: High similar table with same name -> override file? Yeah good point.... I will probably do something on a particular percentages and if the table name matches and the same number of columns then output it...

#!/usr/bin/env python
# coding: utf-8

# # Post Migration Delta

from Preamble import *

print(ts_host)

# ## Gather Object Metadata for new and modified Objects

## specify backup date

print("Backup Year: ")
backup_year = input()
print("Backup Month: ")
backup_month = input()
print("Backup Day: ")
backup_day = input()
import datetime

backupdate = (
    datetime.datetime(int(backup_year or 0), int(backup_month or 0), int(backup_day or 0), 0, 0)
    - datetime.datetime(1970, 1, 1)
).total_seconds()

import pandas as pd

# Start Session

sess = requests.Session()

# Login via API

login(sess)

# Users

UserData = lstUserLists(sess).json()
df = json_normalize(UserData)

df["created_flag"] = df["created"] > backupdate * 1000
new_user_objects = df[df["created_flag"] == True]
df["modified_flag"] = df["modified"] > backupdate * 1000
modified_user_objects = df[df["modified_flag"] == True]
print("Number of Users", len(df.index))
print("Number of Users created ", len(new_user_objects.index))
print("Number of Users modified ", len(modified_user_objects.index))
# UserList_created = new_user_objects['id'].to_list()
# UserList_modified = modified_user_objects['id'].to_list()
new_user_objects.to_csv(".//data//new//Users_created.txt", index=False, encoding="utf8")
modified_user_objects.to_csv(".//data//modified//Users_modified.txt", index=False, encoding="utf8")
df.to_csv(".//data//Users.txt", index=False, encoding="utf8")

# create mapping table to map user_id and name
UserData = lstUsers(sess).json()
df = json_normalize(UserData)
map_user = df[["header.id", "header.name"]]
map_user.to_csv(".//data//mapping_users.txt", index=False, encoding="utf8")
# end of mapping section

# Get high level information about Meta data objects

# Liveboards #######################################################################

PinboardHeader = listPinboards(sess).json()
df = json_normalize(PinboardHeader)
df = pd.merge(map_user, df, left_on="header.id", right_on="author")
df["date_created"] = pd.to_datetime(df["created"] / 1000, unit="s")
df["date_modified"] = pd.to_datetime(df["modified"] / 1000, unit="s")
df["created_flag"] = df["created"] > backupdate * 1000
new_liveboard_objects = df[df["created_flag"] == True]
df["modified_flag"] = df["modified"] > backupdate * 1000
modified_liveboard_objects = df[df["modified_flag"] == True]
# modified_liveboard_objects['timestamp_modified'] = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(int(df['modified']))
# modified_objects
print("Number of Liveboards", len(df.index))
print("Number of Liveboards created ", len(new_liveboard_objects.index))
print("Number of Liveboards modified ", len(modified_liveboard_objects.index))
PinList_created = new_liveboard_objects["id"].to_list()
PinList_modified = modified_liveboard_objects["id"].to_list()
df.to_csv(".//data//Pinboards.txt", index=False, encoding="utf8")
new_liveboard_objects.to_csv(".//data//new//Pinboards_created.txt", index=False, encoding="utf8")
modified_liveboard_objects.to_csv(".//data//modified//Pinboards_modified.txt", index=False, encoding="utf8")


# Answers #######################################################################
try:
    AnswerHeader = listAnswers(sess).json()
    df = json_normalize(AnswerHeader)
    df = pd.merge(map_user, df, left_on="header.id", right_on="author")
    df["date_created"] = pd.to_datetime(df["created"] / 1000, unit="s")
    df["date_modified"] = pd.to_datetime(df["modified"] / 1000, unit="s")
    df["created_flag"] = df["created"] > backupdate * 1000
    new_objects = df[df["created_flag"] == True]
    df["modified_flag"] = df["modified"] > backupdate * 1000
    modified_objects = df[df["modified_flag"] == True]

    print("Number of Answers", len(df.index))
    print("Number of Answers created ", len(new_objects.index))
    print("Number of Answers modified ", len(modified_objects.index))
    AnswerList_created = new_objects["id"].to_list()
    AnswerList_modified = modified_objects["id"].to_list()

    df.to_csv(".//data//Answers.txt", index=False, encoding="utf8")
    new_objects.to_csv(".//data//new//Answers_created.txt", index=False, encoding="utf8")
    modified_objects.to_csv(".//data//modified//Answers_modified.txt", index=False, encoding="utf8")
except:
    print("No Answers available")

# Worksheets #######################################################################

WorksheetHeader = listWorksheets(sess).json()
df = json_normalize(WorksheetHeader)
df = pd.merge(map_user, df, left_on="header.id", right_on="author")
df["date_created"] = pd.to_datetime(df["created"] / 1000, unit="s")
df["date_modified"] = pd.to_datetime(df["modified"] / 1000, unit="s")
df["created_flag"] = df["created"] > backupdate * 1000
new_worksheet_objects = df[df["created_flag"] == True]
df["modified_flag"] = df["modified"] > backupdate * 1000
modified_worksheet_objects = df[df["modified_flag"] == True]

print("Number of Worksheets", len(df.index))
print("Number of Worksheets created ", len(new_worksheet_objects.index))
print("Number of Worksheets modified ", len(modified_worksheet_objects.index))
WSList_created = new_worksheet_objects["id"].to_list()
WSList_modified = modified_worksheet_objects["id"].to_list()

df.to_csv(".//data//Worksheets.txt", index=False, encoding="utf8")
new_worksheet_objects.to_csv(".//data//new//Worksheets_created.txt", index=False, encoding="utf8")
modified_worksheet_objects.to_csv(".//data//modified//Worksheets_modified.txt", index=False, encoding="utf8")


# Tables #######################################################################

TablesHeader = listTables(sess).json()
df = json_normalize(TablesHeader)
df = pd.merge(map_user, df, left_on="header.id", right_on="author")
df["date_created"] = pd.to_datetime(df["created"] / 1000, unit="s")
df["date_modified"] = pd.to_datetime(df["modified"] / 1000, unit="s")
df["created_flag"] = df["created"] > backupdate * 1000
new_table_objects = df[df["created_flag"] == True]
df["modified_flag"] = df["modified"] > backupdate * 1000
modified_table_objects = df[df["modified_flag"] == True]

print("Number of Tables", len(df.index))
print("Number of Tables created ", len(new_table_objects.index))
print("Number of Tables modified ", len(modified_table_objects.index))
TableList_created = new_table_objects["id"].to_list()
TableList_modified = modified_table_objects["id"].to_list()

df.to_csv(".//data//Tables.txt", index=False, encoding="utf8")
new_table_objects.to_csv(".//data//new//Tables_created.txt", index=False, encoding="utf8")
modified_table_objects.to_csv(".//data//modified//Tables_modified.txt", index=False, encoding="utf8")

# View #######################################################################
try:
    ViewHeader = listViews(sess).json()
    df = json_normalize(ViewHeader)
    df = pd.merge(map_user, df, left_on="header.id", right_on="author")
    df["date_created"] = pd.to_datetime(df["created"] / 1000, unit="s")
    df["date_modified"] = pd.to_datetime(df["modified"] / 1000, unit="s")
    df["created_flag"] = df["created"] > backupdate * 1000
    new_objects = df[df["created_flag"] == True]
    df["modified_flag"] = df["modified"] > backupdate * 1000
    modified_objects = df[df["modified_flag"] == True]

    print("Number of Views", len(df.index))
    print("Number of Views created ", len(new_objects.index))
    print("Number of Views modified ", len(modified_objects.index))
    ViewList_created = new_objects["id"].to_list()
    ViewList_modified = modified_objects["id"].to_list()

    df.to_csv(".//data//Views.txt", index=False, encoding="utf8")
    new_objects.to_csv(".//data//new//Views_created.txt", index=False, encoding="utf8")
    modified_objects.to_csv(".//data//modified//Views_modified.txt", index=False, encoding="utf8")
except:
    print("No View available")


## user defined tables

UserDefinedHeader = listUserDefTables(sess).json()
df = json_normalize(UserDefinedHeader)
df.to_csv("UserDefTables.txt", index=False, encoding="utf8")


# Logout
logout(sess)

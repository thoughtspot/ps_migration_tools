#!/usr/bin/env python
# coding: utf-8

# In[22]:


from Preamble import *

ts_host2 = ts_host
print("Connecting to " + ts_host)
print("Connecting to " + ts_host2)


# In[26]:


# Falcon Environment (adjust user, password and hostname accordingly)
if len(username) < 2 or len(password) < 2:
    print("username:")
    username = input()
    print("password:")
    password = input()

ts: ThoughtSpot = ThoughtSpot(server_url=ts_host)
try:
    ts.login(username=username, password=password)
    print("successfully logged in to falcon environment")
except requests.exceptions.HTTPError as e:
    print(e)
    print(e.response.content)

# Cloud Environment

username2 = ""
password2 = ""
if len(username2) < 2 or len(password2) < 2:
    print("username in Cloud:")
    username2 = input()
    print("password in Cloud:")
    password2 = input()
    print("Host URI:")
    ts_host2 = input()

ps: ThoughtSpot = ThoughtSpot(server_url=ts_host2)
try:
    ps.login(username=username2, password=password2)
    print("successfully logged in to cloud environment")
except requests.exceptions.HTTPError as e:
    print(e)
    print(e.response.content)


# # Export and Import of TMl Objects

# In[20]:


# Define AnswerList here:
# Validate only TML upload (default True) set the value to False to overwrite or create new objects
Validate = True

sess = requests.Session()
login(sess)
AnswerHeader = listAnswers(sess).json()
df = json_normalize(AnswerHeader)
NewAnswersDf = pd.read_csv(".//data//new//Answers_created.txt", header=[0])
AnswerList = NewAnswersDf["id"].to_list()
# AnswerList= ['ded0503a-31eb-470f-a5df-4c9bb2acea5d','a4e5298e-2dbf-4d6a-889c-35db9db8b84a']
# Config End

print("Start:")
print("")
NewObjectsList = []
OwnerList = []
FailedToLoad = []
map_guid = []
for GUID in AnswerList:
    object_guid = GUID
    try:
        object_name = df.loc[df["id"] == GUID, "name"].item()
        owner_name = NewAnswersDf.loc[NewAnswersDf["id"] == GUID, "header.name"].item()
        tml = ts.tml.export_tml(guid=GUID)
        print("Export for " + "{}.answer.tml".format(object_name) + " successfull")
        for i in range(0, 10):
            try:
                if tml["answer"]["table"]["table_columns"][i]["headline_aggregation"] == "TABLE_AGGR":
                    tml["answer"]["table"]["table_columns"][i]["headline_aggregation"] = "SUM"
                    print("replace TABLE_AGGR by SUM")
                else:
                    pass
            except:
                pass
        UploadObject = ts.tml.import_tml(tml, create_new_on_server=True, validate_only=Validate)
        print("Status:")
        print(UploadObject["object"][0]["response"]["status"])
        print("New GUID assigned:")
        print(UploadObject["object"][0]["response"]["header"]["id_guid"])
        NewObjectsList.append(UploadObject["object"][0]["response"]["header"]["id_guid"])
        Owner = UploadObject["object"][0]["response"]["header"]["owner_guid"]
        OwnerList.append(Owner)
        new_guid = UploadObject["object"][0]["response"]["header"]["id_guid"]
        map_guid.append([object_guid, new_guid, owner_name, object_name])
        if Validate == True:
            print("Validation for " + "{}.answer.tml".format(object_name) + " successfull")
        else:
            print("Imported " + "{}.answer.tml".format(object_name) + " successfully")
    except:
        print("couldn't save {}.answer.tml".format(object_name))
        FailedToLoad.append(object_name)

df = pd.DataFrame(map_guid, columns=["old_guid", "new_guid", "owner", "object_name"])


# # Transfer Ownership for all Answers that have been created since the Backup

# In[19]:


sess = requests.Session()
login(sess)
df = df.replace("@", "%40", regex=True)  # replacing @ character for all users
for i in range(0, 4):
    ObjGUID = df["new_guid"].iloc[i]
    FromUser = "tsadmin"
    print(df["owner"].iloc[i])
    ToUser = df["owner"].iloc[i]  #'tamofah%40CMC.LOCAL'
    print("Transfering Ownership for " + df["object_name"].iloc[i] + " from " + FromUser + " to " + ToUser)
    TransferOwnership(sess, FromUser, ToUser, ObjGUID)


# # Liveboards migration

# In[40]:


# Define LiveboardList here:
# Validate only TML upload (default True) set the value to False to overwrite or create new objects
Validate = True

sess = requests.Session()
login(sess)
LiveboardHeader = listPinboards(sess).json()
df = json_normalize(LiveboardHeader)
NewLiveboardsDf = pd.read_csv(".//data//new//Pinboards_created.txt", header=[0])
LiveboardList = NewLiveboardsDf["id"].to_list()

# Config End

print("Start:")
print("")
NewObjectsList = []
OwnerList = []
FailedToLoad = []
map_guid = []
for GUID in LiveboardList:
    object_guid = GUID
    try:
        object_name = df.loc[df["id"] == GUID, "name"].item()
        print(object_name)
        owner_name = NewLiveboardsDf.loc[NewLiveboardsDf["id"] == GUID, "header.name"].item()
        tml = ts.tml.export_tml(guid=GUID)
        print("Export for " + "{}.Liveboard.tml".format(object_name) + " successfull")
        for i in range(0, 100):
            for n in range(0, 100):
                try:
                    if (
                        tml["pinboard"]["visualizations"][i]["answer"]["table"]["table_columns"][n][
                            "headline_aggregation"
                        ]
                        == "TABLE_AGGR"
                    ):
                        tml["pinboard"]["visualizations"][i]["answer"]["table"]["table_columns"][n][
                            "headline_aggregation"
                        ] = "SUM"
                        # print(tml['pinboard']['visualizations'][i]['answer']['table']['table_columns'][n]['headline_aggregation'])
                        print("replace TABLE_AGGR by SUM")
                    else:
                        print(
                            tml["pinboard"]["visualizations"][i]["answer"]["table"]["table_columns"][n][
                                "headline_aggregation"
                            ]
                        )
                        pass
                except:
                    pass

        UploadObject = ts.tml.import_tml(tml, create_new_on_server=True, validate_only=Validate)
        print("Status:")
        print(UploadObject["object"][0]["response"]["status"])
        print("New GUID assigned:")
        print(UploadObject["object"][0]["response"]["header"]["id_guid"])
        NewObjectsList.append(UploadObject["object"][0]["response"]["header"]["id_guid"])
        Owner = UploadObject["object"][0]["response"]["header"]["owner_guid"]
        OwnerList.append(Owner)
        new_guid = UploadObject["object"][0]["response"]["header"]["id_guid"]
        map_guid.append([object_guid, new_guid, owner_name, object_name])
        if Validate == True:
            print("Validation for " + "{}.Liveboard.tml".format(object_name) + " successfull")
        else:
            print("Imported " + "{}.Liveboard.tml".format(object_name) + " successfully")
    except:
        print("couldn't save {}.Liveboard.tml".format(object_name))
        FailedToLoad.append(object_name)

df = pd.DataFrame(map_guid, columns=["old_guid", "new_guid", "owner", "object_name"])


# In[41]:


df


# In[ ]:


sess = requests.Session()
login(sess)
df = df.replace("@", "%40", regex=True)  # replacing @ character for all users
for i in range(0, 4):
    ObjGUID = df["new_guid"].iloc[i]
    FromUser = "tsadmin"
    print(df["owner"].iloc[i])
    ToUser = df["owner"].iloc[i]  #'tamofah%40CMC.LOCAL'
    print("Transfering Ownership for " + df["object_name"].iloc[i] + " from " + FromUser + " to " + ToUser)
    TransferOwnership(sess, FromUser, ToUser, ObjGUID)


# In[ ]:


# # WIP

# # Load Objects from json

# In[ ]:


"""
NewObjectsList = [] 
OwnerList = []
FailedToLoad = []
for filename in os.listdir(".//answers//"):
    if filename.endswith(".json"):
        try:
            print('importing '+filename)
            with open('.//answers//{}'.format(filename)) as d:
                dictData = json.load(d)
            
            UploadObject = ts.tml.import_tml(dictData, create_new_on_server=True, validate_only=True)
            #print(UploadObject)
            print(UploadObject['object'][0]['response']['header']['id_guid'])
            NewObjectsList.append(UploadObject['object'][0]['response']['header']['id_guid'])
            Owner = UploadObject['object'][0]['response']['header']['owner_guid']
            OwnerList.append(Owner)
            #username = df.loc[df['header.id'] == GUID, 'header.name'].item()
            #print(username)
        except:
            print('failed to load ' + filename)
            FailedToLoad.append(filename)
    else:
        continue    
"""


# In[ ]:

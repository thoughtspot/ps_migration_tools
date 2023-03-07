from typing import List

import httpx

from migration_tools._version import __version__
from migration_tools._typing import GUID


class HTTPClient(httpx.Client):
    """
    A thin wrapper around the ThoughtSpot V1 APIs.
    """

    def __init__(self, ts_url: str, **opts):
        opts["timeout"] = None
        opts["base_url"] = ts_url
        opts["verify"] = False
        super().__init__(**opts)
        self.headers.update(
            {
                "x-requested-by": "ThoughtSpot",
                "user-agent": f"MigrationTools/{__version__} (+github: thoughtspot/migration_tools)",
                "Accept": "application/json",
                #"Content-Type": "application/json"
            }
        )

    def session_info(self) -> httpx.Response:
        r = self.get("/callosum/v1/tspublic/v1/session/info")
        return r
        
    def login(self, username: str, password: str) -> httpx.Response:
        d = {"username": username, "password": password, "rememberme": True}
        r = self.post("/callosum/v1/tspublic/v1/session/login", data=d)
        return r

    def logout(self) -> httpx.Response:
        r = self.post("/callosum/v1/tspublic/v1/session/logout")
        return r

    def transfer_ownership(self, from_user: str, to_user: str, guids: List[GUID]) -> httpx.Response:
        if isinstance(guids, str):
            guids = [guids]

        p = {"fromUserName": from_user, "toUserName": to_user, "objectsID": '[' + ','.join(guids) + ']'}
        r = self.post("/callosum/v1/tspublic/v1/user/transfer/ownership", params=p)
        return r

    def groups(self) -> httpx.Response:
        r = self.get("/callosum/v1/tspublic/v1/group")
        return r

    def users(self,user_name) -> httpx.Response:
        p = {"name": user_name}
        r = self.get("/callosum/v1/tspublic/v1/user",params=p)
        return r

    def user_list(self) -> httpx.Response:
        r = self.get("/callosum/v1/tspublic/v1/user/list")
        return r

    def modeling_file(self) -> httpx.Response:
        r = self.get("/callosum/v1/modeling/download")
        return r

    def defined_permissions(self, object_type: str, object_guids: List[GUID]) -> httpx.Response:
        p = {"type": object_type, "id": '[' + ','.join(object_guids) + ']', "permissiontype": "DEFINED"}
        r = self.get("/callosum/v1/tspublic/v1/security/metadata/permissions", params=p)
        return r
    
    def defined_permissions_bulk(self, idsbytype: str) -> httpx.Response:
        d = {"idsbytype":idsbytype}
        r = self.post("/callosum/v1/tspublic/v1/security/effectivepermissionbulk", data=d)
        return r

    # parameterized METADATA/LISTOBJECTHEADERS
    def metadata_user_list(self) -> httpx.Response:
        p = {'type': 'USER','category': 'ALL','sort': 'DEFAULT','offset': '-1','showhidden': 'false','batchsize': '-1'}
        r = self.get("/callosum/v1/tspublic/v1/metadata/list", params=p)
        return r
    
    def tag_list(self) -> httpx.Response:
        p = {'type': 'TAG','category': 'ALL','sort': 'DEFAULT','offset': '-1','showhidden': 'false','batchsize': '-1'}
        r = self.get("/callosum/v1/tspublic/v1/metadata/list", params=p)
        return r

    def metadata_group_list(self) -> httpx.Response:
        p = {'type': 'USER_GROUP','category': 'ALL','sort': 'DEFAULT','offset': '-1','showhidden': 'false','batchsize': '-1'}
        r = self.get("/callosum/v1/tspublic/v1/metadata/list", params=p)
        return r

    def pinboard_list(self) -> httpx.Response:
        p = {'type': 'PINBOARD_ANSWER_BOOK','category': 'ALL','sort': 'DEFAULT','offset': '-1','showhidden': 'false','batchsize': '-1'}
        r = self.get("/callosum/v1/tspublic/v1/metadata/list", params=p)
        return r

    def answer_list(self) -> httpx.Response:
        p = {'type': 'QUESTION_ANSWER_BOOK','category': 'ALL','sort': 'DEFAULT','offset': '-1','showhidden': 'false','batchsize': '-1'}
        r = self.get("/callosum/v1/tspublic/v1/metadata/list", params=p)
        return r

    def worksheet_list(self) -> httpx.Response:
        p = {"type": "LOGICAL_TABLE", "subtypes": "[WORKSHEET]",'category': 'ALL','sort': 'DEFAULT','offset': '-1','showhidden': 'false','batchsize': '-1'}
        r = self.get("/callosum/v1/tspublic/v1/metadata/list", params=p)
        return r

    def table_list(self) -> httpx.Response:
        p = {"type": "LOGICAL_TABLE", "subtypes": "[ONE_TO_ONE_LOGICAL]",'category': 'ALL','sort': 'DEFAULT','offset': '-1','showhidden': 'false','batchsize': '-1'}
        r = self.get("/callosum/v1/tspublic/v1/metadata/list", params=p)
        return r

    def view_list(self) -> httpx.Response:
        p = {"type": "LOGICAL_TABLE", "subtypes": "[AGGR_WORKSHEET]",'category': 'ALL','sort': 'DEFAULT','offset': '-1','showhidden': 'false','batchsize': '-1'}
        r = self.get("/callosum/v1/tspublic/v1/metadata/list", params=p)
        return r

    def user_defined_table_list(self) -> httpx.Response:
        p = {"type": "LOGICAL_TABLE", "subtypes": "[USER_DEFINED]",'category': 'ALL','sort': 'DEFAULT','offset': '-1','showhidden': 'false','batchsize': '-1'}
        r = self.get("/callosum/v1/tspublic/v1/metadata/list", params=p)
        return r

    ##### 7.1.1 section #####

    def groups_7(self) -> httpx.Response:
        r = self.get("/callosum/v1/tspublic/v1/group")
        return r

    def users_7(self) -> httpx.Response:
        r = self.get("/callosum/v1/tspublic/v1/user")
        return r

    def pinboard_list_7(self) -> httpx.Response:
        p = {"type": "PINBOARD_ANSWER_BOOK", "offset": -1, "batchsize": 4000}
        r = self.get("/callosum/v1/tspublic/v1/metadata/listobjectheaders", params=p)
        return r

    def answer_list_7(self) -> httpx.Response:
        p = {"type": "QUESTION_ANSWER_BOOK", "offset": -1, "batchsize": -1}
        r = self.get("/callosum/v1/tspublic/v1/metadata/listobjectheaders", params=p)
        return r

    def worksheet_list_7(self) -> httpx.Response:
        p = {"type": "LOGICAL_TABLE", "subtypes": '[WORKSHEET]', "offset": -1, "batchsize": -1}
        r = self.get("/callosum/v1/tspublic/v1/metadata/listobjectheaders", params=p)
        return r

    def table_list_7(self) -> httpx.Response:
        p = {"type": "LOGICAL_TABLE", "subtypes": "[ONE_TO_ONE_LOGICAL]", "offset": -1, "batchsize": -1}
        r = self.get("/callosum/v1/tspublic/v1/metadata/listobjectheaders", params=p)
        return r

    def view_list_7(self) -> httpx.Response:
        p = {"type": "LOGICAL_TABLE", "subtypes": "[AGGR_WORKSHEET]", "offset": -1, "batchsize": -1}
        r = self.get("/callosum/v1/tspublic/v1/metadata/listobjectheaders", params=p)
        return r

    # get tags
    def get_tags(self) -> httpx.Response:
        p = {'type': 'TAG','category': 'ALL','sort': 'DEFAULT','offset': '-1','showhidden': 'false'}
        r = self.get("/", params=p)
        return r
    # create users 

    def create_user(self, UserName: str,DisplayName: str, group_guids: List[str] ) -> httpx.Response:
        d = {'name': UserName,'password': 'fdajkfj!45fLKK','displayname': DisplayName,'groups': '[' + ','.join(group_guids) + ']','usertype': 'LOCAL_USER','visibility': 'DEFAULT'}
        r = self.post("/callosum/v1/tspublic/v1/user", data=d)
        return r

    def create_group(self, UserName: str,DisplayName: str ,DESC: str) -> httpx.Response:
        d = {'name': UserName,'display_name': DisplayName,'description': DESC,'grouptype': 'LOCAL_GROUP','visibility': 'DEFAULT'}
        r = self.post("/callosum/v1/tspublic/v1/group", data=d)
        return r

    # tml export import

    def tml_export(self, guids: List[str]) -> httpx.Response:
        p = {"export_ids": '[' + ','.join(guids) + ']', "formattype": "JSON", "export_associated": False , "export_fqn": False}
        r = self.post("/callosum/v1/tspublic/v1/metadata/tml/export", params=p)
        return r
    
    def import_tml(self, tml: dict, import_policy: str, force_create: bool):
        p = {"imported_objects": tml, "import_policy": import_policy, "force_create": force_create}
        r = self.post("/callosum/v1/tspublic/v1/metadata/tml/import", params=p)
        return r

    def user_read(self, user_guid: GUID) -> httpx.Response:
        p = {
            "principalid": user_guid,
            "offset": -1,
            "batchsize": 2000,
            "minimumaccesslevel": "READ_ONLY",
            "type": "USER",
        }
        r = self.get("/callosum/v1/tspublic/v1/metadata/listas", params=p)
        return r

    def user_modify(self, user_guid: GUID) -> httpx.Response:
        p = {"principalid": user_guid, "offset": -1, "batchsize": 2000, "minimumaccesslevel": "MODIFY", "type": "USER"}
        r = self.get("/callosum/v1/tspublic/v1/metadata/listas", params=p)
        return r

    def group_read(self, group_guid: GUID) -> httpx.Response:
        p = {
            "principalid": group_guid,
            "offset": -1,
            "batchsize": 2000,
            "minimumaccesslevel": "READ_ONLY",
            "type": "USER_GROUP",
        }
        r = self.get("/callosum/v1/tspublic/v1/metadata/listas", params=p)
        return r

    def group_modify(self, group_guid: GUID) -> httpx.Response:
        p = {
            "principalid": group_guid,
            "offset": -1,
            "batchsize": 2000,
            "minimumaccesslevel": "MODIFY",
            "type": "USER_GROUP",
        }
        r = self.get("/callosum/v1/tspublic/v1/metadata/listas", params=p)
        return r


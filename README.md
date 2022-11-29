# Migration Tools

`migration_tools` is a command line interface to help the __ThoughtSpot__ Professional Services team accelerate
migration workflows. Some functionalities require also the installation of [cs_tools](https://thoughtspot.github.io/cs_tools/).


## Installing & Getting Started

The `migration_tools` CLI requires at least __`python` version 3.9__ to run.

```shell
$ python -m venv .ts-venv
$ source .ts-venv/bin/activate  # or windows:    .ts-venv/Scripts/activate 
(.ts-venv) $ pip install https://github.com/thoughtspot/migration_tools/ts_rest_api_and_tml_tools.zip
```
## Tools

### 1. gather_delta

The `gather_delta` function identifies all created and modified objects since the backup date and stores the metadata information into separate subfolders. 
These files are the basis for all further `migration_tools`.

~~~
usage: gather_delta [-h] [--source-ts-url TS_URL] [--source-username USERNAME]
                     [--source-password PASSWORD] [--data-dir DIRECTORY]
                     
arguments:
  -h, --help                   show this help message and exit
  --source-ts_url TS_URL       URL to ThoughtSpot, e.g. https://mycompany.thoughtspot.com
  --source-username USERNAME   Name of the user to log in as.
  --source-password PASSWORD   Password for login of the user to log in as.
  --data-dir                   Path to the data directory, where you want to store the output files.
  
                        
~~~
### 2. migrate_answers

This function migrates all the created/modified answers that have been gathered during step 1.

~~~
usage: migrate_answers [-h] [--source-ts-url TS_URL] [--source-username USERNAME]
                     [--source-password PASSWORD] [--data-dir DIRECTORY] ...
                     
arguments:
  -h, --help                   show this help message and exit
  --source-ts_url TS_URL       URL to ThoughtSpot Falcon instance, e.g. https://mycompany.thoughtspot.com
  --source-username USERNAME   Name of the user to log in as.
  --source-password PASSWORD   Password for login of the user to log in as.
  --dest-ts_url TS_URL         URL to ThoughtSpot Cloud instance, e.g. https://mycompany.thoughtspot.cloud
  --dest-username USERNAME     Name for login to cloud environment.
  --dest-password PASSWORD     Password for login to cloud environment.
  --data-dir   DIRECTORY       Path to the data directory, where you want to store the output files.
  --migration-mode  TYPE       Specify if you want to migrate created or modified answers. valid values:[created, modified]
  --validation-mode BOOL       Run in validation mode only or apply actual changes (default: True). Set to False to migrate all objects.
  
                        
~~~

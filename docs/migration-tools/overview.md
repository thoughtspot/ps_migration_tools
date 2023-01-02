# Migration Tools

`migration_tools` is a command line interface to help the __ThoughtSpot__ Professional Services team accelerate
migration workflows. Some functionalities require also the installation of [cs_tools](https://thoughtspot.github.io/cs_tools/).


## Installing & Getting Started

The `migration_tools` CLI requires at least __`python` version 3.9__ to run.

```shell
$ python -m venv .ts-mig
$ source .ts-mig/bin/activate  # or windows:    .ts-mig/Scripts/activate 
(.ts-venv) $ pip install https://github.com/thoughtspot/migration_tools/migration_tools.zip
```
## Tools

### 1. create_config

The `create_config` function helps to create multiple config.toml files for different environments, which stores credentials and cluster information.


~~~
usage: create_config [-h] [--source-ts-url TS_URL] [--source-username USERNAME]
                     [--source-password PASSWORD] [--data-dir DIRECTORY]
                     
arguments:
  -h, --help                   show this help message and exit
  --config-name                Name of .toml file
  --source-ts_url TS_URL       URL to ThoughtSpot Falcon instance, e.g. https://mycompany.thoughtspot.com
  --source-username USERNAME   Name of the user to log in as.
  --source-password PASSWORD   Password for login of the user to log in as.
  --dest-ts_url TS_URL         URL to ThoughtSpot Cloud instance, e.g. https://mycompany.thoughtspot.cloud
  --dest-username USERNAME     Name for login to cloud environment.
  --dest-password PASSWORD     Password for login to cloud environment.
  --data-dir   DIRECTORY       Path to the data directory, where you want to store the output files.
  
                        
~~~

### 2. gather_delta

The `gather_delta` function identifies all created and modified objects since the backup date and stores the metadata information into separate subfolders. 
These files are the basis for all further `migration_tools`.

~~~
usage: deltas [-h] [--config-name config.toml] [--backup-date DATE]  ...
                     
arguments:
  -h, --help                   show this help message and exit
  --config-name                Name of .toml file
  --backup-date                Backup Date i.e.[2022-01-30]
  
                        
~~~
### 3. migrate_answers

This function migrates all the created/modified answers that have been gathered during step 2.

~~~
usage: migrate_answers [-h] [--config-name config.toml] [--migration-mode created/modified]
                     [--validation-mode True/False]  ...
                     
arguments:
  -h, --help                   show this help message and exit
  --config-name                Name of the .toml file
  --migration-mode  TYPE       Specify if you want to migrate created or modified answers. valid values:[created, modified]
  --validation-mode BOOL       Run in validation mode only or apply actual changes (default: True). Set to False to migrate all objects.
  
                        
~~~
### 4. migrate_liveboards

This function migrates all the created/modified liveboards that have been gathered during step 2.

~~~
usage: migrate_liveboards [-h] [--config-name config.toml] [--migration-mode created/modified]
                     [--validation-mode True/False]  ...
                     
arguments:
  -h, --help                   show this help message and exit
  --config-name                Name of the .toml file
  --migration-mode  TYPE       Specify if you want to migrate created or modified answers. valid values:[created, modified]
  --validation-mode BOOL       Run in validation mode only or apply actual changes (default: True). Set to False to migrate all objects.
  
                        
~~~
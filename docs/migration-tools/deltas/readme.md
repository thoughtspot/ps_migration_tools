
The `deltas` function identifies all created and modified objects since the specified backup date and stores the metadata information into separate subfolders (./projects/`yourprojectname`/output/delta_migration/...). 
These files are the basis for all further `migration_tools`.

~~~
usage: deltas [-h] [--cfg-name CONFIGNAME] [--backup-date DATE]

                     
arguments:
  -h, --help          show this help message and exit
  --cfg-name          Name of the config file
  --backup-date       Date when DL backup was taken (i.e. 2022-12-31).
   
~~~
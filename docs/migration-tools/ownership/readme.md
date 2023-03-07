
This function transfers the ownership for all new created objects (answers, liveboards and worksheets) from tsadmin to the original author. Make sure that you migrated all three kinds of objects before running this command. If there are no new worksheets, the migrate_worksheets command won't create a worksheet_author.csv file. If this command failes, please manually create this csv file and store it in the info folder. 

~~~
usage: transfer_ownership [-h] [--cfg-name] 
                     
arguments:
  -h, --help                   show this help message and exit
  --cfg-name   CONFIGNAME      Name of config.toml file.
  --validate-only Validation   [yes,no]
  
                        
~~~
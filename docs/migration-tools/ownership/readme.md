
This function transfers the ownership for all new created objects (answers, liveboards and worksheets) from tsadmin to the original author. Before running this command make sure you ran `cs_tools searchable` on the falcon instance and store the output files in ./projects/--config-name--/output/delta_migration/cs_tools_falcon/. Don't change any file names in this folder. 

~~~
usage: transfer_ownership [-h] [--cfg-name] 
                     
arguments:
  -h, --help                   show this help message and exit
  --cfg-name   CONFIGNAME      Name of config.toml file.
  
                        
~~~
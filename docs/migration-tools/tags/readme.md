
This function synchronizes all tags from the source instance to the target instance. Before running this command make sure you ran `cs_tools searchable` on the falcon instance and store the output files in ./projects/--config-name--/output/delta_migration/cs_tools_falcon/. Don't change any file names in this folder. 

~~~
usage: apply_tags [-h] [--cfg-name] 
                     
arguments:
  -h, --help                   show this help message and exit
  --cfg-name   CONFIGNAME      Name of config.toml file.
  
                        
~~~
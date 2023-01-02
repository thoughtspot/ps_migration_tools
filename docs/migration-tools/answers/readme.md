
This function migrates all the created/modified answers that have been gathered during the `deltas` step.

~~~
usage: migrate_answers [-h] [--cfg-name] [--migration-mode MODE]
                     [--validation-mode TRUE/FALSE] ...
                     
arguments:
  -h, --help                   show this help message and exit
  --cfg-name   CONFIGNAME      Name of config.toml file.
  --migration-mode  TYPE       Specify if you want to migrate created or modified answers. valid values:[created, modified]
  --validation-mode BOOL       Run in validation mode only or apply actual changes (default: True). Set to False to migrate all objects.
  
                        
~~~
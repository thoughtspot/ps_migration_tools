# Running a delta migration

Before you start a delta migration make sure users and groups are in sync between both instances. 
[cs_tools user-management sync](https://thoughtspot.github.io/cs_tools/user-management/) can help you to achieve this by exporting all users and groups including their assignments and importing those to the new environment.

1. compare source and target instance by running the [deltas](../../migration-tools/deltas/readme) command. This function looks at the created and modified time stamp of the metadata objects and stores them into separate subfolders.
2. run [cs_tools searchable](https://thoughtspot.github.io/cs_tools/cs-tools/searchable/) on the source instance in order to gather all necessary metadata information and store the output in ./projects/myproject/output/delta_migration/cs_tools_falcon
3. migrate worksheets first, as there are maybe dependencies to answers and liveboards. Run all commands in validation mode first and check log files for potential migration issues (version incompatibility).
4. now migrate answers and liveboards (other object types coming soon). 
5. Failed objects will be store in ./projects/myproject/output/delta_migration/failed_`object type`.csv
6. migrate all failed objects from all object types manually or try to fix them in the source system. If you migrate objects manually store their new guid in the failed.csv file. This helps to do reduce manual effort during the next steps. 
7. apply tags for all objects
8. transfer ownership of all objects 
9. share permissions with users and groups (this will only impact new objects, permission delta will be available in the upcoming version of `ps_migration_tools`)


   
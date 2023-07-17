#!/bin/sh
CONFIG="ps"
TYPE='created'
MODE='True'
DATE='2023-07-01'
### DO NOT CHANGE ####
#cs_tools config create --config psint --host https://ps-internal.thoughtspot.cloud --username migration_tools --password Xceabbg9.  --disable_ssl
#cs_tools tools searchable gather csv://$HOME/Documents/toml_files/psinternal.toml  --config psint
migration_tools deltas --cfg-name $CONFIG --backup-date $DATE
migration_tools create_users --cfg-name $CONFIG --validate-only yes --sync-type $TYPE
migration_tools migrate_answers --cfg-name $CONFIG --validation-mode $MODE --migration-mode $TYPE
migration_tools migrate_liveboards --cfg-name $CONFIG --validation-mode $MODE --migration-mode $TYPE
migration_tools migrate_worksheets --cfg-name $CONFIG --validation-mode $MODE --migration-mode $TYPE
#migration_tools transfer_ownership --cfg-name $CONFIG --validate-only yes
#migration_tools share_permissions --cfg-name $CONFIG --validation-mode $MODE

#!/bin/bash
export MIGRATION_TOOLS_PATH="$(
    pwd
)"
export PROJECT_NAME="${2}"
export SOURCE_PLATFORM="${3}"
export TARGET_PLATFORM="${4}"
${1} -x "/Users/misha.beek/My Drive/02_Other_Projects/09_Migration_Tools/migration_tools/external_scripts/parse_model.groovy"

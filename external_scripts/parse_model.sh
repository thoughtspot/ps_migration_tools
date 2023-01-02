#!/bin/bash
export MIGRATION_TOOLS_PATH="$(
    pwd
)"
export PROJECT_NAME="${2}"
export SOURCE_PLATFORM="${3}"
export TARGET_PLATFORM="${4}"
${1} -x "${MIGRATION_TOOLS_PATH}/external_scripts/parse_model.groovy"

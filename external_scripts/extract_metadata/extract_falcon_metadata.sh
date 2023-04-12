#!/bin/bash
#
# Run script: bash extract_falcon_meta_data.sh <dbname> > /dev/null 2>&1
#
PATH=$PATH:/usr/local/scaligent/bin:/usr/local/scaligent/release/bin
DATABASE="$1"
cmd1="show tables $DATABASE;"
result="$(echo ${cmd1} | tql | cut -d '|' -f 1,2 | sed 's/|/./g')"

echo "DATABASE_NAME,SCHEMA_NAME,TABLE_NAME,COLUMN_NAME,DATA_TYPE,LENGTH,DECIMAL" >"./${DATABASE}.csv"
for r in $result; do
    dst="${DATABASE}.${r}"

    cmd2="SHOW TABLE $dst;"
    result=$(echo ${cmd2} | tql >./tmp.out)

    while read p; do
        IFS='|' read -ra st_parts <<<"$p"
        col_name=$(echo ${st_parts[0]} | xargs)
        data_type=$(echo ${st_parts[2]} | xargs)
        if [[ $data_type == "int64" ]]; then
            data_type="bigint"
        elif [[ $data_type == "int32" ]]; then
            data_type="integer"
        fi
        if [[ $data_type == "varchar" ]]; then
            length=$(echo ${st_parts[3]} | xargs)
        else
            length=""
        fi
        if [[ ${#st_parts[@]} > 4 ]]; then
            data_type=$(echo ${st_parts[4]} | xargs)
        fi
        dst_f=$(echo $dst | sed 's/\./,/g')
        echo $dst_f,$col_name,$data_type,$length, >>"./${DATABASE}.csv"
    done <./tmp.out
    rm ./tmp.out
done

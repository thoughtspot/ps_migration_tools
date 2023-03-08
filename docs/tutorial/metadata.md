# Manually collecting metadata

Although migration tools has built-in support for DBSchema, a 3rd party data modelling tool, this requires a license so in most case you will be using the csv file input. In that case you will need to collect a metadata csv file from the source platform (typically ThoughtSpot) and one for your target platform.

Each csv file needs to contain the following columns (and no header row):

    * Database Name
    * Schema Name
    * Table Name
    * Column Name
    * Data Type (i.e. NUMBER in NUMBER(38,10))
    * Data Type Length (i.e. 38 in NUMBER(38,10))
    * Data Type Precision (i.e. 10 in NUMBER(38,10))

This section will list the way you can collect this information from the various platforms

## ThoughtSpot

## SnowFlake

    `SELECT table_catalog,table_schema,table_name,column_name,data_type,numeric_precision,numeric_precision_radix
    FROM <yourdatabase>.information_schema.columns
    WHERE table_catalog NOT IN ('information_schema');'

Run the above query for each database you want to include in your analysis. You can keep them in seperate files or merge then all in 1 big file (as the database in specified in the first column). When the query has completed, save the results to csv file and remove the header line.

## Google Big Query

TBD

## RedShift

TBD

## Oracle ADW

TBD

## Azure Synaps

TBD
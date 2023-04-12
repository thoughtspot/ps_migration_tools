SELECT
      t.table_catalog AS database_name,
      t.table_schema AS schema_name,
      t.table_name AS table_name,
      c.column_name,
      c.data_type,
      CASE WHEN c.character_maximum_length IS NOT NULL THEN
            c.character_maximum_length
      ELSE
            c.numeric_precision
      END AS length,
      coalesce(c.numeric_scale, NULL) AS decimal
FROM
      information_schema.tables t
      LEFT JOIN information_schema.columns c ON t.table_schema = c.table_schema
            AND t.table_name = c.table_name
WHERE
      table_type = 'VIEW'
      /* Use this if we are sure we are only using views on SF and nothing else */
      AND t.table_schema != 'INFORMATION_SCHEMA'
      /* Additional filters you can place here (and on db) to narrow down the results */
ORDER BY
      schema_name,
      database_name,
      schema_name,
      table_name;


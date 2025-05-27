SELECT current_database();

-- See all schemas in the current database
SELECT schema_name
FROM information_schema.schemata;

SET search_path TO public;

SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_type = 'BASE TABLE'
  AND table_schema NOT IN ('pg_catalog', 'information_schema');






  SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';

CREATE TABLE public.my_table (
    id SERIAL PRIMARY KEY,
    name TEXT
);

SET search_path TO public;


ALTER USER postgres SET search_path TO public;

 SELECT current_database();
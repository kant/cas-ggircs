set client_min_messages to warning;
create extension if not exists pgtap;
reset client_min_messages;

--TODO: **Will likely need to be updated to include materialized views when looping through all tables**
    -- ie: join table_name and materialized_view_name then loop through the joined result

begin;

-- TODO: set search_path to change dynamically for each schema, I don't think this will work once
--       schemas other than ggircs_swrs become populated with tables
set search_path to ggircs_swrs,public;

select plan(1652);

/** Check table compliance **/

-- GUIDELINE: All tables should have descriptions
-- Check all tables for an existing description (regex '.+')
with mvnames as (select matviewname from pg_matviews where schemaname like 'ggircs%')
select matches(
               obj_description(mv::regclass, 'pg_class'),
               '.+',
               format('Materialized view has a description. Violation: %I', mv)
           )
from mvnames f(mv);
--
-- --GUIDELINE GROUP: Enforce table naming conventions
-- -- GUIDELINE: Names are lower-case with underscores_as_word_separators
-- -- Check that all materialized view names do not return a match of capital letters or non-word characters
with mvnames as (select matviewname from pg_matviews where schemaname like 'ggircs%')
select doesnt_match(
               mv,
               '[A-Z]|\W',
               format('Materialized view names are lower-case and separated by underscores. Violation: %I', mv)
           )
from mvnames f(mv);
--
-- -- TODO: Names are singular
-- -- POSTGRES stemmer
-- -- ACTIVE RECORD (Ruby/Rails)
--
-- -- GUIDELINE: Avoid reserved keywords (ie. COMMENT -> [name]_comment) https://www.drupal.org/docs/develop/coding-standards/list-of-sql-reserved-words
-- -- create table from csv list of reserved words
create table csv_import_fixture
(
    csv_column_fixture text
);
\copy csv_import_fixture from './test/fixture/sql_reserved_words.csv' delimiter ',' csv;
-- -- test that schema does not contain any table names that intersect with reserved words csv dictionary
with reserved_words as (select csv_column_fixture from csv_import_fixture),
schema_names as (select schema_name from information_schema.schemata where schema_name like 'ggircs%')
select hasnt_materialized_view(
               sch,
               res,
               format('Materialized view names avoid reserved keywords. Violation: %I', res)
           )
from reserved_words as rtmp (res)
cross join schema_names as stmp (sch);
drop table csv_import_fixture;
--
-- GUIDELINE: All tables must have a unique primary key
-- pg_TAP built in test functuon for checking all tables in schema have a primary key
-- with mvnames as (select matviewname from pg_matviews where schemaname like 'ggircs%')
-- select has_(
--                mv, format('Table has primary key. Violation: %I', mv)
--            )
-- from mvnames f(mv);

-- -- TODO: Related tables must have foreign key constraints : FK column names must match PK name from parent

select *
from finish();

rollback;
-- Deploy ggircs:swrs/public/schema to pg

begin;

create schema ggircs;
comment on schema ggircs is 'A schema containing the loaded data from SWRS. This schema contains the data available in Metabase';

commit;

-- Verify ggircs:ciip_table_fuel on pg

begin;

select pg_catalog.has_table_privilege('ciip.fuel', 'select');

rollback;

-- Revert ggircs:materialized_view_address from pg

begin;

drop materialized view swrs_transform.address;

commit;

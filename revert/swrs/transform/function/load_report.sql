-- Revert ggircs:function_load_report from pg

begin;

drop function swrs_transform.load_report;

commit;

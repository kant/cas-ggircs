-- Revert ggircs:function_export_report_to_ggircs from pg

begin;

drop function ggircs_swrs.export_report_to_ggircs;

commit;
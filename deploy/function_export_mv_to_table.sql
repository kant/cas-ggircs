-- Deploy ggircs:function_export_mv_to_table to pg
-- requires:
  -- table_ghgr_import materialized_view_report materialized_view_final_report
  -- materialized_view_facility materialized_view_organisation
  -- materialized_view_address materialized_view_contact
  -- materialized_view_naics materialized_view_identifier
  -- materialized_view_permit materialized_view_parent_organisation
  -- materialized_view_activity materialized_view_unit materialized_view_fuel
  -- materialized_view_emission materialized_view_additional_data

begin;

create or replace function ggircs_swrs.export_mv_to_table()
  returns void as
$function$
  begin

    -- Refresh materialized views
    perform ggircs_swrs.refresh_materialized_views('with data');

    -- Populate tables
    -- REPORT
    perform ggircs_swrs.export_report_to_ggircs();

    -- ORGANISATION
    perform ggircs_swrs.export_organisation_to_ggircs();

    -- FACILITY
    perform ggircs_swrs.export_facility_to_ggircs();

    -- ACTIVITY
    perform ggircs_swrs.export_activity_to_ggircs();

    -- UNIT
    perform ggircs_swrs.export_unit_to_ggircs();

    -- IDENTIFIER
    perform ggircs_swrs.export_identifier_to_ggircs();

    -- NAICS
    perform ggircs_swrs.export_naics_to_ggircs();

    -- FUEL
    perform ggircs_swrs.export_fuel_to_ggircs();

    -- EMISSION
    perform ggircs_swrs.export_emission_to_ggircs();

    -- PERMIT
    perform ggircs_swrs.export_permit_to_ggircs();

    -- PARENT ORGANISATION
    perform ggircs_swrs.export_parent_organisation_to_ggircs();

    -- ADDRESS
    perform ggircs_swrs.export_address_to_ggircs();

    -- CONTACT
    perform ggircs_swrs.export_contact_to_ggircs();

    -- ADDITIONAL DATA
    perform ggircs_swrs.export_additional_data_to_ggircs();

    -- MEASURED EMISSION FACTOR
    delete from ggircs.measured_emission_factor;
    insert into ggircs.measured_emission_factor (id, ghgr_import_id, fuel_id,
                                                 activity_name, sub_activity_name, unit_name, sub_unit_name,
                                                 measured_emission_factor_amount, measured_emission_factor_gas, measured_emission_factor_unit_type)

    select _measured_emission_factor.id, _measured_emission_factor.ghgr_import_id, _fuel.id,
           _measured_emission_factor.activity_name, _measured_emission_factor.sub_activity_name, _measured_emission_factor.unit_name, _measured_emission_factor.sub_unit_name,
           _measured_emission_factor.measured_emission_factor_amount, _measured_emission_factor.measured_emission_factor_gas, _measured_emission_factor.measured_emission_factor_unit_type

    from ggircs_swrs.measured_emission_factor as _measured_emission_factor

    inner join ggircs_swrs.final_report as _final_report on _measured_emission_factor.ghgr_import_id = _final_report.ghgr_import_id
    --FK Measured Emission Factor -> Fuel
    left join ggircs_swrs.fuel as _fuel
      on _measured_emission_factor.ghgr_import_id = _fuel.ghgr_import_id
      and _measured_emission_factor.process_idx = _fuel.process_idx
      and _measured_emission_factor.sub_process_idx = _fuel.sub_process_idx
      and _measured_emission_factor.activity_name = _fuel.activity_name
      and _measured_emission_factor.sub_activity_name = _fuel.sub_activity_name
      and _measured_emission_factor.unit_name = _fuel.unit_name
      and _measured_emission_factor.sub_unit_name = _fuel.sub_unit_name
      and _measured_emission_factor.substance_idx = _fuel.substance_idx
      and _measured_emission_factor.substances_idx = _fuel.substances_idx
      and _measured_emission_factor.sub_unit_name = _fuel.sub_unit_name
      and _measured_emission_factor.units_idx = _fuel.units_idx
      and _measured_emission_factor.unit_idx = _fuel.unit_idx
      and _measured_emission_factor.fuel_idx = _fuel.fuel_idx
      ;


    -- Refresh materialized views with no data
    perform ggircs_swrs.refresh_materialized_views('with no data');
  end;

$function$ language plpgsql volatile ;

commit;

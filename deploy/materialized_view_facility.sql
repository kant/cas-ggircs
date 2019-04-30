-- Deploy ggircs:materialized_view_facility to pg
-- requires: schema_ggircs_swrs
-- requires: table_ghgr_import
-- requires: materialized_view_report

begin;

create materialized view ggircs_swrs.facility as (
  -- Select the XML reports from ghgr_imports table and get the Facility ID and Report ID from reports table
  with x as (
    select _report.id               as report_id,
           _report.swrs_report_id   as swrs_report_id,
           _ghgr_import.xml_file     as source_xml,
           _ghgr_import.imported_at  as imported_at,
           _report.swrs_facility_id as swrs_facility_id
    from ggircs_swrs.report as _report
           inner join ggircs_swrs.ghgr_import as _ghgr_import
                      on _report.ghgr_id = _ghgr_import.id
    order by _report.id desc
  )
       -- Walk the XML to extract facility details
       -- coalesce results from VerifyTombstone (vt) and RegistrationData (rd)

  select row_number() over (order by report_id asc)                                     as id,
         x.report_id,
         x.swrs_facility_id,
         coalesce(vt_facility_details.facility_name, rd_facility_details.facility_name) as facility_name,
         rd_facility_details.facility_type,
         coalesce(vt_facility_details.relationship_type,
                  rd_facility_details.relationship_type)                                as relationship_type,
         coalesce(vt_facility_details.portability_indicator,
                  rd_facility_details.portability_indicator)                            as portability_indicator,
         coalesce(vt_facility_details.status, rd_facility_details.status)               as status,
         coalesce(vt_facility_details.latitude, rd_facility_details.latitude)           as latitude,
         coalesce(vt_facility_details.longitude, rd_facility_details.longitude)         as longitude,
         row_number() over (
           partition by swrs_facility_id
           order by
             imported_at desc,
             x.report_id desc
           )                                                                            as swrs_facility_history_id

  from x,
       xmltable(
           '/ReportData'
           passing source_xml
           columns
             facility_name varchar(1000) path './RegistrationData/Facility/Details/FacilityName',
             facility_type varchar(1000) path './ReportDetails/FacilityType', -- null
             relationship_type varchar(1000) path './RegistrationData/Facility/Details/RelationshipType',
             portability_indicator varchar(1000) path './RegistrationData/Facility/Details/PortabilityIndicator',
             status varchar(1000) path './RegistrationData/Facility/Details/Status',
             latitude varchar(1000) path './RegistrationData/Facility/Address/GeographicAddress/Latitude',
             longitude varchar(1000) path './RegistrationData/Facility/Address/GeographicAddress/Longitude'
         ) as rd_facility_details,

       xmltable(
           '/ReportData'
           passing source_xml
           columns
             facility_name varchar(1000) path './VerifyTombstone/Facility/Details/FacilityName',
             relationship_type varchar(1000) path './VerifyTombstone/Facility/Details/RelationshipType',
             portability_indicator varchar(1000) path './VerifyTombstone/Facility/Details/PortabilityIndicator',
             status varchar(1000) path './VerifyTombstone/Facility/Details/Status',
             latitude varchar(1000) path './VerifyTombstone/Facility/Address/GeographicalAddress/Latitude',
             longitude varchar(1000) path './VerifyTombstone/Facility/Address/GeographicalAddress/Longitude'
         ) as vt_facility_details
) with no data;

create unique index ggircs_facility_primary_key on ggircs_swrs.facility (id);
create index ggircs_swrs_facility_history on ggircs_swrs.facility (swrs_facility_history_id);

comment on materialized view ggircs_swrs.facility is 'the materialized view housing all report data pertaining to the reporting facility';
comment on column ggircs_swrs.facility.id is 'The primary key for the materialized view';
comment on column ggircs_swrs.facility.report_id is 'The swrs report id';
comment on column ggircs_swrs.facility.swrs_facility_id is 'The reporting facility swrs id';

comment on column ggircs_swrs.facility.facility_name is 'The name of the reporting facility';
comment on column ggircs_swrs.facility.facility_type is 'The type of the reporting facility';
comment on column ggircs_swrs.facility.relationship_type is 'The type of relationship';
comment on column ggircs_swrs.facility.portability_indicator is 'The portability indicator';
comment on column ggircs_swrs.facility.status is 'The status of the facility';
comment on column ggircs_swrs.facility.latitude is 'The latitude of the reporting facility';
comment on column ggircs_swrs.facility.longitude is 'The longitude of the reporting facility';
comment on column ggircs_swrs.facility.swrs_facility_history_id is 'The id denoting the history attached to the facility (1=latest)';

commit;
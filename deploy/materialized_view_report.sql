-- Deploy ggircs:materialized_view_report to pg
-- requires: schema_ggircs_swrs
-- requires: table_ghgr_import

begin;

create materialized view ggircs_swrs.report as (
  with x as (
    select id          as ghgr_import_id,
           xml_file    as source_xml,
           imported_at as imported_at
    from ggircs_swrs.ghgr_import
    order by ghgr_import_id desc
  )
  select
    --Todo: use sequence for id
    row_number() over (order by ghgr_import_id asc) as id,
    ghgr_import_id,
    x.source_xml,
    x.imported_at,
    report_details.*,
    report_status.*,
    row_number() over (
      partition by report_details.swrs_report_id
      order by
        report_status.submission_date desc,
        ghgr_import_id desc
      )                                      as swrs_report_history_id
  from x,
       xmltable(
           '/ReportData/ReportDetails'
           passing source_xml
           columns
             swrs_report_id numeric(1000,0) not null path 'ReportID[normalize-space(.)]',
             prepop_report_id numeric(1000,0) path 'PrepopReportID[normalize-space(.)]',
             report_type varchar(1000) not null path 'ReportType[normalize-space(.)]',
             swrs_facility_id numeric(1000,0) not null path 'FacilityId[normalize-space(.)]',
             swrs_organisation_id numeric(1000,0) not null path 'OrganisationId[normalize-space(.)]',
             reporting_period_duration numeric(1000,0) not null path 'ReportingPeriodDuration[normalize-space(.)]'
         ) as report_details,

       xmltable(
           '/ReportData/ReportDetails/ReportStatus'
           passing source_xml
           columns
             status varchar(1000) not null path 'Status|ReportStatus[normalize-space(.)]', -- Unknown, In Progress, Submitted, Archived, Completed
             version varchar(1000) path 'Version[normalize-space(.)]',
             submission_date varchar(1000) path 'SubmissionDate[normalize-space(.)]',
             last_modified_by varchar(1000) not null path 'LastModifiedBy[normalize-space(.)]',
             last_modified_date timestamp with time zone path 'LastModifiedDate[normalize-space(.)]',
             update_comment varchar(1000) path 'UpdateComment[normalize-space(.)]'
         ) as report_status
) with no data;


create unique index ggircs_report_primary_key on ggircs_swrs.report (id);
create index ggircs_swrs_report_history on ggircs_swrs.report (swrs_report_history_id);

comment on materialized view ggircs_swrs.report is 'The materialized view housing all report data, derived from ghgr_import table';
comment on column ggircs_swrs.report.id is 'The primary key for the materialized view';
comment on column ggircs_swrs.report.ghgr_import_id is 'The internal primary key for the file';
comment on column ggircs_swrs.report.source_xml is 'The raw xml file imported from GHGR';
comment on column ggircs_swrs.report.imported_at is 'The timestamp noting when the file was imported';
comment on column ggircs_swrs.report.swrs_report_id is 'The swrs report id';
comment on column ggircs_swrs.report.prepop_report_id is 'The prepop report id';
comment on column ggircs_swrs.report.report_type is 'The type of report';
comment on column ggircs_swrs.report.swrs_facility_id is 'The ID for the reporting facility';
comment on column ggircs_swrs.report.swrs_organisation_id is 'The ID for the reporting organisation';
comment on column ggircs_swrs.report.reporting_period_duration is 'The length of the reporting period contained in report';
comment on column ggircs_swrs.report.status is 'The status of the report';
comment on column ggircs_swrs.report.version is 'The report version';
comment on column ggircs_swrs.report.submission_date is 'The date the report was submitted';
comment on column ggircs_swrs.report.last_modified_by is 'The person who last modified the report';
comment on column ggircs_swrs.report.last_modified_date is 'The timestamp recorded in SWRS when the report was last modified';
comment on column ggircs_swrs.report.update_comment is 'The description of the update';
comment on column ggircs_swrs.report.swrs_report_history_id is 'The id denoting the history of the report (1 = latest)';

commit;

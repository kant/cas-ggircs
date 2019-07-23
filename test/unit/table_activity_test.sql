set client_encoding = 'utf-8';
set client_min_messages = warning;
create extension if not exists pgtap;
reset client_min_messages;

begin;
select * from no_plan();

insert into swrs_extract.ghgr_import (xml_file) values ($$
<ReportData xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <RegistrationData>
    <Organisation>
      <Details>
        <BusinessLegalName>Bart Simpson</BusinessLegalName>
        <EnglishTradeName>Bart Simpson</EnglishTradeName>
        <FrenchTradeName/>
        <CRABusinessNumber>12345</CRABusinessNumber>
        <DUNSNumber>0</DUNSNumber>
        <WebSite>www.nhl.com</WebSite>
      </Details>
    </Organisation>
    <Facility>
      <Details>
        <FacilityName>fname</FacilityName>
        <RelationshipType>Owned and Operated</RelationshipType>
        <PortabilityIndicator>N</PortabilityIndicator>
        <Status>Active</Status>
      </Details>
    </Facility>
    <Contacts/>
  </RegistrationData>
  <ReportDetails>
    <ReportID>1234</ReportID>
    <ReportType>R1</ReportType>
    <FacilityId>0000</FacilityId>
    <FacilityType>EIO</FacilityType>
    <OrganisationId>0000</OrganisationId>
    <ReportingPeriodDuration>2025</ReportingPeriodDuration>
    <ReportStatus>
      <Status>Submitted</Status>
      <SubmissionDate>2013-03-27T19:25:55.32</SubmissionDate>
      <LastModifiedBy>Buddy</LastModifiedBy>
    </ReportStatus>
  </ReportDetails>
  <OperationalWorkerReport/>
  <VerifyTombstone>
    <Organisation>
      <Details>
        <BusinessLegalName>Bart Simpson</BusinessLegalName>
        <EnglishTradeName>Bart Simpson</EnglishTradeName>
        <CRABusinessNumber>123456778</CRABusinessNumber>
        <DUNSNumber>00-000-0000</DUNSNumber>
      </Details>
    </Organisation>
    <Facility>
      <Details>
        <FacilityName>Bart Simpson</FacilityName>
      </Details>
    </Facility>
  </VerifyTombstone>
  <ActivityData xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <ActivityPages>
      <Process ProcessName="ElectricityGeneration">
        <SubProcess SubprocessName="Emissions from fuel combustion for electricity generation" InformationRequirement="Required">
        </SubProcess>
      </Process>
      <Process>
        <SubProcess SubprocessName="Additional Reportable Information as per WCI.352(i)(1)-(12)" InformationRequirement="MandatoryAdditional">
          <Amount AmtDomain="PulpAndPaperBlackLiquor" AmtAction="Combusted" AmtPeriod="Annual">168389</Amount>
          <PercentSolidsByWeight>53</PercentSolidsByWeight>
          <PulpAndPaperCarbonates/>
        </SubProcess>
      </Process>
    </ActivityPages>
  </ActivityData>
</ReportData>
$$);

refresh materialized view swrs_transform.report with data;
refresh materialized view swrs_transform.organisation with data;
refresh materialized view swrs_transform.facility with data;
refresh materialized view swrs_transform.activity with data;
refresh materialized view swrs_transform.final_report with data;
select swrs_transform.load_report();
select swrs_transform.load_organisation();
select swrs_transform.load_facility();
select swrs_transform.load_activity();

-- Table swrs.activity exists
select has_table('ggircs'::name, 'activity'::name);

-- Activity has pk
select has_pk('ggircs', 'activity', 'ggircs_activity has primary key');

-- Activity has fk
select has_fk('ggircs', 'activity', 'ggircs_activity has foreign key constraint(s)');

-- Activity has data
select isnt_empty('select * from swrs.activity', 'there is data in swrs.activity');

-- FKey tests
-- Activity -> Facility
select set_eq(
    $$
    select distinct(facility.ghgr_import_id) from swrs.activity
    join swrs.facility
    on
      activity.facility_id = facility.id
      order by ghgr_import_id
    $$,

    'select ghgr_import_id from swrs.facility order by ghgr_import_id',

    'Foreign key facility_id in swrs.activity references swrs.facility.id'
);

-- Activity -> Report
select set_eq(
    $$
    select distinct(report.ghgr_import_id) from swrs.activity
    join swrs.report
    on
      activity.report_id = report.id
      order by report.ghgr_import_id asc
    $$,

    'select distinct(ghgr_import_id) from swrs.report order by ghgr_import_id asc',

    'Foreign key report_id in swrs.activity references swrs.report.id'
);

-- Data in swrs_transform.activity === data in swrs.activity
select set_eq($$
                  select
                      ghgr_import_id,
                      activity_name,
                      process_name,
                      sub_process_name,
                      information_requirement
                  from swrs_transform.activity
                  $$,

                 $$
                 select
                      ghgr_import_id,
                      activity_name,
                      process_name,
                      sub_process_name,
                      information_requirement
                  from swrs.activity
                  $$,

    'data in swrs_transform.activity === swrs.activity');

select * from finish();
rollback;

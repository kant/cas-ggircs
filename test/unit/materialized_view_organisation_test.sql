set client_min_messages to warning;
create extension if not exists pgtap;
reset client_min_messages;

begin;
select plan(21);

-- Test matview report exists in schema swrs_transform
select has_materialized_view('swrs_transform', 'organisation', 'swrs_transform.organisation exists as a materialized view');

-- -- Test column names in matview report exist and are correct
select columns_are('swrs_transform'::name, 'organisation'::name, ARRAY[
    'id'::name,
    'eccc_xml_file_id'::name,
    'swrs_organisation_id'::name,
    'business_legal_name'::name,
    'english_trade_name'::name,
    'french_trade_name'::name,
    'cra_business_number'::name,
    'duns'::name,
    'website'::name

]);

-- -- Test index names in matview report exist and are correct
select has_index('swrs_transform', 'organisation', 'ggircs_organisation_primary_key', 'swrs_transform.organisation has index: ggircs_organisation_primary_key');
--
-- -- Test unique indicies are defined unique
select index_is_unique('swrs_transform', 'organisation', 'ggircs_organisation_primary_key', 'swrs_transform.report index ggircs_organisation_primary_key is unique');
--
-- -- Test columns in matview report have correct types
select col_type_is('swrs_transform', 'organisation', 'eccc_xml_file_id', 'integer', 'swrs_transform.organisation column eccc_xml_file_id has type integer');
select col_type_is('swrs_transform', 'organisation', 'swrs_organisation_id', 'integer', 'swrs_transform.organisation column id has type numeric(1000,0)');
select col_type_is('swrs_transform', 'organisation', 'business_legal_name', 'character varying(1000)', 'swrs_transform.organisation column business_legal_name has type varchar');
select col_type_is('swrs_transform', 'organisation', 'english_trade_name', 'character varying(1000)', 'swrs_transform.organisation column english_trade_name has type varchar');
select col_type_is('swrs_transform', 'organisation', 'french_trade_name', 'character varying(1000)', 'swrs_transform.organisation column french_trade_name has type varchar');
select col_type_is('swrs_transform', 'organisation', 'cra_business_number', 'character varying(1000)', 'swrs_transform.organisation column cra_business_number has type varchar');
select col_type_is('swrs_transform', 'organisation', 'duns', 'character varying(1000)', 'swrs_transform.organisation column duns has type varchar');
select col_type_is('swrs_transform', 'organisation', 'website', 'character varying(1000)', 'swrs_transform.organisation column website has type varchar');

insert into swrs_extract.eccc_xml_file (xml_file) values ($$
    <ReportData xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
      <RegistrationData>
        <Organisation>
          <Details>
            <BusinessLegalName>Ren and Stimpys House</BusinessLegalName>
            <EnglishTradeName/>
            <FrenchTradeName/>
            <CRABusinessNumber>123456789</CRABusinessNumber>
            <DUNSNumber>90210</DUNSNumber>
            <WebSite>www.hockeyisgood.com</WebSite>
          </Details>
        </Organisation>
      </RegistrationData>
      <ReportDetails>
        <ReportID>800855555</ReportID>
        <PrepopReportID>5</PrepopReportID>
        <ReportType>R7</ReportType>
        <FacilityId>666</FacilityId>
        <OrganisationId>1337</OrganisationId>
        <ReportingPeriodDuration>1999</ReportingPeriodDuration>
        <ReportStatus>
          <Status>In Progress</Status>
          <Version>3</Version>
          <LastModifiedBy>Donny Donaldson McDonaldface</LastModifiedBy>
          <LastModifiedDate>2018-09-28T11:55:39.423</LastModifiedDate>
        </ReportStatus>
      </ReportDetails>
    </ReportData>

$$);

refresh materialized view swrs_transform.organisation with data;

--  Test eccc_xml_file_id fk relation
select results_eq(
    $$
    select eccc_xml_file.id from swrs_transform.organisation
    join swrs_extract.eccc_xml_file
    on
    organisation.eccc_xml_file_id =  eccc_xml_file.id
    $$,

    'select id from swrs_extract.eccc_xml_file',

    'Foreign key eccc_xml_file_id ggircs_swrs_organisation reference swrs_extract.eccc_xml_file'
);

select results_eq('select eccc_xml_file_id from swrs_transform.organisation', 'select id from swrs_extract.eccc_xml_file', 'ghgr_swrs.organisation.eccc_xml_file_id references ghgr_swrs.eccc_xml_file.id');
select results_eq('select swrs_organisation_id from swrs_transform.organisation', ARRAY[1337::integer], 'ghgr_swrs.organisation.swrs_organisation_id parsed from xml');
select results_eq('select business_legal_name from swrs_transform.organisation', ARRAY['Ren and Stimpys House'::varchar(1000)], 'ghgr_swrs.organisation.business_legal_name parsed from xml');
select results_eq('select english_trade_name from swrs_transform.organisation', ARRAY[''::varchar], 'ghgr_swrs.organisation.english_trade_name parsed from xml');
select results_eq('select french_trade_name from swrs_transform.organisation', ARRAY[''::varchar], 'ghgr_swrs.organisation.french_trade_name parsed from xml');
select results_eq('select cra_business_number from swrs_transform.organisation', ARRAY[123456789::varchar], 'ghgr_swrs.organisation.cra_business_number parsed from xml');
select results_eq('select duns from swrs_transform.organisation', ARRAY[90210::varchar], 'ghgr_swrs.organisation.duns parsed from xml');
select results_eq('select website from swrs_transform.organisation', ARRAY['www.hockeyisgood.com'::varchar], 'ghgr_swrs.organisation.website parsed from xml');

select finish();
rollback;

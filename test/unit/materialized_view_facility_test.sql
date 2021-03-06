set client_min_messages to warning;
create extension if not exists pgtap;
reset client_min_messages;

begin;
select plan(21);

-- Test matview report exists in schema swrs_transform
select has_materialized_view('swrs_transform', 'facility', 'Materialized view facility exists');

-- Test column names in matview report exist and are correct
select columns_are('swrs_transform'::name, 'facility'::name, ARRAY[
  'id'::name,
  'eccc_xml_file_id'::name,
  'swrs_facility_id'::name,
  'facility_name'::name,
  'facility_type'::name,
  'relationship_type'::name,
  'portability_indicator'::name,
  'status'::name,
  'latitude'::name,
  'longitude'::name
]);

-- Test index names in matview report exist and are correct
select has_index('swrs_transform', 'facility', 'ggircs_facility_primary_key', 'swrs_transform.facility has index: ggircs_facility_primary_key');

-- Test unique indicies are defined unique
select index_is_unique('swrs_transform', 'facility', 'ggircs_facility_primary_key', 'Matview report index ggircs_facility_primary_key is unique');

-- Test columns in matview report have correct types
select col_type_is('swrs_transform', 'facility', 'eccc_xml_file_id', 'integer', 'swrs_transform.facility column _eccc_xml_file_id has type integer');
select col_type_is('swrs_transform', 'facility', 'swrs_facility_id', 'integer', 'swrs_transform.facility column swrs_facility_id has type numeric');
select col_type_is('swrs_transform', 'facility', 'facility_name', 'character varying(1000)', 'swrs_transform.facility column facility_name has type varchar');
select col_type_is('swrs_transform', 'facility', 'relationship_type', 'character varying(1000)', 'swrs_transform.facility column relationship_type has type varchar');
select col_type_is('swrs_transform', 'facility', 'portability_indicator', 'character varying(1000)', 'swrs_transform.facility column portability_indicator has type varchar');
select col_type_is('swrs_transform', 'facility', 'status', 'character varying(1000)', 'swrs_transform.facility column status has type varchar');
select col_type_is('swrs_transform', 'facility', 'latitude', 'numeric', 'swrs_transform.facility column latitude has type varchar');
select col_type_is('swrs_transform', 'facility', 'longitude', 'numeric', 'swrs_transform.facility column longitude has type varchar');

-- insert necessary data into table eccc_xml_file
insert into swrs_extract.eccc_xml_file (xml_file) values ($$
<ReportData xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <RegistrationData>
    <Facility>
      <Details>
        <FacilityName>Stark Tower</FacilityName>
        <RelationshipType>complicated</RelationshipType>
        <PortabilityIndicator>P</PortabilityIndicator>
        <Status>Active</Status>
      </Details>
      <Address>
        <GeographicAddress>
          <Latitude>23.45125</Latitude>
          <Longitude>-90.59062</Longitude>
        </GeographicAddress>
      </Address>
    </Facility>
  </RegistrationData>
  <ReportDetails>
    <FacilityId>123</FacilityId>
  </ReportDetails>
</ReportData>
$$), ($$
<ReportData xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <RegistrationData>
    <Facility>
      <Details>
        <FacilityName>Stark Tower</FacilityName>
        <RelationshipType>complicated</RelationshipType>
        <PortabilityIndicator>P</PortabilityIndicator>
        <Status>Active</Status>
      </Details>
      <Address>
        <GeographicAddress>
          <Latitude>23.45125</Latitude>
          <Longitude>-90.59062</Longitude>
        </GeographicAddress>
      </Address>
    </Facility>
  </RegistrationData>
  <VerifyTombstone>
    <AlwaysSaveToSwimOnCommit>false</AlwaysSaveToSwimOnCommit>
    <Facility>
      <Details>
        <FacilityName>Avengers Compound</FacilityName>
        <RelationshipType>rebuilt</RelationshipType>
        <Status>Active</Status>
      </Details>
      <Address>
        <GeographicalAddress>
          <Latitude>-43.17305</Latitude>
          <Longitude>54 12</Longitude>
        </GeographicalAddress>
      </Address>
    </Facility>
  </VerifyTombstone>
  <ReportDetails>
    <FacilityId>666</FacilityId>
  </ReportDetails>
</ReportData>
$$);

-- refresh necessary views with data
refresh materialized view swrs_transform.facility with data;

-- Test eccc_xml_file_id fk relation
select results_eq(
    $$
    select eccc_xml_file.id from swrs_transform.facility
    join swrs_extract.eccc_xml_file
    on
    facility.eccc_xml_file_id =  eccc_xml_file.id
    order by eccc_xml_file.id desc limit 1
    $$,

    'select id from swrs_extract.eccc_xml_file order by id desc limit 1',

    'Foreign key eccc_xml_file_id ggircs_swrs_facility reference swrs_extract.eccc_xml_file'
);

-- test the columnns for swrs_transform.facility have been properly parsed from xml
select results_eq(
  'select eccc_xml_file_id from swrs_transform.facility',
  'select id from swrs_extract.eccc_xml_file order by id desc',
  'swrs_transform.facility parsed column eccc_xml_file_id'
);
select results_eq(
  'select swrs_facility_id from swrs_transform.facility',
  ARRAY[666::integer, 123::integer],
  'swrs_transform.facility parsed column swrs_facility_id'
);
select results_eq(
  'select facility_name from swrs_transform.facility',
  ARRAY['Avengers Compound'::varchar, 'Stark Tower'::varchar],
  'swrs_transform.facility parsed column facility_name'
);
select results_eq(
  'select relationship_type from swrs_transform.facility',
  ARRAY['rebuilt'::varchar, 'complicated'::varchar],
  'swrs_transform.facility parsed column relationship_type'
);
select results_eq(
  'select portability_indicator from swrs_transform.facility',
  ARRAY['P'::varchar, 'P'::varchar],
  'swrs_transform.facility parsed column portability_indicator'
);
select results_eq(
  'select status from swrs_transform.facility',
  ARRAY['Active'::varchar, 'Active'::varchar],
  'swrs_transform.facility parsed column status'
);
select results_eq(
  'select latitude from swrs_transform.facility',
  ARRAY['-43.17305'::numeric, '23.45125'::numeric],
  'swrs_transform.facility parsed column latitude'
);
select results_eq(
  'select longitude from swrs_transform.facility',
  ARRAY[54::numeric, '-90.59062'::numeric],
  'swrs_transform.facility parsed column longitude'
);

select finish();
rollback;

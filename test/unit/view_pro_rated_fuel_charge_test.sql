set client_encoding = 'utf-8';
set client_min_messages = warning;
create extension if not exists pgtap;
reset client_min_messages;

begin;
select * from no_plan();

-- View should exist
select has_view(
    'swrs', 'pro_rated_fuel_charge',
    'swrs.pro_rated_fuel_charge should be a view'
);

-- Columns are correct
select columns_are('swrs'::name, 'pro_rated_fuel_charge'::name, array[
    'fuel_type'::name,
    'fuel_mapping_id'::name,
    'year'::name,
    'unit_conversion_factor'::name,
    'flat_rate'::name,
    'pro_rated_fuel_charge'::name
]);

-- Column attributes are correct
select col_type_is('swrs', 'pro_rated_fuel_charge', 'fuel_type', 'character varying(1000)', 'pro_rated_fuel_charge.fuel_type column should be type varchar');
select col_hasnt_default('swrs', 'pro_rated_fuel_charge', 'fuel_type', 'pro_rated_fuel_charge.fuel_type column should not have a default value');

select col_type_is('swrs', 'pro_rated_fuel_charge', 'fuel_mapping_id', 'integer', 'pro_rated_fuel_charge.fuel_mapping_id column should be type integer');
select col_hasnt_default('swrs', 'pro_rated_fuel_charge', 'fuel_mapping_id', 'pro_rated_fuel_charge.fuel_mapping_id column should not have a default value');

select col_type_is('swrs', 'pro_rated_fuel_charge', 'year', 'integer', 'pro_rated_fuel_charge.year column should be type integer');
select col_hasnt_default('swrs', 'pro_rated_fuel_charge', 'year', 'pro_rated_fuel_charge.year column should not have a default value');

select col_type_is('swrs', 'pro_rated_fuel_charge', 'unit_conversion_factor', 'integer', 'pro_rated_fuel_charge.unit_conversion_factor column should be type integer');
select col_hasnt_default('swrs', 'pro_rated_fuel_charge', 'unit_conversion_factor', 'pro_rated_fuel_charge.unit_conversion_factor column should not have a default value');

select col_type_is('swrs', 'pro_rated_fuel_charge', 'flat_rate', 'numeric', 'pro_rated_fuel_charge.flat_rate column should be type numeric');
select col_hasnt_default('swrs', 'pro_rated_fuel_charge', 'flat_rate', 'pro_rated_fuel_charge.flat_rate column should not have a default value');

select col_type_is('swrs', 'pro_rated_fuel_charge', 'pro_rated_fuel_charge', 'numeric', 'pro_rated_fuel_charge.pro_rated_fuel_charge column should be type numeric');
select col_hasnt_default('swrs', 'pro_rated_fuel_charge', 'pro_rated_fuel_charge', 'pro_rated_fuel_charge.pro_rated_fuel_charge column should not have a default value');


-- XML fixture for testing
insert into swrs_extract.eccc_xml_file (xml_file) values ($$
<ReportData xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <RegistrationData>
  <Facility>
  </Facility>
    <NAICSCodeList>
      <NAICSCode>
        <NAICSClassification>Chemical Pulp Mills </NAICSClassification>
        <Code>322112</Code>
        <NaicsPriority>Primary</NaicsPriority>
      </NAICSCode>
    </NAICSCodeList>
  </RegistrationData>
  <ReportDetails>
    <ReportID>123500000</ReportID>
    <ReportType>R1</ReportType>
    <FacilityId>0001</FacilityId>
    <FacilityType>ABC</FacilityType>
    <OrganisationId>0000</OrganisationId>
    <ReportingPeriodDuration>2015</ReportingPeriodDuration>
    <ReportStatus>
      <Status>Submitted</Status>
      <SubmissionDate>2013-03-28T19:25:55.32</SubmissionDate>
      <LastModifiedBy>Buddy</LastModifiedBy>
    </ReportStatus>
  </ReportDetails>
  <ActivityData xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <ActivityPages>
      <Process ProcessName="ElectricityGeneration">
        <SubProcess SubprocessName="Emissions from fuel combustion for electricity generation" InformationRequirement="Required">
          <Units UnitType="Cogen Units">
            <Unit>
              <Fuels>
                <Fuel>
                  <FuelType>Wood Waste</FuelType>
                  <FuelClassification>Biomass in Schedule C</FuelClassification>
                  <FuelDescription/>
                  <FuelUnits>bone dry tonnes</FuelUnits>
                  <AnnualFuelAmount>0</AnnualFuelAmount>
                  <AnnualSteamGeneration>290471000</AnnualSteamGeneration>
                </Fuel>
                <Fuel>
                  <FuelType>Residual Fuel Oil (#5 &amp; 6)</FuelType>
                  <FuelClassification>non-biomass</FuelClassification>
                  <FuelDescription/>
                  <FuelUnits>kilolitres</FuelUnits>
                  <AnnualFuelAmount>9441</AnnualFuelAmount>
                  <AnnualWeightedAverageCarbonContent>0.862</AnnualWeightedAverageCarbonContent>
                  <Emissions><Emission></Emission></Emissions>
                </Fuel>
              </Fuels>
            </Unit>
          </Units>
        </SubProcess>
      </Process>
    </ActivityPages>
  </ActivityData>
</ReportData>
$$);

-- Run table export function without clearing the materialized views (for data equality tests below)
SET client_min_messages TO WARNING; -- load is a bit verbose
select swrs_transform.load(true, false);

-- Properly selects fuel charge
select results_eq(
    $$ select flat_rate / unit_conversion_factor from swrs.pro_rated_fuel_charge where fuel_type = 'Residual Fuel Oil (#5 & 6)'$$,

    $$

      select fuel_charge from swrs.fuel
      join swrs.fuel_charge
      on fuel.fuel_mapping_id = fuel_charge.fuel_mapping_id
      where fuel.fuel_type = 'Residual Fuel Oil (#5 & 6)'
      and ('2013-12-31' between fuel_charge.start_date and fuel_charge.end_date)

    $$,

    'swrs.pro_rated_fuel_charge selects proper fuel_charge for fuel_type and year'
);

select * from finish();
rollback;

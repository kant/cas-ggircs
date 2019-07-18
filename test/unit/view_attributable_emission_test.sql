set client_encoding = 'utf-8';
set client_min_messages = warning;
create extension if not exists pgtap;
reset client_min_messages;

begin;
select * from no_plan();

insert into ggircs_swrs.ghgr_import (xml_file) values ($$
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
    <ParentOrganisations/>
  </VerifyTombstone>
  <ActivityData xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <ActivityPages>
      <Process ProcessName="ElectricityGeneration">
        <SubProcess SubprocessName="Emissions from fuel combustion for electricity generation" InformationRequirement="Required">
          <Units UnitType="Cogen Units">
            <Unit>
              <COGenUnit>
                <CogenUnitName>Boiler 16 - hog fuel</CogenUnitName>
                <NameplateCapacity>5.9</NameplateCapacity>
                <NetPower>30165</NetPower>
                <CycleType>Topping</CycleType>
                <ThermalOutputQuantity>886917960</ThermalOutputQuantity>
                <SupplementalFiringPurpose>Electr. Generation</SupplementalFiringPurpose>
              </COGenUnit>
              <Fuels>
                <Fuel>
                  <FuelType>Wood Waste</FuelType>
                  <FuelClassification>Biomass in Schedule C</FuelClassification>
                  <FuelDescription/>
                  <FuelUnits>bone dry tonnes</FuelUnits>
                  <AnnualFuelAmount>0</AnnualFuelAmount>
                  <AnnualSteamGeneration>290471000</AnnualSteamGeneration>
                  <MeasuredEmissionFactors>
                    <MeasuredEmissionFactor>
                      <MeasuredEmissionFactorGas>CO2</MeasuredEmissionFactorGas>
                      <MeasuredEmissionFactorAmount>50000</MeasuredEmissionFactorAmount>
                      <MeasuredEmissionFactorUnitType>g/GJ</MeasuredEmissionFactorUnitType>
                    </MeasuredEmissionFactor>
                    <MeasuredEmissionFactor>
                      <MeasuredEmissionFactorGas>CH4</MeasuredEmissionFactorGas>
                      <MeasuredEmissionFactorAmount>0.966</MeasuredEmissionFactorAmount>
                      <MeasuredEmissionFactorUnitType>g/GJ</MeasuredEmissionFactorUnitType>
                    </MeasuredEmissionFactor>
                  </MeasuredEmissionFactors>
                  <Emissions>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>168038.5773</Quantity>
                      <CalculatedQuantity>168038.5773</CalculatedQuantity>
                      <GasType>CO2bioC</GasType>
                      <Methodology>Methodology 3 (measured CC/Steam)</Methodology>
                    </Emission>
                  </Emissions>
                  <AlternativeMethodologyDescription/>
                </Fuel>
                <Fuel>
                  <FuelType>Residual Fuel Oil (#5 &amp; 6)</FuelType>
                  <FuelClassification>non-biomass</FuelClassification>
                  <FuelDescription/>
                  <FuelUnits>kilolitres</FuelUnits>
                  <AnnualFuelAmount>9441</AnnualFuelAmount>
                  <AnnualWeightedAverageCarbonContent>0.862</AnnualWeightedAverageCarbonContent>
                  <Emissions>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>29819.5973</Quantity>
                      <CalculatedQuantity>29819.5973</CalculatedQuantity>
                      <GasType>CO2nonbio</GasType>
                      <Methodology>Methodology 3 (measured CC/Steam)</Methodology>
                    </Emission>
                  </Emissions>
                  <AlternativeMethodologyDescription/>
                </Fuel>
              </Fuels>
            </Unit>
          </Units>
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
$$), ($$
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
  </RegistrationData>
  <ReportDetails>
    <ReportID>1235</ReportID>
    <ReportType>R1</ReportType>
    <FacilityId>0001</FacilityId>
    <FacilityType>LF_a</FacilityType>
    <OrganisationId>0000</OrganisationId>
    <ReportingPeriodDuration>2020</ReportingPeriodDuration>
    <ReportStatus>
      <Status>Submitted</Status>
      <SubmissionDate>2013-03-28T19:25:55.32</SubmissionDate>
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
    <ParentOrganisations/>
  </VerifyTombstone>
  <ActivityData xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <ActivityPages>
      <Process ProcessName="ElectricityGeneration">
        <SubProcess SubprocessName="Emissions from fuel combustion for electricity generation" InformationRequirement="Required">
          <Units UnitType="Cogen Units">
            <Unit>
              <COGenUnit>
                <CogenUnitName>Boiler 16 - hog fuel</CogenUnitName>
                <NameplateCapacity>5.9</NameplateCapacity>
                <NetPower>30165</NetPower>
                <CycleType>Topping</CycleType>
                <ThermalOutputQuantity>886917960</ThermalOutputQuantity>
                <SupplementalFiringPurpose>Electr. Generation</SupplementalFiringPurpose>
              </COGenUnit>
              <Fuels>
                <Fuel>
                  <FuelType>Wood Waste</FuelType>
                  <FuelClassification>Biomass in Schedule C</FuelClassification>
                  <FuelDescription/>
                  <FuelUnits>bone dry tonnes</FuelUnits>
                  <AnnualFuelAmount>0</AnnualFuelAmount>
                  <AnnualSteamGeneration>290471000</AnnualSteamGeneration>
                  <MeasuredEmissionFactors>
                    <MeasuredEmissionFactor>
                      <MeasuredEmissionFactorGas>CO2</MeasuredEmissionFactorGas>
                      <MeasuredEmissionFactorAmount>50000</MeasuredEmissionFactorAmount>
                      <MeasuredEmissionFactorUnitType>g/GJ</MeasuredEmissionFactorUnitType>
                    </MeasuredEmissionFactor>
                    <MeasuredEmissionFactor>
                      <MeasuredEmissionFactorGas>CH4</MeasuredEmissionFactorGas>
                      <MeasuredEmissionFactorAmount>0.966</MeasuredEmissionFactorAmount>
                      <MeasuredEmissionFactorUnitType>g/GJ</MeasuredEmissionFactorUnitType>
                    </MeasuredEmissionFactor>
                  </MeasuredEmissionFactors>
                  <Emissions>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>168038.5773</Quantity>
                      <CalculatedQuantity>168038.5773</CalculatedQuantity>
                      <GasType>CO2bioC</GasType>
                      <Methodology>Methodology 3 (measured CC/Steam)</Methodology>
                    </Emission>
                  </Emissions>
                  <AlternativeMethodologyDescription/>
                </Fuel>
                <Fuel>
                  <FuelType>Residual Fuel Oil (#5 &amp; 6)</FuelType>
                  <FuelClassification>non-biomass</FuelClassification>
                  <FuelDescription/>
                  <FuelUnits>kilolitres</FuelUnits>
                  <AnnualFuelAmount>9441</AnnualFuelAmount>
                  <AnnualWeightedAverageCarbonContent>0.862</AnnualWeightedAverageCarbonContent>
                  <Emissions>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>29819.5973</Quantity>
                      <CalculatedQuantity>29819.5973</CalculatedQuantity>
                      <GasType>CO2nonbio</GasType>
                      <Methodology>Methodology 3 (measured CC/Steam)</Methodology>
                    </Emission>
                  </Emissions>
                  <AlternativeMethodologyDescription/>
                </Fuel>
              </Fuels>
            </Unit>
          </Units>
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
$$), ($$
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
  </RegistrationData>
  <ReportDetails>
    <ReportID>1236</ReportID>
    <ReportType>R1</ReportType>
    <FacilityId>0002</FacilityId>
    <FacilityType>LFO</FacilityType>
    <OrganisationId>0000</OrganisationId>
    <ReportingPeriodDuration>2020</ReportingPeriodDuration>
    <ReportStatus>
      <Status>Submitted</Status>
      <SubmissionDate>2013-03-28T19:25:55.32</SubmissionDate>
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
    <ParentOrganisations/>
  </VerifyTombstone>
  <ActivityData xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <ActivityPages>
      <Process ProcessName="ElectricityGeneration">
        <SubProcess SubprocessName="Emissions from fuel combustion for electricity generation" InformationRequirement="Required">
          <Units UnitType="Cogen Units">
            <Unit>
              <COGenUnit>
                <CogenUnitName>Boiler 16 - hog fuel</CogenUnitName>
                <NameplateCapacity>5.9</NameplateCapacity>
                <NetPower>30165</NetPower>
                <CycleType>Topping</CycleType>
                <ThermalOutputQuantity>886917960</ThermalOutputQuantity>
                <SupplementalFiringPurpose>Electr. Generation</SupplementalFiringPurpose>
              </COGenUnit>
              <Fuels>
                <Fuel>
                  <FuelType>Wood Waste</FuelType>
                  <FuelClassification>Biomass in Schedule C</FuelClassification>
                  <FuelDescription/>
                  <FuelUnits>bone dry tonnes</FuelUnits>
                  <AnnualFuelAmount>0</AnnualFuelAmount>
                  <AnnualSteamGeneration>290471000</AnnualSteamGeneration>
                  <MeasuredEmissionFactors>
                    <MeasuredEmissionFactor>
                      <MeasuredEmissionFactorGas>CO2</MeasuredEmissionFactorGas>
                      <MeasuredEmissionFactorAmount>50000</MeasuredEmissionFactorAmount>
                      <MeasuredEmissionFactorUnitType>g/GJ</MeasuredEmissionFactorUnitType>
                    </MeasuredEmissionFactor>
                    <MeasuredEmissionFactor>
                      <MeasuredEmissionFactorGas>CH4</MeasuredEmissionFactorGas>
                      <MeasuredEmissionFactorAmount>0.966</MeasuredEmissionFactorAmount>
                      <MeasuredEmissionFactorUnitType>g/GJ</MeasuredEmissionFactorUnitType>
                    </MeasuredEmissionFactor>
                  </MeasuredEmissionFactors>
                  <Emissions>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>168038.5773</Quantity>
                      <CalculatedQuantity>168038.5773</CalculatedQuantity>
                      <GasType>CO2bioC</GasType>
                      <Methodology>Methodology 3 (measured CC/Steam)</Methodology>
                    </Emission>
                  </Emissions>
                  <AlternativeMethodologyDescription/>
                </Fuel>
                <Fuel>
                  <FuelType>Residual Fuel Oil (#5 &amp; 6)</FuelType>
                  <FuelClassification>non-biomass</FuelClassification>
                  <FuelDescription/>
                  <FuelUnits>kilolitres</FuelUnits>
                  <AnnualFuelAmount>9441</AnnualFuelAmount>
                  <AnnualWeightedAverageCarbonContent>0.862</AnnualWeightedAverageCarbonContent>
                  <Emissions>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>29819.5973</Quantity>
                      <CalculatedQuantity>29819.5973</CalculatedQuantity>
                      <GasType>CO2nonbio</GasType>
                      <Methodology>Methodology 3 (measured CC/Steam)</Methodology>
                    </Emission>
                  </Emissions>
                  <AlternativeMethodologyDescription/>
                </Fuel>
              </Fuels>
            </Unit>
          </Units>
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

refresh materialized view ggircs_swrs.report with data;
refresh materialized view ggircs_swrs.organisation with data;
refresh materialized view ggircs_swrs.facility with data;
refresh materialized view ggircs_swrs.activity with data;
refresh materialized view ggircs_swrs.identifier with data;
refresh materialized view ggircs_swrs.naics with data;
refresh materialized view ggircs_swrs.unit with data;
refresh materialized view ggircs_swrs.fuel with data;
refresh materialized view ggircs_swrs.emission with data;
refresh materialized view ggircs_swrs.final_report with data;

select ggircs_swrs.export_report_to_ggircs();
select ggircs_swrs.export_organisation_to_ggircs();
select ggircs_swrs.export_facility_to_ggircs();
select ggircs_swrs.export_activity_to_ggircs();
select ggircs_swrs.export_identifier_to_ggircs();
select ggircs_swrs.export_naics_to_ggircs();
select ggircs_swrs.export_unit_to_ggircs();
select ggircs_swrs.export_fuel_to_ggircs();
select ggircs_swrs.export_emission_to_ggircs();

select has_view(
    'ggircs', 'attributable_emission',
    'ggircs.attributable_emission should be a view'
);

-- Columns are correct
select columns_are('ggircs'::name, 'attributable_emission'::name, array[
     'id'::name::name,
     'ghgr_import_id'::name,
     'fuel_id'::name,
     'activity_id'::name,
     'report_id'::name,
     'facility_id'::name,
     'organisation_id'::name,
     'unit_id'::name,
     'naics_id'::name,
     'activity_name'::name,
     'sub_activity_name'::name,
     'unit_name'::name,
     'sub_unit_name'::name,
     'fuel_name'::name,
     'emission_type'::name,
     'gas_type'::name,
     'methodology'::name,
     'not_applicable'::name,
     'quantity'::name,
     'calculated_quantity'::name,
     'emission_category'::name
]);

-- Attributable Emission has data
select isnt_empty('select * from ggircs.attributable_emission', 'attributable_emission has data');

-- No CO2bioC in attributable_emission
select is_empty($$select * from ggircs.attributable_emission where gas_type='CO2bioC'$$, 'CO2bioC emissions are not in attributable_emission');

-- FKey tests
-- Attributable Emission -> Activity
select set_eq(
    $$
    select activity.activity_name from ggircs.attributable_emission
    join ggircs.activity
    on
      attributable_emission.activity_id = activity.id
    $$,

    $$ select activity.activity_name from ggircs.emission as emission
       join ggircs.fuel as fuel
       on emission.fuel_id = fuel.id
       join ggircs.unit as unit
       on fuel.unit_id = unit.id
       join ggircs.activity as activity
       on unit.activity_id = activity.id
       join ggircs.facility as facility
       on activity.facility_id = facility.id
       and gas_type !='CO2bioC'
       and facility.facility_type != 'EIO'
       and facility.facility_type != 'LFO'
       and activity.sub_process_name not in  ('Additional Reportable Information as per WCI.352(i)(1)-(12)',
                                   'Additional Reportable Information as per WCI.352(i)(13)',
                                   'Additional Reportable Information as per WCI.362(g)(21)',
                                   'Additional information for cement and lime production facilities only (not aggregated in totals)',
                                   'Additional information for cement and lime production facilities only (not aggregated intotals)',
                                   'Additional information required when other activities selected are Activities in Table 2 rows 2, 4, 5 , or 6',
                                   'Additional reportable information')
    $$,

    'Foreign key activity_id in ggircs.attributable_emission references ggircs.activity.id'
);

-- Attributable Emission -> Facility
select set_eq(
    $$
    select facility.facility_name from ggircs.attributable_emission
    join ggircs.facility
    on
      attributable_emission.facility_id = facility.id
    $$,

    $$ select facility.facility_name from ggircs.emission as emission
       join ggircs.facility as facility
       on emission.facility_id = facility.id
       and facility_type != 'EIO'
       and facility_type != 'LFO'
       and gas_type !='CO2bioC' $$,

    'Foreign key facility_id in ggircs.attributable_emission references ggircs.facility.id'
);


-- Attributable Emission -> Fuel
select set_eq(
    $$
    select fuel.fuel_type from ggircs.attributable_emission
    join ggircs.fuel
    on
      attributable_emission.fuel_id = fuel.id
    $$,

    $$ select fuel_type from ggircs.emission as emission
       join ggircs.fuel as fuel
       on emission.fuel_id = fuel.id
       join ggircs.unit as unit
       on fuel.unit_id = unit.id
       join ggircs.activity as activity
       on unit.activity_id = activity.id
       join ggircs.facility as facility
       on activity.facility_id = facility.id
       and gas_type !='CO2bioC'
       and facility.facility_type != 'EIO'
       and facility.facility_type != 'LFO'
       and activity.sub_process_name not in  ('Additional Reportable Information as per WCI.352(i)(1)-(12)',
                                   'Additional Reportable Information as per WCI.352(i)(13)',
                                   'Additional Reportable Information as per WCI.362(g)(21)',
                                   'Additional information for cement and lime production facilities only (not aggregated in totals)',
                                   'Additional information for cement and lime production facilities only (not aggregated intotals)',
                                   'Additional information required when other activities selected are Activities in Table 2 rows 2, 4, 5 , or 6',
                                   'Additional reportable information')
    $$,

    'Foreign key fuel_id in ggircs.attributable_emission references ggircs.fuel.id'
);

-- Attributable Emission -> Naics
select set_eq(
    $$
    select naics.naics_code from ggircs.attributable_emission
    join ggircs.naics
    on
      attributable_emission.naics_id = naics.id
    $$,

    $$ select naics.naics_code from ggircs.emission as emission
       join ggircs.naics as naics
       on emission.naics_id = naics.id
       join ggircs.fuel as fuel
       on emission.fuel_id = fuel.id
       join ggircs.unit as unit
       on fuel.unit_id = unit.id
       join ggircs.activity as activity
       on unit.activity_id = activity.id
       join ggircs.facility as facility
       on activity.facility_id = facility.id
       and gas_type !='CO2bioC'
       and facility.facility_type != 'EIO'
       and facility.facility_type != 'LFO'
       and activity.sub_process_name not in  ('Additional Reportable Information as per WCI.352(i)(1)-(12)',
                                   'Additional Reportable Information as per WCI.352(i)(13)',
                                   'Additional Reportable Information as per WCI.362(g)(21)',
                                   'Additional information for cement and lime production facilities only (not aggregated in totals)',
                                   'Additional information for cement and lime production facilities only (not aggregated intotals)',
                                   'Additional information required when other activities selected are Activities in Table 2 rows 2, 4, 5 , or 6',
                                   'Additional reportable information')
    $$,

    'Foreign key naics_id in ggircs.attributable_emission references ggircs.naics.id'
);

-- Attributable Emission -> Organisation
select set_eq(
    $$
    select organisation.swrs_organisation_id from ggircs.attributable_emission
    join ggircs.organisation
    on
      attributable_emission.organisation_id = organisation.id
    $$,

    $$ select organisation.swrs_organisation_id from ggircs.emission as emission
       join ggircs.organisation as organisation
       on emission.organisation_id = organisation.id
       join ggircs.fuel as fuel
       on emission.fuel_id = fuel.id
       join ggircs.unit as unit
       on fuel.unit_id = unit.id
       join ggircs.activity as activity
       on unit.activity_id = activity.id
       join ggircs.facility as facility
       on activity.facility_id = facility.id
       and gas_type !='CO2bioC'
       and facility.facility_type != 'EIO'
       and facility.facility_type != 'LFO'
       and activity.sub_process_name not in  ('Additional Reportable Information as per WCI.352(i)(1)-(12)',
                                   'Additional Reportable Information as per WCI.352(i)(13)',
                                   'Additional Reportable Information as per WCI.362(g)(21)',
                                   'Additional information for cement and lime production facilities only (not aggregated in totals)',
                                   'Additional information for cement and lime production facilities only (not aggregated intotals)',
                                   'Additional information required when other activities selected are Activities in Table 2 rows 2, 4, 5 , or 6',
                                   'Additional reportable information')
    $$,

    'Foreign key organisation_id in ggircs.attributable_emission references ggircs.organisation.id'
);

-- Attributable Emission -> Report
select set_eq(
    $$
    select report.ghgr_import_id from ggircs.attributable_emission
    join ggircs.report
    on
      attributable_emission.report_id = report.id
    $$,

    $$ select report.ghgr_import_id from ggircs.emission as emission
       join ggircs.report as report
       on emission.report_id = report.id
       join ggircs.fuel as fuel
       on emission.fuel_id = fuel.id
       join ggircs.unit as unit
       on fuel.unit_id = unit.id
       join ggircs.activity as activity
       on unit.activity_id = activity.id
       join ggircs.facility as facility
       on activity.facility_id = facility.id
       and gas_type !='CO2bioC'
       and facility.facility_type != 'EIO'
       and facility.facility_type != 'LFO'
       and activity.sub_process_name not in  ('Additional Reportable Information as per WCI.352(i)(1)-(12)',
                                   'Additional Reportable Information as per WCI.352(i)(13)',
                                   'Additional Reportable Information as per WCI.362(g)(21)',
                                   'Additional information for cement and lime production facilities only (not aggregated in totals)',
                                   'Additional information for cement and lime production facilities only (not aggregated intotals)',
                                   'Additional information required when other activities selected are Activities in Table 2 rows 2, 4, 5 , or 6',
                                   'Additional reportable information')
    $$,

    'Foreign key report_id in ggircs.attributable_emission references ggircs.report.id'
);

-- Attributable Emission -> Unit
select set_eq(
    $$
    select unit.unit_name from ggircs.attributable_emission
    join ggircs.unit
    on
      attributable_emission.unit_id = unit.id
    $$,

    $$ select unit.unit_name from ggircs.emission as emission
       join ggircs.fuel as fuel
       on emission.fuel_id = fuel.id
       join ggircs.unit as unit
       on fuel.unit_id = unit.id
       join ggircs.activity as activity
       on unit.activity_id = activity.id
       join ggircs.facility as facility
       on activity.facility_id = facility.id
       and gas_type !='CO2bioC'
       and facility.facility_type != 'EIO'
       and facility.facility_type != 'LFO'
       and activity.sub_process_name not in  ('Additional Reportable Information as per WCI.352(i)(1)-(12)',
                                   'Additional Reportable Information as per WCI.352(i)(13)',
                                   'Additional Reportable Information as per WCI.362(g)(21)',
                                   'Additional information for cement and lime production facilities only (not aggregated in totals)',
                                   'Additional information for cement and lime production facilities only (not aggregated intotals)',
                                   'Additional information required when other activities selected are Activities in Table 2 rows 2, 4, 5 , or 6',
                                   'Additional reportable information')
    $$,

    'Foreign key unit_id in ggircs.attributable_emission references ggircs.unit.id'
);



select * from finish();
rollback;
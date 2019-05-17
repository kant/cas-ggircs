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
      <Address>
        <PhysicalAddress>
          <StreetNumber>300</StreetNumber>
          <StreetNumberSuffix/>
          <StreetName>A Drive</StreetName>
          <StreetType>Drive</StreetType>
          <StreetDirection>North</StreetDirection>
          <Municipality>Port Alice</Municipality>
          <ProvTerrState>British Columbia</ProvTerrState>
          <PostalCodeZipCode>H0H0H0</PostalCodeZipCode>
          <Country>Canada</Country>
        </PhysicalAddress>
        <MailingAddress>
          <DeliveryMode>Post Office Box</DeliveryMode>
          <POBoxNumber>1</POBoxNumber>
          <StreetNumber>300</StreetNumber>
          <StreetNumberSuffix/>
          <StreetName>A Drive</StreetName>
          <StreetType>Drive</StreetType>
          <Municipality>Port Alice</Municipality>
          <ProvTerrState>British Columbia</ProvTerrState>
          <PostalCodeZipCode>H0H0H0</PostalCodeZipCode>
          <Country>Canada</Country>
          <AdditionalInformation/>
        </MailingAddress>
      </Address>
    </Organisation>
    <Facility>
      <Details>
        <FacilityName>fname</FacilityName>
        <RelationshipType>Owned and Operated</RelationshipType>
        <PortabilityIndicator>N</PortabilityIndicator>
        <Status>Active</Status>
      </Details>
      <Identifiers>
        <IdentifierList>
          <Identifier>
            <IdentifierType>BCGHGID</IdentifierType>
            <IdentifierValue>123456</IdentifierValue>
          </Identifier>
          <Identifier>
            <IdentifierType>GHGRP Identification Number</IdentifierType>
            <IdentifierValue>654321</IdentifierValue>
          </Identifier>
          <Identifier>
            <IdentifierType>National Emission Reduction Masterplan</IdentifierType>
            <IdentifierValue>1234</IdentifierValue>
          </Identifier>
          <Identifier>
            <IdentifierType>National Pollutant Release Inventory Identifier</IdentifierType>
            <IdentifierValue>0000</IdentifierValue>
          </Identifier>
        </IdentifierList>
        <NAICSCodeList>
          <NAICSCode>
            <NAICSClassification>Chemical Pulp Mills </NAICSClassification>
            <Code>123456</Code>
            <NaicsPriority>Primary</NaicsPriority>
          </NAICSCode>
        </NAICSCodeList>
        <Permits>
          <Permit>
            <IssuingAgency>British Columbia</IssuingAgency>
            <PermitNumber>0000</PermitNumber>
          </Permit>
        </Permits>
      </Identifiers>
      <Address>
        <PhysicalAddress>
          <StreetNumber>123</StreetNumber>
          <StreetName>A Drive</StreetName>
          <StreetType>Drive</StreetType>
          <Municipality>Port Alice</Municipality>
          <ProvTerrState>British Columbia</ProvTerrState>
          <PostalCodeZipCode>H0H0H0</PostalCodeZipCode>
          <Country>Canada</Country>
        </PhysicalAddress>
        <MailingAddress>
          <DeliveryMode>Post Office Box</DeliveryMode>
          <POBoxNumber>000</POBoxNumber>
          <StreetNumber>300</StreetNumber>
          <StreetName>A Drive</StreetName>
          <StreetType>Drive</StreetType>
          <Municipality>Port Alice</Municipality>
          <ProvTerrState>British Columbia</ProvTerrState>
          <PostalCodeZipCode>H0H0H0</PostalCodeZipCode>
          <Country>Canada</Country>
          <AdditionalInformation/>
        </MailingAddress>
        <GeographicAddress>
          <Latitude>1.23000</Latitude>
          <Longitude>1.26000</Longitude>
          <UTMZone>1</UTMZone>
          <UTMNorthing>1</UTMNorthing>
          <UTMEasting>1</UTMEasting>
        </GeographicAddress>
      </Address>
      <StackList>
        <Stack>
          <StackNameDescription>power boiler</StackNameDescription>
          <HeightAboveGrade>65.0000</HeightAboveGrade>
          <EquivalentDiameter>2.0000</EquivalentDiameter>
          <AverageExitVelocity>22.100</AverageExitVelocity>
          <AverageExitTemperature>60.000</AverageExitTemperature>
          <Address>
            <GeographicAddress>
              <Latitude>0.00000</Latitude>
              <Longitude>0.00000</Longitude>
            </GeographicAddress>
          </Address>
        </Stack>
        <Stack>
          <StackNameDescription>recovery boiler</StackNameDescription>
          <HeightAboveGrade>92.0000</HeightAboveGrade>
          <EquivalentDiameter>2.2000</EquivalentDiameter>
          <AverageExitVelocity>15.500</AverageExitVelocity>
          <AverageExitTemperature>36.000</AverageExitTemperature>
          <Address>
            <GeographicAddress>
              <Latitude>0.00000</Latitude>
              <Longitude>0.00000</Longitude>
            </GeographicAddress>
          </Address>
        </Stack>
      </StackList>
    </Facility>
    <Contacts/>
    <ParentOrganisations>
      <ParentOrganisation>
        <Details>
          <BusinessLegalName>ABC</BusinessLegalName>
          <CRABusinessNumber>123456789</CRABusinessNumber>
          <PercentageOwned>0</PercentageOwned>
        </Details>
        <Address>
          <PhysicalAddress>
            <UnitNumber/>
            <StreetNumber>0</StreetNumber>
            <StreetNumberSuffix/>
            <StreetName/>
            <Municipality/>
            <PostalCodeZipCode/>
            <AdditionalInformation/>
            <LandSurveyDescription/>
            <NationalTopographicalDescription/>
          </PhysicalAddress>
          <MailingAddress>
            <UnitNumber>1</UnitNumber>
            <StreetNumber>2700</StreetNumber>
            <StreetNumberSuffix/>
            <StreetName>00th</StreetName>
            <StreetType>Avenue</StreetType>
            <Municipality>Vancouver</Municipality>
            <ProvTerrState>British Columbia</ProvTerrState>
            <PostalCodeZipCode>H0H0H0</PostalCodeZipCode>
            <Country>Canada</Country>
            <AdditionalInformation/>
          </MailingAddress>
        </Address>
      </ParentOrganisation>
    </ParentOrganisations>
  </RegistrationData>
  <ReportDetails>
    <ReportID>1234</ReportID>
    <ReportType>R1</ReportType>
    <FacilityId>0000</FacilityId>
    <FacilityType>SFO</FacilityType>
    <OrganisationId>0000</OrganisationId>
    <ReportingPeriodDuration>2012</ReportingPeriodDuration>
    <ReportStatus>
      <Status>Submitted</Status>
      <SubmissionDate>2013-03-28T19:25:55.32</SubmissionDate>
      <LastModifiedBy>Buddy</LastModifiedBy>
    </ReportStatus>
    <ActivityOrSource>
      <ActivityList>
        <Activity>
          <ActivityName>GeneralStationaryCombustion</ActivityName>
          <TableNumber>1</TableNumber>
        </Activity>
        <Activity>
          <ActivityName>MobileCombustion</ActivityName>
          <TableNumber>1</TableNumber>
        </Activity>
        <Activity>
          <ActivityName>ElectricityGeneration</ActivityName>
          <TableNumber>1</TableNumber>
        </Activity>
        <Activity>
          <ActivityName>PulpAndPaperProduction</ActivityName>
          <TableNumber>1</TableNumber>
        </Activity>
      </ActivityList>
    </ActivityOrSource>
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
      <Address>
        <MailingAddress>
          <POBoxNumber>0000</POBoxNumber>
          <StreetNumber>00</StreetNumber>
          <StreetName>A Drive</StreetName>
          <StreetType>Drive</StreetType>
          <Municipality>Port Alice</Municipality>
          <ProvTerrState>British Columbia</ProvTerrState>
          <PostalCodeZipCode>H0H0H0</PostalCodeZipCode>
          <Country>Canada</Country>
        </MailingAddress>
      </Address>
    </Organisation>
    <Facility>
      <Details>
        <FacilityName>Bart Simpson</FacilityName>
        <Identifiers>
          <IdentifierList>
            <Identifier>
              <IdentifierType>NPRI</IdentifierType>
              <IdentifierValue>12345</IdentifierValue>
            </Identifier>
            <Identifier>
              <IdentifierType>BCGHGID</IdentifierType>
              <IdentifierValue>12345</IdentifierValue>
            </Identifier>
          </IdentifierList>
          <NAICSCodeList>
            <NAICSCode>
              <Code>123456</Code>
            </NAICSCode>
          </NAICSCodeList>
        </Identifiers>
      </Details>
      <Address>
        <PhysicalAddress>
          <StreetNumber>1</StreetNumber>
          <StreetName>A Drive</StreetName>
          <StreetType>Drive</StreetType>
          <Municipality>Port Alice</Municipality>
          <ProvTerrState>British Columbia</ProvTerrState>
          <PostalCodeZipCode>H0H0H0</PostalCodeZipCode>
          <Country>Canada</Country>
        </PhysicalAddress>
        <GeographicalAddress>
          <Latitude>1.23000</Latitude>
          <Longitude>1.26000</Longitude>
        </GeographicalAddress>
      </Address>
    </Facility>
    <Contacts>
      <Contact>
        <Details>
          <ContactType>Operator Contact</ContactType>
          <GivenName>Buddy</GivenName>
          <TelephoneNumber>1234</TelephoneNumber>
          <ExtensionNumber>1</ExtensionNumber>
          <EmailAddress>abc@abc.ca</EmailAddress>
          <Position>Environmental Manager</Position>
        </Details>
        <Address>
          <MailingAddress>
            <POBoxNumber>00</POBoxNumber>
            <Municipality>Port Alice</Municipality>
            <ProvTerrState>British Columbia</ProvTerrState>
            <PostalCodeZipCode>H0H0H0</PostalCodeZipCode>
            <Country>Canada</Country>
          </MailingAddress>
        </Address>
      </Contact>
      <Contact>
        <Details>
          <ContactType>Operator Representative</ContactType>
          <GivenName>Buddy</GivenName>
          <TelephoneNumber>0000</TelephoneNumber>
          <ExtensionNumber>1</ExtensionNumber>
          <EmailAddress>abc@abc.ca</EmailAddress>
          <Position>Environmental Manager</Position>
        </Details>
        <Address>
          <MailingAddress>
            <POBoxNumber>00</POBoxNumber>
            <Municipality>Port Alice</Municipality>
            <ProvTerrState>British Columbia</ProvTerrState>
            <PostalCodeZipCode>H0H0H0</PostalCodeZipCode>
            <Country>Canada</Country>
          </MailingAddress>
        </Address>
      </Contact>
      <Contact>
        <Details>
          <ContactType>Person Who Prepared Report</ContactType>
          <GivenName>Buddy</GivenName>
          <TelephoneNumber>2502843331</TelephoneNumber>
          <ExtensionNumber>1</ExtensionNumber>
          <EmailAddress>abc@abc.ca</EmailAddress>
          <Position>Environmental Manager</Position>
        </Details>
        <Address>
          <MailingAddress>
            <POBoxNumber>00</POBoxNumber>
            <Municipality>Port Alice</Municipality>
            <ProvTerrState>British Columbia</ProvTerrState>
            <PostalCodeZipCode>H0H0H0</PostalCodeZipCode>
            <Country>Canada</Country>
          </MailingAddress>
        </Address>
      </Contact>
    </Contacts>
    <ParentOrganisations/>
  </VerifyTombstone>
  <ActivityData xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <ActivityPages>
      <Process ProcessName="GeneralStationaryCombustion">
        <SubProcess SubprocessName="(a) general stationary combustion, useful energy" InformationRequirement="Required">
          <Units>
            <Unit>
              <UnitName>Building heat</UnitName>
              <Fuels>
                <Fuel>
                  <FuelType>Propane</FuelType>
                  <FuelClassification>non-biomass</FuelClassification>
                  <FuelDescription/>
                  <FuelUnits>kilolitres</FuelUnits>
                  <AnnualFuelAmount>24.01</AnnualFuelAmount>
                  <Emissions>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>36.2624</Quantity>
                      <CalculatedQuantity>36.2624</CalculatedQuantity>
                      <GasType>CO2nonbio</GasType>
                      <Methodology>Methodology 1 (default HHV)</Methodology>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>0.0006</Quantity>
                      <CalculatedQuantity>0.0126</CalculatedQuantity>
                      <GasType>CH4</GasType>
                      <Methodology>Default HHV/EFc</Methodology>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>0.0026</Quantity>
                      <CalculatedQuantity>0.8060</CalculatedQuantity>
                      <GasType>N2O</GasType>
                      <Methodology>Default HHV/EFc</Methodology>
                    </Emission>
                  </Emissions>
                  <AlternativeMethodologyDescription/>
                </Fuel>
              </Fuels>
            </Unit>
          </Units>
        </SubProcess>
        <SubProcess SubprocessName="(b) general stationary combustion, no useful energy" InformationRequirement="Required">
          <Units>
            <Unit>
              <UnitName>Acid plant burner</UnitName>
              <Fuels>
                <Fuel>
                  <FuelType>Propane</FuelType>
                  <FuelClassification>non-biomass</FuelClassification>
                  <FuelUnits>kilolitres</FuelUnits>
                  <AnnualFuelAmount>38.93</AnnualFuelAmount>
                  <Emissions>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_WasteEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_WasteEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>58.7876</Quantity>
                      <CalculatedQuantity>58.7876</CalculatedQuantity>
                      <GasType>CO2nonbio</GasType>
                      <Methodology>Methodology 1 (default HHV)</Methodology>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_WasteEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_WasteEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>0.0009</Quantity>
                      <CalculatedQuantity>0.0189</CalculatedQuantity>
                      <GasType>CH4</GasType>
                      <Methodology>Default HHV/EFc</Methodology>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_WasteEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_WasteEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>0.0042</Quantity>
                      <CalculatedQuantity>1.3020</CalculatedQuantity>
                      <GasType>N2O</GasType>
                      <Methodology>Default HHV/EFc</Methodology>
                    </Emission>
                  </Emissions>
                  <AlternativeMethodologyDescription/>
                </Fuel>
              </Fuels>
            </Unit>
          </Units>
        </SubProcess>
        <SubProcess SubprocessName="Additional information for cement and lime production facilities only (not aggregated intotals)" InformationRequirement="MandatoryAdditional">
          <Units UnitType="Fuel combustion emissions from all kilns combined">
            <Unit>
              <Fuels>
                <Fuel>
                  <Emissions>
                    <Emission>
                      <Groups/>
                      <NotApplicable>false</NotApplicable>
                      <CalculatedQuantity>0</CalculatedQuantity>
                      <GasType>CO2</GasType>
                    </Emission>
                    <Emission>
                      <Groups/>
                      <NotApplicable>false</NotApplicable>
                      <CalculatedQuantity>0</CalculatedQuantity>
                      <GasType>CH4</GasType>
                    </Emission>
                    <Emission>
                      <Groups/>
                      <NotApplicable>false</NotApplicable>
                      <CalculatedQuantity>0</CalculatedQuantity>
                      <GasType>N2O</GasType>
                    </Emission>
                  </Emissions>
                </Fuel>
              </Fuels>
            </Unit>
          </Units>
          <Units UnitType="Fuel combustion emissions from all other fuel combustion units (kilns excluded)">
            <Unit>
              <Fuels>
                <Fuel>
                  <Emissions>
                    <Emission>
                      <NotApplicable>false</NotApplicable>
                      <CalculatedQuantity>0</CalculatedQuantity>
                      <GasType>CO2</GasType>
                    </Emission>
                    <Emission>
                      <NotApplicable>false</NotApplicable>
                      <CalculatedQuantity>0</CalculatedQuantity>
                      <GasType>CH4</GasType>
                    </Emission>
                    <Emission>
                      <NotApplicable>false</NotApplicable>
                      <CalculatedQuantity>0</CalculatedQuantity>
                      <GasType>N2O</GasType>
                    </Emission>
                  </Emissions>
                </Fuel>
              </Fuels>
            </Unit>
          </Units>
        </SubProcess>
      </Process>
      <Process ProcessName="MobileCombustion">
        <SubProcess SubprocessName="Emissions from fuel combustion by mobile equipment that is part of the facility" InformationRequirement="Required">
          <Units>
            <Unit>
              <Fuels>
                <Fuel>
                  <FuelType>Diesel</FuelType>
                  <FuelClassification>non-biomass</FuelClassification>
                  <FuelDescription/>
                  <AnnualFuelAmount>572248</AnnualFuelAmount>
                  <Q1>143062</Q1>
                  <Q2>143062</Q2>
                  <Q3>143062</Q3>
                  <Q4>143062</Q4>
                  <Emissions>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ReportingOnlyEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_OnSiteTransportationEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>1523.8911</Quantity>
                      <CalculatedQuantity>1523.8911</CalculatedQuantity>
                      <GasType>CO2nonbio</GasType>
                      <Methodology>Default EF</Methodology>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ReportingOnlyEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_OnSiteTransportationEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>0.0761</Quantity>
                      <CalculatedQuantity>1.5981</CalculatedQuantity>
                      <GasType>CH4</GasType>
                      <Methodology>Default EF</Methodology>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ReportingOnlyEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_OnSiteTransportationEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>0.2289</Quantity>
                      <CalculatedQuantity>70.9590</CalculatedQuantity>
                      <GasType>N2O</GasType>
                      <Methodology>Default EF</Methodology>
                    </Emission>
                  </Emissions>
                  <AlternativeMethodologyDescription/>
                </Fuel>
                <Fuel>
                  <FuelType>Propane</FuelType>
                  <FuelClassification>non-biomass</FuelClassification>
                  <FuelDescription/>
                  <AnnualFuelAmount>105840</AnnualFuelAmount>
                  <Q1>26460</Q1>
                  <Q2>26460</Q2>
                  <Q3>26460</Q3>
                  <Q4>26460</Q4>
                  <Emissions>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ReportingOnlyEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_OnSiteTransportationEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>159.8184</Quantity>
                      <CalculatedQuantity>159.8184</CalculatedQuantity>
                      <GasType>CO2nonbio</GasType>
                      <Methodology>Default EF</Methodology>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ReportingOnlyEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_OnSiteTransportationEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>0.0025</Quantity>
                      <CalculatedQuantity>0.0525</CalculatedQuantity>
                      <GasType>CH4</GasType>
                      <Methodology>Default EF</Methodology>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ReportingOnlyEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_OnSiteTransportationEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>0.0114</Quantity>
                      <CalculatedQuantity>3.5340</CalculatedQuantity>
                      <GasType>N2O</GasType>
                      <Methodology>Default EF</Methodology>
                    </Emission>
                  </Emissions>
                  <AlternativeMethodologyDescription/>
                </Fuel>
              </Fuels>
            </Unit>
          </Units>
        </SubProcess>
      </Process>
      <Process ProcessName="ElectricityGeneration">
        <SubProcess SubprocessName="Emissions from fuel combustion for electricity generation" InformationRequirement="Required">
          <Units UnitType="Cogen Units">
            <Unit>
              <COGenUnit>
                <CogenUnitName>Recovery boiler</CogenUnitName>
                <NameplateCapacity>15.5</NameplateCapacity>
                <NetPower>80074</NetPower>
                <CycleType>Topping</CycleType>
                <ThermalOutputQuantity>2354364040</ThermalOutputQuantity>
                <SupplementalFiringPurpose>Electr. Generation</SupplementalFiringPurpose>
              </COGenUnit>
              <Fuels>
                <Fuel>
                  <FuelType>Residual Fuel Oil (#5 &amp; 6)</FuelType>
                  <FuelClassification>non-biomass</FuelClassification>
                  <FuelDescription/>
                  <FuelUnits>kilolitres</FuelUnits>
                  <AnnualFuelAmount>14427</AnnualFuelAmount>
                  <AnnualWeightedAverageCarbonContent>0.862</AnnualWeightedAverageCarbonContent>
                  <Emissions>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>45564.2360</Quantity>
                      <CalculatedQuantity>45564.2360</CalculatedQuantity>
                      <GasType>CO2nonbio</GasType>
                      <Methodology>Methodology 3 (measured CC/Steam)</Methodology>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>1.7315</Quantity>
                      <CalculatedQuantity>36.3615</CalculatedQuantity>
                      <GasType>CH4</GasType>
                      <Methodology>Default HHV/EFc</Methodology>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>0.9234</Quantity>
                      <CalculatedQuantity>286.2540</CalculatedQuantity>
                      <GasType>N2O</GasType>
                      <Methodology>Default HHV/EFc</Methodology>
                    </Emission>
                  </Emissions>
                  <AlternativeMethodologyDescription/>
                </Fuel>
                <Fuel>
                  <FuelType>Propane</FuelType>
                  <FuelClassification>non-biomass</FuelClassification>
                  <FuelDescription/>
                  <FuelUnits>kilolitres</FuelUnits>
                  <AnnualFuelAmount>3.63</AnnualFuelAmount>
                  <Emissions>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>5.4872</Quantity>
                      <CalculatedQuantity>5.4872</CalculatedQuantity>
                      <GasType>CO2nonbio</GasType>
                      <Methodology>Methodology 1 (default HHV)</Methodology>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>0.0001</Quantity>
                      <CalculatedQuantity>0.0021</CalculatedQuantity>
                      <GasType>CH4</GasType>
                      <Methodology>Default HHV/EFc</Methodology>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>0.0004</Quantity>
                      <CalculatedQuantity>0.1240</CalculatedQuantity>
                      <GasType>N2O</GasType>
                      <Methodology>Default HHV/EFc</Methodology>
                    </Emission>
                  </Emissions>
                  <AlternativeMethodologyDescription/>
                </Fuel>
              </Fuels>
            </Unit>
            <Unit>
              <COGenUnit>
                <CogenUnitName>Boiler 14</CogenUnitName>
                <NameplateCapacity>1</NameplateCapacity>
                <NetPower>5018</NetPower>
                <CycleType>Topping</CycleType>
                <ThermalOutputQuantity>147550897</ThermalOutputQuantity>
                <SupplementalFiringPurpose>Electr. Generation</SupplementalFiringPurpose>
              </COGenUnit>
              <Fuels>
                <Fuel>
                  <FuelType>Residual Fuel Oil (#5 &amp; 6)</FuelType>
                  <FuelClassification>non-biomass</FuelClassification>
                  <FuelDescription/>
                  <FuelUnits>kilolitres</FuelUnits>
                  <AnnualFuelAmount>5042</AnnualFuelAmount>
                  <AnnualWeightedAverageCarbonContent>0.862</AnnualWeightedAverageCarbonContent>
                  <Emissions>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>15925.7236</Quantity>
                      <CalculatedQuantity>15925.7236</CalculatedQuantity>
                      <GasType>CO2nonbio</GasType>
                      <Methodology>Methodology 3 (measured CC/Steam)</Methodology>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>0.6052</Quantity>
                      <CalculatedQuantity>12.7092</CalculatedQuantity>
                      <GasType>CH4</GasType>
                      <Methodology>Default HHV/EFc</Methodology>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>0.3227</Quantity>
                      <CalculatedQuantity>100.0370</CalculatedQuantity>
                      <GasType>N2O</GasType>
                      <Methodology>Default HHV/EFc</Methodology>
                    </Emission>
                  </Emissions>
                  <AlternativeMethodologyDescription/>
                </Fuel>
                <Fuel>
                  <FuelType>Diesel</FuelType>
                  <FuelClassification>non-biomass</FuelClassification>
                  <FuelDescription/>
                  <FuelUnits>kilolitres</FuelUnits>
                  <AnnualFuelAmount>40.62</AnnualFuelAmount>
                  <Emissions>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>108.1710</Quantity>
                      <CalculatedQuantity>108.1710</CalculatedQuantity>
                      <GasType>CO2nonbio</GasType>
                      <Methodology>Methodology 1 (default HHV)</Methodology>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>0.0054</Quantity>
                      <CalculatedQuantity>0.1134</CalculatedQuantity>
                      <GasType>CH4</GasType>
                      <Methodology>Default HHV/EFc</Methodology>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>0.0162</Quantity>
                      <CalculatedQuantity>5.0220</CalculatedQuantity>
                      <GasType>N2O</GasType>
                      <Methodology>Default HHV/EFc</Methodology>
                    </Emission>
                  </Emissions>
                  <AlternativeMethodologyDescription/>
                </Fuel>
              </Fuels>
            </Unit>
            <Unit>
              <COGenUnit>
                <CogenUnitName>Boiler 15</CogenUnitName>
                <NameplateCapacity>4</NameplateCapacity>
                <NetPower>20786</NetPower>
                <CycleType>Topping</CycleType>
                <ThermalOutputQuantity>611167103</ThermalOutputQuantity>
                <SupplementalFiringPurpose>Electr. Generation</SupplementalFiringPurpose>
              </COGenUnit>
              <Fuels>
                <Fuel>
                  <FuelType>Residual Fuel Oil (#5 &amp; 6)</FuelType>
                  <FuelClassification>non-biomass</FuelClassification>
                  <FuelDescription/>
                  <FuelUnits>kilolitres</FuelUnits>
                  <AnnualFuelAmount>20898</AnnualFuelAmount>
                  <AnnualWeightedAverageCarbonContent>0.862</AnnualWeightedAverageCarbonContent>
                  <Emissions>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>66004.3122</Quantity>
                      <CalculatedQuantity>66004.3122</CalculatedQuantity>
                      <GasType>CO2nonbio</GasType>
                      <Methodology>Methodology 3 (measured CC/Steam)</Methodology>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>2.5082</Quantity>
                      <CalculatedQuantity>52.6722</CalculatedQuantity>
                      <GasType>CH4</GasType>
                      <Methodology>Default HHV/EFc</Methodology>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>1.3376</Quantity>
                      <CalculatedQuantity>414.6560</CalculatedQuantity>
                      <GasType>N2O</GasType>
                      <Methodology>Default HHV/EFc</Methodology>
                    </Emission>
                  </Emissions>
                  <AlternativeMethodologyDescription/>
                </Fuel>
                <Fuel>
                  <FuelType>Diesel</FuelType>
                  <FuelClassification>non-biomass</FuelClassification>
                  <FuelDescription/>
                  <FuelUnits>kilolitres</FuelUnits>
                  <AnnualFuelAmount>48.74</AnnualFuelAmount>
                  <Emissions>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>129.8052</Quantity>
                      <CalculatedQuantity>129.8052</CalculatedQuantity>
                      <GasType>CO2nonbio</GasType>
                      <Methodology>Methodology 1 (default HHV)</Methodology>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>0.0065</Quantity>
                      <CalculatedQuantity>0.1365</CalculatedQuantity>
                      <GasType>CH4</GasType>
                      <Methodology>Default HHV/EFc</Methodology>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>0.0195</Quantity>
                      <CalculatedQuantity>6.0450</CalculatedQuantity>
                      <GasType>N2O</GasType>
                      <Methodology>Default HHV/EFc</Methodology>
                    </Emission>
                  </Emissions>
                  <AlternativeMethodologyDescription/>
                </Fuel>
              </Fuels>
            </Unit>
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
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>53.8010</Quantity>
                      <CalculatedQuantity>1129.8210</CalculatedQuantity>
                      <GasType>CH4</GasType>
                      <Methodology>Measured Steam</Methodology>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>7.1735</Quantity>
                      <CalculatedQuantity>2223.7850</CalculatedQuantity>
                      <GasType>N2O</GasType>
                      <Methodology>Measured Steam</Methodology>
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
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>1.1332</Quantity>
                      <CalculatedQuantity>23.7972</CalculatedQuantity>
                      <GasType>CH4</GasType>
                      <Methodology>Default HHV/EFc</Methodology>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>0.6043</Quantity>
                      <CalculatedQuantity>187.3330</CalculatedQuantity>
                      <GasType>N2O</GasType>
                      <Methodology>Default HHV/EFc</Methodology>
                    </Emission>
                  </Emissions>
                  <AlternativeMethodologyDescription/>
                </Fuel>
                <Fuel>
                  <FuelType>Propane</FuelType>
                  <FuelClassification>non-biomass</FuelClassification>
                  <FuelDescription/>
                  <FuelUnits>kilolitres</FuelUnits>
                  <AnnualFuelAmount>1.37</AnnualFuelAmount>
                  <Emissions>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>2.0671</Quantity>
                      <CalculatedQuantity>2.0671</CalculatedQuantity>
                      <GasType>CO2nonbio</GasType>
                      <Methodology>Methodology 1 (default HHV)</Methodology>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>0.0000</Quantity>
                      <CalculatedQuantity>0.0000</CalculatedQuantity>
                      <GasType>CH4</GasType>
                      <Methodology>Default HHV/EFc</Methodology>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_GeneralStationaryCombustionEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>0.0001</Quantity>
                      <CalculatedQuantity>0.0310</CalculatedQuantity>
                      <GasType>N2O</GasType>
                      <Methodology>Default HHV/EFc</Methodology>
                    </Emission>
                  </Emissions>
                  <AlternativeMethodologyDescription/>
                </Fuel>
              </Fuels>
            </Unit>
          </Units>
        </SubProcess>
        <SubProcess SubprocessName="Emissions from acid gas scrubbers and acid gas reagents" InformationRequirement="Required">
          <Units>
            <Unit>
              <Fuels>
                <Fuel>
                  <Emissions>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_IndustrialProcessEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_IndustrialProcessEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>true</NotApplicable>
                      <CalculatedQuantity>0</CalculatedQuantity>
                      <GasType>CO2nonbio</GasType>
                    </Emission>
                  </Emissions>
                  <AlternativeMethodologyDescription/>
                </Fuel>
              </Fuels>
            </Unit>
          </Units>
        </SubProcess>
        <SubProcess SubprocessName="Emissions from cooling units" InformationRequirement="Required">
          <Units>
            <Unit>
              <Fuels>
                <Fuel>
                  <Emissions>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_FugitiveEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_SpeciatedHFCs</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>true</NotApplicable>
                      <CalculatedQuantity>0</CalculatedQuantity>
                      <GasType>HFC23_CHF3</GasType>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_FugitiveEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_SpeciatedHFCs</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>true</NotApplicable>
                      <CalculatedQuantity>0</CalculatedQuantity>
                      <GasType>HFC32_CH2F2</GasType>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_FugitiveEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_SpeciatedHFCs</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>true</NotApplicable>
                      <CalculatedQuantity>0</CalculatedQuantity>
                      <GasType>HFC41_CH3F</GasType>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_FugitiveEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_SpeciatedHFCs</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>true</NotApplicable>
                      <CalculatedQuantity>0</CalculatedQuantity>
                      <GasType>HFC4310mee_C5H2F10</GasType>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_FugitiveEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_SpeciatedHFCs</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>true</NotApplicable>
                      <CalculatedQuantity>0</CalculatedQuantity>
                      <GasType>HFC125_C2HF5</GasType>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_FugitiveEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_SpeciatedHFCs</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>true</NotApplicable>
                      <CalculatedQuantity>0</CalculatedQuantity>
                      <GasType>HFC134_C2H2F4</GasType>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_FugitiveEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_SpeciatedHFCs</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>true</NotApplicable>
                      <CalculatedQuantity>0</CalculatedQuantity>
                      <GasType>HFC134a_C2H2F4</GasType>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_FugitiveEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_SpeciatedHFCs</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>true</NotApplicable>
                      <CalculatedQuantity>0</CalculatedQuantity>
                      <GasType>HFC143_C2H3F3</GasType>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_FugitiveEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_SpeciatedHFCs</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>true</NotApplicable>
                      <CalculatedQuantity>0</CalculatedQuantity>
                      <GasType>HFC143a_C2H3F3</GasType>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_FugitiveEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_SpeciatedHFCs</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>true</NotApplicable>
                      <CalculatedQuantity>0</CalculatedQuantity>
                      <GasType>HFC152a_C2H4F2</GasType>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_FugitiveEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_SpeciatedHFCs</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>true</NotApplicable>
                      <CalculatedQuantity>0</CalculatedQuantity>
                      <GasType>HFC227ea_C3HF7</GasType>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_FugitiveEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_SpeciatedHFCs</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>true</NotApplicable>
                      <CalculatedQuantity>0</CalculatedQuantity>
                      <GasType>HFC236fa_C3H2F6</GasType>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_FugitiveEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_SpeciatedHFCs</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>true</NotApplicable>
                      <CalculatedQuantity>0</CalculatedQuantity>
                      <GasType>HFC245ca_C3H3F5</GasType>
                    </Emission>
                  </Emissions>
                  <AlternativeMethodologyDescription/>
                </Fuel>
              </Fuels>
            </Unit>
          </Units>
        </SubProcess>
        <SubProcess SubprocessName="Emissions from geothermal geyser steam or fluids" InformationRequirement="Required">
          <Units>
            <Unit>
              <Fuels>
                <Fuel>
                  <Emissions>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_FugitiveEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_FugitiveEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>true</NotApplicable>
                      <CalculatedQuantity>0</CalculatedQuantity>
                      <GasType>CO2nonbio</GasType>
                    </Emission>
                  </Emissions>
                  <AlternativeMethodologyDescription/>
                </Fuel>
              </Fuels>
            </Unit>
          </Units>
        </SubProcess>
        <SubProcess SubprocessName="Emissions from installation, maintenance, operation and decommissioning of electrical equipment" InformationRequirement="Required">
          <Units>
            <Unit>
              <Fuels>
                <Fuel>
                  <Emissions>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_FugitiveEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_SF6Emissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>true</NotApplicable>
                      <CalculatedQuantity>0</CalculatedQuantity>
                      <GasType>SF6</GasType>
                    </Emission>
                  </Emissions>
                  <AlternativeMethodologyDescription/>
                </Fuel>
              </Fuels>
            </Unit>
          </Units>
        </SubProcess>
      </Process>
      <Process ProcessName="PulpAndPaperProduction">
        <SubProcess SubprocessName="Emissions from pulping and chemical recovery" InformationRequirement="Required">
          <Units>
            <Unit>
              <Fuels>
                <Fuel>
                  <Emissions>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_IndustrialProcessEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_IndustrialProcessEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>true</NotApplicable>
                      <CalculatedQuantity>0</CalculatedQuantity>
                      <GasType>CO2nonbio</GasType>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_IndustrialProcessEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_IndustrialProcessEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>196199.2992</Quantity>
                      <CalculatedQuantity>196199.2992</CalculatedQuantity>
                      <GasType>CO2bioC</GasType>
                      <Methodology>Solids-CC</Methodology>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_IndustrialProcessEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_IndustrialProcessEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>4.9761</Quantity>
                      <CalculatedQuantity>104.4981</CalculatedQuantity>
                      <GasType>CH4</GasType>
                      <Methodology>Solids-HHV</Methodology>
                    </Emission>
                    <Emission>
                      <Groups>
                        <EmissionGroupTypes>BC_FacilityTotal</EmissionGroupTypes>
                        <EmissionGroupTypes>BC_ScheduleB_IndustrialProcessEmissions</EmissionGroupTypes>
                        <EmissionGroupTypes>EC_IndustrialProcessEmissions</EmissionGroupTypes>
                      </Groups>
                      <NotApplicable>false</NotApplicable>
                      <Quantity>3.2602</Quantity>
                      <CalculatedQuantity>1010.6620</CalculatedQuantity>
                      <GasType>N2O</GasType>
                      <Methodology>Solids-HHV</Methodology>
                    </Emission>
                  </Emissions>
                  <AlternativeMethodologyDescription/>
                </Fuel>
              </Fuels>
            </Unit>
          </Units>
        </SubProcess>
        <SubProcess SubprocessName="Mandatory additional reportable information" InformationRequirement="MandatoryAdditional">
          <Amount AmtDomain="PulpAndPaperBlackLiquor" AmtAction="Combusted" AmtPeriod="Annual">168389</Amount>
          <PercentSolidsByWeight>53</PercentSolidsByWeight>
          <PulpAndPaperCarbonates/>
        </SubProcess>
      </Process>
    </ActivityPages>
    <NonAttributableEmissions>
      <NonAttribEmissions/>
    </NonAttributableEmissions>
    <TotalCO2Captured>
      <TotalGroups TotalGroupType="TotalCO2CapturedEmissions">
        <Totals>
          <Emissions EmissionsGasType="CO2Captured">
            <TotalRow>
              <Groups>
                <EmissionGroupTypes>BC_CO2Captured</EmissionGroupTypes>
              </Groups>
              <NotApplicable>true</NotApplicable>
              <CalculatedQuantity>0</CalculatedQuantity>
              <GasType>CO2nonbio</GasType>
            </TotalRow>
          </Emissions>
        </Totals>
      </TotalGroups>
    </TotalCO2Captured>
    <TotalEmissions>
      <TotalGroups TotalGroupType="TotalGHGEmissionGas">
        <Totals>
          <Emissions EmissionsGasType="CO2Captured">
            <TotalRow>
              <Quantity>0.00000000</Quantity>
              <CalculatedQuantity>0.00000000</CalculatedQuantity>
              <GasType>CO2nonbio</GasType>
              <GasGroupType>None</GasGroupType>
            </TotalRow>
          </Emissions>
          <Emissions EmissionsGasType="GHGEmissionGas">
            <TotalRow>
              <Quantity>364237.87650000</Quantity>
              <CalculatedQuantity>364237.87650000</CalculatedQuantity>
              <GasType>CO2bioC</GasType>
              <GasGroupType>None</GasGroupType>
            </TotalRow>
            <TotalRow>
              <Quantity>0.00000000</Quantity>
              <CalculatedQuantity>0.00000000</CalculatedQuantity>
              <GasType>CO2bionC</GasType>
              <GasGroupType>None</GasGroupType>
            </TotalRow>
            <TotalRow>
              <Quantity>159338.15910000</Quantity>
              <CalculatedQuantity>159338.15910000</CalculatedQuantity>
              <GasType>CO2nonbio</GasType>
              <GasGroupType>None</GasGroupType>
            </TotalRow>
            <TotalRow>
              <Quantity>64.84730000</Quantity>
              <CalculatedQuantity>1361.79330000</CalculatedQuantity>
              <GasType>CH4</GasType>
              <GasGroupType>None</GasGroupType>
            </TotalRow>
            <TotalRow>
              <Quantity>0.00000000</Quantity>
              <CalculatedQuantity>0.00000000</CalculatedQuantity>
              <GasType>HFCs</GasType>
              <GasGroupType>None</GasGroupType>
            </TotalRow>
            <TotalRow>
              <Quantity>13.90500000</Quantity>
              <CalculatedQuantity>4310.55000000</CalculatedQuantity>
              <GasType>N2O</GasType>
              <GasGroupType>None</GasGroupType>
            </TotalRow>
            <TotalRow>
              <Quantity>0.00000000</Quantity>
              <CalculatedQuantity>0.00000000</CalculatedQuantity>
              <GasType>SF6</GasType>
              <GasGroupType>None</GasGroupType>
            </TotalRow>
            <GrandTotal>
              <Total>529248.3789</Total>
            </GrandTotal>
          </Emissions>
        </Totals>
      </TotalGroups>
      <TotalGroups TotalGroupType="ReportingOnlyEmissions">
        <Totals>
          <Emissions EmissionsGasType="ReportingOnlyByGas">
            <TotalRow>
              <Quantity>0.00000000</Quantity>
              <CalculatedQuantity>0.00000000</CalculatedQuantity>
              <GasType>CO2bioC</GasType>
              <GasGroupType>None</GasGroupType>
            </TotalRow>
            <TotalRow>
              <Quantity>0.00000000</Quantity>
              <CalculatedQuantity>0.00000000</CalculatedQuantity>
              <GasType>CO2bionC</GasType>
              <GasGroupType>None</GasGroupType>
            </TotalRow>
            <TotalRow>
              <Quantity>1683.70950000</Quantity>
              <CalculatedQuantity>1683.70950000</CalculatedQuantity>
              <GasType>CO2nonbio</GasType>
              <GasGroupType>None</GasGroupType>
            </TotalRow>
            <TotalRow>
              <Quantity>0.07860000</Quantity>
              <CalculatedQuantity>1.65060000</CalculatedQuantity>
              <GasType>CH4</GasType>
              <GasGroupType>None</GasGroupType>
            </TotalRow>
            <TotalRow>
              <Quantity>0.24030000</Quantity>
              <CalculatedQuantity>74.49300000</CalculatedQuantity>
              <GasType>N2O</GasType>
              <GasGroupType>None</GasGroupType>
            </TotalRow>
            <GrandTotal>
              <Total>1759.8531</Total>
            </GrandTotal>
          </Emissions>
        </Totals>
      </TotalGroups>
      <TotalGroups TotalGroupType="TotalEmissionsSchedB">
        <Totals>
          <Emissions EmissionsGasType="FugitiveEmissions">
            <TotalRow>
              <Quantity>0.00000000</Quantity>
              <CalculatedQuantity>0.00000000</CalculatedQuantity>
              <GasType>CO2</GasType>
              <GasGroupType>None</GasGroupType>
            </TotalRow>
            <TotalRow>
              <Quantity>0.00000000</Quantity>
              <CalculatedQuantity>0.00000000</CalculatedQuantity>
              <GasType>HFCs</GasType>
              <GasGroupType>None</GasGroupType>
            </TotalRow>
            <TotalRow>
              <Quantity>0.00000000</Quantity>
              <CalculatedQuantity>0.00000000</CalculatedQuantity>
              <GasType>SF6</GasType>
              <GasGroupType>None</GasGroupType>
            </TotalRow>
            <GrandTotal>
              <Total>0</Total>
            </GrandTotal>
          </Emissions>
          <Emissions EmissionsGasType="IndustrialProcessEmissions">
            <TotalRow>
              <Quantity>196199.29920000</Quantity>
              <CalculatedQuantity>196199.29920000</CalculatedQuantity>
              <GasType>CO2</GasType>
              <GasGroupType>None</GasGroupType>
            </TotalRow>
            <TotalRow>
              <Quantity>4.97610000</Quantity>
              <CalculatedQuantity>104.49810000</CalculatedQuantity>
              <GasType>CH4</GasType>
              <GasGroupType>None</GasGroupType>
            </TotalRow>
            <TotalRow>
              <Quantity>3.26020000</Quantity>
              <CalculatedQuantity>1010.66200000</CalculatedQuantity>
              <GasType>N2O</GasType>
              <GasGroupType>None</GasGroupType>
            </TotalRow>
            <GrandTotal>
              <Total>197314.4593</Total>
            </GrandTotal>
          </Emissions>
          <Emissions EmissionsGasType="OnSiteTransportationEmissions">
            <TotalRow>
              <Quantity>1683.70950000</Quantity>
              <CalculatedQuantity>1683.70950000</CalculatedQuantity>
              <GasType>CO2</GasType>
              <GasGroupType>None</GasGroupType>
            </TotalRow>
            <TotalRow>
              <Quantity>0.07860000</Quantity>
              <CalculatedQuantity>1.65060000</CalculatedQuantity>
              <GasType>CH4</GasType>
              <GasGroupType>None</GasGroupType>
            </TotalRow>
            <TotalRow>
              <Quantity>0.24030000</Quantity>
              <CalculatedQuantity>74.49300000</CalculatedQuantity>
              <GasType>N2O</GasType>
              <GasGroupType>None</GasGroupType>
            </TotalRow>
            <GrandTotal>
              <Total>1759.8531</Total>
            </GrandTotal>
          </Emissions>
          <Emissions EmissionsGasType="StationaryFuelCombustionEmissions">
            <TotalRow>
              <Quantity>325634.23930000</Quantity>
              <CalculatedQuantity>325634.23930000</CalculatedQuantity>
              <GasType>CO2</GasType>
              <GasGroupType>None</GasGroupType>
            </TotalRow>
            <TotalRow>
              <Quantity>59.79170000</Quantity>
              <CalculatedQuantity>1255.62570000</CalculatedQuantity>
              <GasType>CH4</GasType>
              <GasGroupType>None</GasGroupType>
            </TotalRow>
            <TotalRow>
              <Quantity>10.40030000</Quantity>
              <CalculatedQuantity>3224.09300000</CalculatedQuantity>
              <GasType>N2O</GasType>
              <GasGroupType>None</GasGroupType>
            </TotalRow>
            <GrandTotal>
              <Total>330113.958</Total>
            </GrandTotal>
          </Emissions>
          <Emissions EmissionsGasType="WasteEmissions">
            <TotalRow>
              <Quantity>58.78760000</Quantity>
              <CalculatedQuantity>58.78760000</CalculatedQuantity>
              <GasType>CO2</GasType>
              <GasGroupType>None</GasGroupType>
            </TotalRow>
            <TotalRow>
              <Quantity>0.00090000</Quantity>
              <CalculatedQuantity>0.01890000</CalculatedQuantity>
              <GasType>CH4</GasType>
              <GasGroupType>None</GasGroupType>
            </TotalRow>
            <TotalRow>
              <Quantity>0.00420000</Quantity>
              <CalculatedQuantity>1.30200000</CalculatedQuantity>
              <GasType>N2O</GasType>
              <GasGroupType>None</GasGroupType>
            </TotalRow>
            <GrandTotal>
              <Total>60.1085</Total>
            </GrandTotal>
          </Emissions>
        </Totals>
      </TotalGroups>
      <TotalGroups TotalGroupType="TotalEmissionsSpecies">
        <Totals>
          <Emissions EmissionsGasType="HFCsTotals">
            <TotalRow>
              <Quantity>0.00000000</Quantity>
              <CalculatedQuantity>0.00000000</CalculatedQuantity>
              <GasType>HFC125_C2HF5</GasType>
              <GasGroupType>HFCs</GasGroupType>
            </TotalRow>
            <TotalRow>
              <Quantity>0.00000000</Quantity>
              <CalculatedQuantity>0.00000000</CalculatedQuantity>
              <GasType>HFC134_C2H2F4</GasType>
              <GasGroupType>HFCs</GasGroupType>
            </TotalRow>
            <TotalRow>
              <Quantity>0.00000000</Quantity>
              <CalculatedQuantity>0.00000000</CalculatedQuantity>
              <GasType>HFC134a_C2H2F4</GasType>
              <GasGroupType>HFCs</GasGroupType>
            </TotalRow>
            <TotalRow>
              <Quantity>0.00000000</Quantity>
              <CalculatedQuantity>0.00000000</CalculatedQuantity>
              <GasType>HFC143_CHF2CH2F</GasType>
              <GasGroupType>HFCs</GasGroupType>
            </TotalRow>
            <TotalRow>
              <Quantity>0.00000000</Quantity>
              <CalculatedQuantity>0.00000000</CalculatedQuantity>
              <GasType>HFC143a_CF3CH3</GasType>
              <GasGroupType>HFCs</GasGroupType>
            </TotalRow>
            <TotalRow>
              <Quantity>0.00000000</Quantity>
              <CalculatedQuantity>0.00000000</CalculatedQuantity>
              <GasType>HFC152a_CH3CHF2</GasType>
              <GasGroupType>HFCs</GasGroupType>
            </TotalRow>
            <TotalRow>
              <Quantity>0.00000000</Quantity>
              <CalculatedQuantity>0.00000000</CalculatedQuantity>
              <GasType>HFC227ea_C3HF7</GasType>
              <GasGroupType>HFCs</GasGroupType>
            </TotalRow>
            <TotalRow>
              <Quantity>0.00000000</Quantity>
              <CalculatedQuantity>0.00000000</CalculatedQuantity>
              <GasType>HFC23_CHF3</GasType>
              <GasGroupType>HFCs</GasGroupType>
            </TotalRow>
            <TotalRow>
              <Quantity>0.00000000</Quantity>
              <CalculatedQuantity>0.00000000</CalculatedQuantity>
              <GasType>HFC236fa_C3H2F6</GasType>
              <GasGroupType>HFCs</GasGroupType>
            </TotalRow>
            <TotalRow>
              <Quantity>0.00000000</Quantity>
              <CalculatedQuantity>0.00000000</CalculatedQuantity>
              <GasType>HFC245ca_C3H3F5</GasType>
              <GasGroupType>HFCs</GasGroupType>
            </TotalRow>
            <TotalRow>
              <Quantity>0.00000000</Quantity>
              <CalculatedQuantity>0.00000000</CalculatedQuantity>
              <GasType>HFC32_CH2F2</GasType>
              <GasGroupType>HFCs</GasGroupType>
            </TotalRow>
            <TotalRow>
              <Quantity>0.00000000</Quantity>
              <CalculatedQuantity>0.00000000</CalculatedQuantity>
              <GasType>HFC41_CH3F</GasType>
              <GasGroupType>HFCs</GasGroupType>
            </TotalRow>
            <TotalRow>
              <Quantity>0.00000000</Quantity>
              <CalculatedQuantity>0.00000000</CalculatedQuantity>
              <GasType>HFC4310mee_C5H2F10</GasType>
              <GasGroupType>HFCs</GasGroupType>
            </TotalRow>
            <GrandTotal>
              <Total>0</Total>
            </GrandTotal>
          </Emissions>
        </Totals>
      </TotalGroups>
    </TotalEmissions>
    <ReportComments>
      <Process ProcessName="Comments">
        <SubProcess SubprocessName="This section is optional" InformationRequirement="Optional">
          <FileDetails>
            <File>38</File>
            <UploadedFileName/>
            <UploadedDate/>
          </FileDetails>
        </SubProcess>
      </Process>
    </ReportComments>
    <ConfidentialityRequest>
      <Process ProcessName="ConfidentialityRequest">
        <SubProcess SubprocessName="Confidentiality Request" InformationRequirement="Required">
          <IsRequestingConfidentiality>No</IsRequestingConfidentiality>
          <FileDetails>
            <File>39</File>
            <UploadedFileName/>
            <UploadedDate/>
          </FileDetails>
        </SubProcess>
      </Process>
    </ConfidentialityRequest>
    <SubmitConfirmation>
      <Process ProcessName="SubmitConfirmation">
        <SubProcess SubprocessName="Approval" InformationRequirement="Required">
          <SubmittedBy>Buddy</SubmittedBy>
          <SubmissionDate>28/03/2013 16:25:55 [PM] [PDT]</SubmissionDate>
        </SubProcess>
      </Process>
    </SubmitConfirmation>
    <ReportVerification>
      <Process ProcessName="ReportVerification">
        <SubProcess SubprocessName="A verification statement is required if E greater than or equal to 25,000 t CO2e or E has been larger than 25,000 t CO2e in the past 3 reporting periods" InformationRequirement="Required">
          <FileDetails>
            <File>40</File>
            <UploadedFileName>BC Verification Statement 2012 - abc.pdf</UploadedFileName>
            <UploadedBy>Buddy</UploadedBy>
            <UploadedDate>28/03/2013 9:28:33 PM</UploadedDate>
          </FileDetails>
        </SubProcess>
      </Process>
    </ReportVerification>
    <ProcessFlowDiagram>
      <Process ProcessName="ProcessFlowDiagram">
        <SubProcess SubprocessName="A Process Flow Diagram is required for SFO and LFO (Parent) reports" InformationRequirement="Required">
          <FileDetails>
            <File>44</File>
            <UploadedFileName>abc.pdf</UploadedFileName>
            <UploadedBy>Buddy</UploadedBy>
            <UploadedDate>23/02/2013 7:54:10 PM</UploadedDate>
          </FileDetails>
        </SubProcess>
      </Process>
    </ProcessFlowDiagram>
  </ActivityData>
</ReportData>

$$);

-- Refresh all materialized views
refresh materialized view ggircs_swrs.report with data;
refresh materialized view ggircs_swrs.organisation with data;
refresh materialized view ggircs_swrs.facility with data;
refresh materialized view ggircs_swrs.activity with data;
refresh materialized view ggircs_swrs.unit with data;
refresh materialized view ggircs_swrs.identifier with data;
refresh materialized view ggircs_swrs.naics with data;
refresh materialized view ggircs_swrs.emission with data;
refresh materialized view ggircs_swrs.final_report with data;
refresh materialized view ggircs_swrs.fuel with data;
refresh materialized view ggircs_swrs.permit with data;
refresh materialized view ggircs_swrs.parent_organisation with data;
refresh materialized view ggircs_swrs.contact with data;
refresh materialized view ggircs_swrs.address with data;
refresh materialized view ggircs_swrs.descriptor with data;

select ggircs_swrs.export_mv_to_table();

-- Function export_mv_to_table exists
select has_function( 'ggircs_swrs', 'export_mv_to_table', 'Schema ggircs_swrs has function export_mv_to_table()' );

-- All tables created by the function exist in schema ggircs
select tables_are('ggircs'::name, ARRAY[
    'report'::name,
    'organisation'::name,
    'facility'::name,
    'activity'::name,
    'unit'::name,
    'identifier'::name,
    'naics'::name,
    'emission'::name,
    'final_report'::name,
    'fuel'::name,
    'permit'::name,
    'parent_organisation'::name,
    'contact'::name,
    'address'::name,
    'descriptor'::name
    ],
    $$Schema ggircs has tables [
                             report, organisation, facility, activity,
                             unit, identifier, naics. emission, final_report,
                             fuel, permit, parent_organisation, contact, address
                             descriptor $$
);

-- All tables in schema ggircs have data
select isnt_empty('select * from ggircs.report', 'there is data in ggircs.report');
select isnt_empty('select * from ggircs.organisation', 'there is data in ggircs.organisation');
select isnt_empty('select * from ggircs.facility', 'there is data in ggircs.facility');
select isnt_empty('select * from ggircs.activity', 'there is data in ggircs.activity');
select isnt_empty('select * from ggircs.unit', 'there is data in ggircs.unit');
select isnt_empty('select * from ggircs.identifier', 'there is data in ggircs.identifier');
select isnt_empty('select * from ggircs.naics', 'there is data in ggircs.naics');
select isnt_empty('select * from ggircs.emission', 'there is data in ggircs.emission');
select isnt_empty('select * from ggircs.final_report', 'there is data in ggircs.final_report');
select isnt_empty('select * from ggircs.fuel', 'there is data in ggircs.fuel');
select isnt_empty('select * from ggircs.permit', 'there is data in ggircs.permit');
select isnt_empty('select * from ggircs.parent_organisation', 'there is data in ggircs.parent_organisation');
select isnt_empty('select * from ggircs.contact', 'there is data in ggircs.contact');
select isnt_empty('select * from ggircs.address', 'there is data in ggircs.address');
select isnt_empty('select * from ggircs.descriptor', 'there is data in ggircs.descriptor');

-- Data in ggircs_swrs.report === data in ggircs_report
select results_eq($$select
                      ghgr_import_id,
                      source_xml::text,
                      imported_at,
                      swrs_report_id,
                      prepop_report_id,
                      report_type,
                      swrs_facility_id,
                      swrs_organisation_id,
                      reporting_period_duration,
                      status,
                      version,
                      submission_date,
                      last_modified_by,
                      last_modified_date,
                      update_comment,
                      swrs_report_history_id
                  from ggircs_swrs.report$$,

                 $$select
                      ghgr_import_id,
                      source_xml::text,
                      imported_at,
                      swrs_report_id,
                      prepop_report_id,
                      report_type,
                      swrs_facility_id,
                      swrs_organisation_id,
                      reporting_period_duration,
                      status,
                      version,
                      submission_date,
                      last_modified_by,
                      last_modified_date,
                      update_comment,
                      swrs_report_history_id
                  from ggircs.report$$,

    'data in ggircs_swrs.report === ggircs.report');

-- Data in ggircs_swrs.organisation === data in ggircs.organisation
select results_eq($$select
                      ghgr_import_id,
                      swrs_organisation_id,
                      business_legal_name,
                      english_trade_name,
                      french_trade_name,
                      cra_business_number,
                      duns,
                      website
                  from ggircs_swrs.organisation$$,

                 $$select
                      ghgr_import_id,
                      swrs_organisation_id,
                      business_legal_name,
                      english_trade_name,
                      french_trade_name,
                      cra_business_number,
                      duns,
                      website
                  from ggircs.organisation$$,

    'data in ggircs_swrs.organisation === ggircs.organisation');

-- Data in ggircs_swrs.emission === data in ggircs.emission
select results_eq('select * from ggircs_swrs.emission order by process_idx, sub_process_idx, units_idx, unit_idx, substances_idx, substance_idx, fuel_idx, emissions_idx, emission_idx asc',

              $$select
                  ghgr_import_id,
                  activity_name,
                  sub_activity_name,
                  unit_name,
                  sub_unit_name,
                  process_idx,
                  sub_process_idx,
                  units_idx,
                  unit_idx,
                  substances_idx,
                  substance_idx,
                  fuel_idx,
                  fuel_name,
                  emissions_idx,
                  emission_idx,
                  emission_type,
                  gas_type,
                  methodology,
                  not_applicable,
                  quantity,
                  calculated_quantity,
                  emission_category
                from ggircs.emission
                order by
                    process_idx,
                    sub_process_idx,
                    units_idx,
                    unit_idx,
                    substances_idx,
                    substance_idx,
                    fuel_idx,
                    emissions_idx,
                    emission_idx
                 asc
              $$,

              'data in ggircs_swrs.emission === ggircs.emission');

select * from finish();
rollback;
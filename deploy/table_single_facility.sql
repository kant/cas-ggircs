-- Deploy ggircs:table_facility to pg
-- requires: schema_ggircs

begin;

create table ggircs.single_facility (

    id                        integer primary key,
    ghgr_import_id            integer,
    identifier_id             integer,
    organisation_id           integer,
    report_id                 integer,
    swrs_facility_id          integer,
    parent_facility_id        integer,
    facility_name             varchar(1000),
    facility_type             varchar(1000),
    relationship_type         varchar(1000),
    portability_indicator     varchar(1000),
    status                    varchar(1000),
    latitude                  numeric,
    longitude                 numeric
);

comment on table ggircs.single_facility is 'the table housing all report data pertaining to the reporting facility';
comment on column ggircs.single_facility.id is 'The primary key';
comment on column ggircs.single_facility.ghgr_import_id is 'The primary key for the materialized view';
comment on column ggircs.single_facility.identifier_id is 'A foreign key reference to ggircs.identifier';
comment on column ggircs.single_facility.organisation_id is 'A foreign key reference to ggircs.organisation';
comment on column ggircs.single_facility.report_id is 'A foreign key reference to ggircs.report';
comment on column ggircs.single_facility.swrs_facility_id is 'The reporting facility swrs id';
comment on column ggircs.single_facility.parent_facility_id is 'The id of LFO facility this facility belongs to';
comment on column ggircs.single_facility.facility_name is 'The name of the reporting facility';
comment on column ggircs.single_facility.facility_type is 'The type of the reporting facility';
comment on column ggircs.single_facility.relationship_type is 'The type of relationship';
comment on column ggircs.single_facility.portability_indicator is 'The portability indicator';
comment on column ggircs.single_facility.status is 'The status of the facility';
comment on column ggircs.single_facility.latitude is 'The latitude of the reporting facility';
comment on column ggircs.single_facility.longitude is 'The longitude of the reporting facility';

commit;

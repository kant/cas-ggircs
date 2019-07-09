-- Deploy ggircs:ciip_table_contact to pg
-- requires: ciip_table_application
-- requires: ciip_table_facility
-- requires: ciip_table_address

begin;

create table ciip.contact (

    id                        serial primary key,
    application_id            integer references ciip.application(id),
    application_co_id         integer references ciip.application(id),
    address_id                integer references ciip.address(id),
    facility_rep_id           integer references ciip.facility(id),
    facility_id               integer references ciip.facility(id),
    operator_id               integer references ciip.operator(id),
    given_name                varchar(1000),
    family_name               varchar(1000),
    telephone_number          varchar(1000),
    fax_number                varchar(1000),
    email_address             varchar(1000),
    position                  varchar(1000)
);

create index ciip_contact_application_foreign_key on ciip.contact(application_id);
create index ciip_contact_application_co_foreign_key on ciip.contact(application_id);
create index ciip_contact_address_foreign_key on ciip.contact(address_id);
create index ciip_contact_facility_foreign_key on ciip.contact(facility_id);
create index ciip_contact_facility_rep_foreign_key on ciip.contact(facility_id);
create index ciip_contact_operator_foreign_key on ciip.contact(operator_id);

comment on table ciip.contact is 'The table containing the contact information for CIIP applications';
comment on column ciip.contact.id is 'The primary key';
comment on column ciip.contact.application_id is 'The id of the application';
comment on column ciip.contact.application_co_id is 'The id of the application this contact is the certifying official for';
comment on column ciip.contact.address_id is 'The id of the address of the contact';
comment on column ciip.contact.facility_id is 'The id of the facility this contact is for';
comment on column ciip.contact.facility_rep_id is 'The id of the facility this contact is the representative of';
comment on column ciip.contact.operator_id is 'The id of the operator';
comment on column ciip.contact.given_name is 'The first/given name';
comment on column ciip.contact.family_name is 'The last/family name';
comment on column ciip.contact.telephone_number is 'The phone number';
comment on column ciip.contact.fax_number is 'The fax number';
comment on column ciip.contact.email_address is 'The email address of the contact';
comment on column ciip.contact.position is 'The role/position of the contact';

commit;
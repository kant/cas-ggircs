-- Deploy ggircs:materialized_view_flat to pg
-- requires: materialized_view_report

begin;

create materialized view ggircs_swrs.flat as (
  with x as (
    select ghgr_import.id,
           xpath('//*[./text()[normalize-space(.)]/parent::* or ./@*]', xml_file) as tag
    from ggircs_swrs.ghgr_import
  )
  select x.id as ghgr_import_id,
         element_id,
         (xpath('name(/*)', node))[1]::varchar(1000)        as class,
         (xpath('name(/*/@*)', node))[1]::varchar(1000)     as attr,
         (xpath('/*/text()|/*/@*', node))[1]::varchar(1000) as value
  from x,
       unnest(x.tag)
         with ordinality as t(node, element_id)
  order by ghgr_import_id desc, element_id asc
);
create unique index ggircs_flat_primary_key on ggircs_swrs.flat (ghgr_import_id, element_id);
create index ggircs_flat_report on ggircs_swrs.flat (ghgr_import_id);

comment on materialized view ggircs_swrs.flat is 'The flat view of data in the swrs report';
comment on column ggircs_swrs.flat.ghgr_import_id is 'The internal ghgr_import id';
comment on column ggircs_swrs.flat.element_id is 'The element id';
comment on column ggircs_swrs.flat.class is 'The class';
comment on column ggircs_swrs.flat.attr is 'The attribute';
comment on column ggircs_swrs.flat.value is 'The value';

commit;
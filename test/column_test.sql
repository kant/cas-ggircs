set client_min_messages to warning;
create extension if not exists pgtap;
reset client_min_messages;

begin;

create schema ggircs_test_fixture;
set search_path to ggircs_test_fixture,public;
create table test_fixture(id serial, name varchar(50), lname varchar, bad$Name varchar(10));
COMMENT ON COLUMN test_fixture.id IS 'has a description';
COMMENT ON COLUMN test_fixture.name IS 'has a description';

select plan(832);

/** Check Column Compliance **/

-- GUIDELINE: DB should have descriptions for all columns
-- TODO: Automate to test on all columns in schema ggircs, Dynamically get number of columns
  -- Add comment to lname column, comment out next line to test the test
  COMMENT ON COLUMN test_fixture.lname IS 'has a description';
  -- Check all columns (position FROM VALUES) for an existing description (regex '.+')
  select matches(
            col_description('test_fixture'::regclass::oid, pos),
            '.+',
            'Column has a description'
          ) FROM (VALUES(1),(2),(3)) F(pos);

-- GUIDELINE: Columns must have defined maximums for CHAR columns
  -- Drop column lname (has no char max length) comment out to test the test
  ALTER TABLE test_fixture DROP COLUMN lname;
  -- Get all max char lengths from char tables
  prepare charCol as select columns.character_maximum_length
                  from information_schema.columns
                  where table_schema = 'ggircs_test_fixture'
                  and data_type like 'char%';
  -- Get all nulls from character_maximum_length column
  prepare nullCol as select columns.character_maximum_length
                      from information_schema.columns
                      where table_schema = 'ggircs_test_fixture'
                      and character_maximum_length IS NULL;
  -- Check there are no nulls for character_max_length when datatype is like 'char%' (INTERSECT ALL charcol <-> nullCol)
  select bag_hasnt(
            'charCol', 'nullCol', 'columns have defined maximums'
        );

-- TODO: Columns must have defined Scale and Precision for NUMERIC columns

-- GUIDELINE: Columns must be defined by an accepted data_type
  -- Get all colums in schema ggircs that have an undefined data_type
  prepare noDataType as select data_type from information_schema.columns
                  where table_schema='ggircs_test_fixture'
                  and data_type IS NULL;
  -- Check that the results returned by the above prepared statement are empty (no undefined data_types)
  select is_empty('noDataType', 'Columns must be defined by an accepted data_type');

-- TODO: Enforce column naming conventions
        -- GUIDELINE: Names are lower-case with underscores_as_word_separators
        -- TODO: Automate getting all columns from tables
          -- Drop column bad$Name to comply with naming guideline, comment out next line to test the test
          ALTER TABLE test_fixture DROP COLUMN bad$Name;
          -- Check that all columns do not return a match of capital letters or non-word characters
          select doesnt_match(
                  col,
                  '[A-Z]|\W',
                  'Column names are lower-case and separated by underscores'
          ) FROM (VALUES('id'), ('name')) F(col);

        -- TODO: Names are singular

        -- GUIDELINE: Avoid reserved keywords (ie. COMMENT -> [name]_comment) https://www.drupal.org/docs/develop/coding-standards/list-of-sql-reserved-words
          -- Drop table 'name' to comply with reserved keywords guideline, comment out next line to test the test
          ALTER TABLE test_fixture DROP COLUMN name;
          -- Check all columns against a dictionary of reserved SQL keywords
          select hasnt_column(
                  'ggircs_test_fixture',
                  'test_fixture',
                  col,
                  format('Column names avoid reserved keywords. Violation: %I', col)
          ) FROM (VALUES('a'),('abort'),('abs'),('access'),('action'),('ada'),('add'),('admin'),('after'),('aggregate'),('alias'),('all'),('allocate'),('also'),('alter'),('always'),('analyse'),('analyze'),('and'),('any'),('are'),('array'),('as'),('asc'),('asensitive'),('assertion'),('assignment'),('asymmetric'),('at'),('atomic'),('attribute'),('attributes'),('audit'),('authorization'),('auto_increment'),('avg'),('avg_row_length'),('backup'),('backward'),('before'),('begin'),('bernoulli'),('between'),('bigint'),('binary'),('bit'),('bit_length'),('bitvar'),('blob'),('bool'),('boolean'),('both'),('breadth'),('browse'),('break'),('by'),('bulk'),('c'),('cache'),('called'),('call'),('cardinality'),('cascade'),('cascaded'),('case'),('catalog'),('cast'),('catalog_name'),('ceil'),('chain'),('ceiling'),('change'),('char'),('char_length'),('character'),('character_set_catalog'),('character_length'),('character_set_name'),('character_set_schema'),('characters'),('characteristics'),('check'),('checked'),('checkpoint'),('checksum'),('class_origin'),('class'),('close'),('clob'),('clustered'),('cluster'),('coalesce'),('cobol'),('collate'),('collation'),('absolute'),('collation_catalog'),('collation_name'),('collect'),('collation_schema'),('column'),('command_function_code'),('column_name'),('comment'),('commit'),('committed'),('completion'),('compress'),('compute'),('condition'),('condition_number'),('connect'),('connection'),('connection_name'),('constraint'),('constraint_catalog'),('constraint_name'),('constraint_schema'),('constraints'),('constructor'),('contains'),('containstable'),('continue'),('conversion'),('convert'),('copy'),('corr'),('corresponding'),('count'),('covar_pop'),('covar_samp'),('create'),('columns'),('createdb'),('createrole'),('command_function'),('createuser'),('cross'),('csv'),('cube'),('cume_dist'),('current'),('current_default_transform_group'),('current_path'),('current_date'),('current_role'),('current_time'),('current_timestamp'),('current_transform_group_for_type'),('current_user'),('cursor'),('cycle'),('cursor_name'),('data'),('database'),('date'),('datetime'),('datetime_interval_code'),('databases'),('datetime_interval_precision'),('day'),('day_hour'),('day_microsecond'),('day_minute'),('day_second'),('dayofmonth'),('dayofweek'),('dbcc'),('deallocate'),('dayofyear'),('dec'),('decimal'),('default'),('declare'),('defaults'),('deferrable'),('deferred'),('defined'),('definer'),('degree'),('delay_key_write'),('delete'),('delayed'),('delimiter'),('delimiters'),('dense_rank'),('depth'),('deny'),('deref'),('derived'),('desc'),('describe'),('descriptor'),('destroy'),('destructor'),('deterministic'),('diagnostics'),('dictionary'),('disable'),('disconnect'),('disk'),('distinct'),('dispatch'),('distinctrow'),('distributed'),('div'),('do'),('domain'),('double'),('drop'),('dual'),('dump'),('dummy'),('dynamic'),('dynamic_function'),('dynamic_function_code'),('each'),('element'),('else'),('elseif'),('enable'),('enclosed'),('encoding'),('encrypted'),('end-exec'),('end'),('enum'),('equals'),('errlvl'),('escape'),('escaped'),('every'),('except'),('exception'),('exclude'),('excluding'),('exclusive'),('exec'),('execute'),('existing'),('exists'),('exit'),('explain'),('exp'),('fetch'),('fields'),('file'),('false'),('fillfactor'),('external'),('extract'),('filter'),('first'),('final'),('float'),('float4'),('float8'),('floor'),('flush'),('following'),('force'),('for'),('foreign'),('fortran'),('forward'),('free'),('freetexttable'),('freetext'),('found'),('from'),('freeze'),('full'),('function'),('fulltext'),('g'),('fusion'),('general'),('generated'),('go'),('get'),('goto'),('grant'),('global'),('granted'),('greatest'),('grants'),('group'),('header'),('handler'),('heap'),('grouping'),('having'),('holdlock'),('hierarchy'),('hold'),('high_priority'),('host'),('hour'),('hosts'),('hour_minute'),('hour_microsecond'),('hour_second'),('identity'),('identified'),('identity_insert'),('identitycol'),('ignore'),('ilike'),('immediate'),('immutable'),('if'),('implicit'),('implementation'),('in'),('including'),('index'),('include'),('increment'),('indicator'),('inherit'),('inherits'),('infix'),('infile'),('initial'),('initialize'),('inner'),('initially'),('input'),('inout'),('insensitive'),('insert_id'),('insert'),('instantiable'),('instance'),('int'),('instead'),('int2'),('int1'),('int3'),('int4'),('integer'),('int8'),('intersect'),('intersection'),('interval'),('into'),('invoker'),('is'),('isnull'),('isolation'),('iterate'),('isam'),('join'),('k'),('key'),('key_member'),('key_type'),('keys'),('kill'),('lancompiler'),('large'),('language'),('last'),('least'),('last_insert_id'),('leading'),('lateral'),('leave'),('left'),('length'),('less'),('level'),('like'),('limit'),('lines'),('lineno'),('listen'),('ln'),('local'),('load'),('localtimestamp'),('location'),('locator'),('localtime'),('lock'),('login'),('long'),('logs'),('longblob'),('low_priority'),('loop'),('longtext'),('m'),('lower'),('map'),('match'),('max'),('matched'),('max_rows'),('maxextents'),('maxvalue'),('mediumblob'),('mediumint'),('mediumtext'),('merge'),('member'),('message_octet_length'),('message_length'),('message_text'),('method'),('middleint'),('min'),('minus'),('minute'),('min_rows'),('minute_microsecond'),('minute_second'),('minvalue'),('mlslabel'),('mod'),('mode'),('modifies'),('modify'),('month'),('module'),('more'),('monthname'),('move'),('multiset'),('mumps'),('myisam'),('name'),('national'),('names'),('natural'),('new'),('nesting'),('nchar'),('nclob'),('next'),('no'),('noaudit'),('nocheck'),('no_write_to_binlog'),('nocompress'),('nocreaterole'),('nocreateuser'),('nocreatedb'),('noinherit'),('nonclustered'),('none'),('normalize'),('nologin'),('normalized'),('nosuperuser'),('not'),('nothing'),('notify'),('notnull'),('nowait'),('null'),('nullable'),('nullif'),('nulls'),('number'),('octet_length'),('object'),('octets'),('numeric'),('of'),('off'),('offline'),('offsets'),('offset'),('oids'),('old'),('online'),('on'),('only'),('open'),('opendatasource'),('openquery'),('openrowset'),('openxml'),('operator'),('optimize'),('operation'),('optionally'),('or'),('options'),('option'),('order'),('ordering'),('ordinality'),('others'),('out'),('outer'),('output'),('outfile'),('over'),('owner'),('pack_keys'),('pad'),('parameter_mode'),('parameter'),('parameter_ordinal_position'),('parameter_name'),('parameter_specific_catalog'),('parameter_specific_name'),('parameter_specific_schema'),('parameters'),('partial'),('partition'),('pascal'),('password'),('path'),('pctfree'),('percent'),('percent_rank'),('percentile_cont'),('percentile_disc'),('overriding'),('placing'),('pli'),('plan'),('position'),('postfix'),('power'),('preceding'),('precision'),('prefix'),('overlaps'),('preorder'),('prepare'),('prepared'),('overlay'),('preserve'),('primary'),('print'),('proc'),('privileges'),('procedural'),('prior'),('process'),('procedure'),('public'),('processlist'),('purge'),('quote'),('raid0'),('raiserror'),('rank'),('range'),('raw'),('read'),('reads'),('readtext'),('real'),('reconfigure'),('recheck'),('ref'),('recursive'),('references'),('referencing'),('regr_avgx'),('regr_count'),('regexp'),('regr_avgy'),('regr_intercept'),('regr_slope'),('regr_r2'),('regr_sxx'),('regr_sxy'),('regr_syy'),('relative'),('reindex'),('release'),('reload'),('repeat'),('repeatable'),('rename'),('replace'),('replication'),('reset'),('resource'),('resignal'),('require'),('restart'),('restore'),('result'),('restrict'),('return'),('returned_cardinality'),('returned_length'),('returned_octet_length'),('returned_sqlstate'),('returns'),('right'),('revoke'),('role'),('rlike'),('rollup'),('rollback'),('routine'),('routine_catalog'),('routine_name'),('routine_schema'),('row_count'),('row_number'),('row'),('rowcount'),('rowguidcol'),('rowid'),('rows'),('rule'),('rownum'),('savepoint'),('save'),('scale'),('schema'),('schemas'),('schema_name'),('scope_catalog'),('scope_schema'),('scope'),('scope_name'),('scroll'),('search'),('second'),('section'),('security'),('second_microsecond'),('select'),('sensitive'),('self'),('separator'),('sequence'),('serializable'),('server_name'),('session_user'),('session'),('setof'),('set'),('sets'),('setuser'),('share'),('show'),('shutdown'),('signal'),('simple'),('size'),('similar'),('smallint'),('soname'),('source'),('some'),('space'),('spatial'),('specific'),('specifictype'),('specific_name'),('sql'),('sql_big_result'),('sql_big_tables'),('sql_big_selects'),('sql_log_off'),('sql_calc_found_rows'),('sql_log_update'),('sql_low_priority_updates'),('sql_select_limit'),('sql_small_result'),('sql_warnings'),('sqlcode'),('sqlca'),('sqlexception'),('sqlstate'),('sqlerror'),('sqrt'),('ssl'),('sqlwarning'),('stable'),('start'),('starting'),('statement'),('state'),('static'),('status'),('statistics'),('stddev_pop'),('stddev_samp'),('stdin'),('stdout'),('storage'),('straight_join'),('strict'),('string'),('structure'),('style'),('subclass_origin'),('submultiset'),('sublist'),('substring'),('sum'),('successful'),('superuser'),('symmetric'),('sysdate'),('sysid'),('synonym'),('table'),('system'),('system_user'),('table_name'),('tablesample'),('tables'),('temp'),('tablespace'),('template'),('temporary'),('terminate'),('terminated'),('text'),('textsize'),('than'),('then'),('ties'),('time'),('timezone_hour'),('timestamp'),('timezone_minute'),('tinyint'),('tinyblob'),('tinytext'),('to'),('toast'),('top'),('trailing'),('transaction'),('top_level_count'),('tran'),('transaction_active'),('transactions_committed'),('transactions_rolled_back'),('transforms'),('transform'),('translation'),('translate'),('treat'),('trigger'),('trigger_catalog'),('trigger_name'),('trim'),('trigger_schema'),('true'),('truncate'),('trusted'),('tsequal'),('uescape'),('type'),('uid'),('unbounded'),('uncommitted'),('undo'),('under'),('unencrypted'),('union'),('unique'),('unknown'),('unlisten'),('unlock'),('unnamed'),('unnest'),('until'),('unsigned'),('update'),('updatetext'),('upper'),('usage'),('use'),('user'),('user_defined_type_catalog'),('user_defined_type_code'),('user_defined_type_schema'),('using'),('user_defined_type_name'),('utc_date'),('utc_time'),('vacuum'),('valid'),('utc_timestamp'),('validator'),('validate'),('value'),('values'),('var_pop'),('var_samp'),('varchar'),('varbinary'),('varchar2'),('variables'),('variable'),('varcharacter'),('varying'),('verbose'),('view'),('volatile'),('waitfor'),('when'),('where'),('whenever'),('width_bucket'),('while'),('window'),('with'),('within'),('without'),('work'),('write'),('writetext'),('x509'),('xor'),('year'),('year_month'),('zerofill'),('zone')) F(col);

rollback;

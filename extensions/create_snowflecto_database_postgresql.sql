CREATE DATABASE snowflecto;
GRANT CONNECT ON DATABASE snowflecto TO snowflecto;
GRANT TEMPORARY ON DATABASE snowflecto TO snowflecto;
GRANT CONNECT ON DATABASE snowflecto TO pgadminforouterconnection;
GRANT TEMPORARY ON DATABASE snowflecto TO pgadminforouterconnection;

\c snowflecto
CREATE TABLE settings(name varchar(250) NOT NULL, value text, description text);
INSERT INTO settings(name, value, description) VALUES ('limit_of_registries', '256', 'Количество реестров, которые можно будет создавать для генерации внутреннего кода. Минимальное значение - 3. Т.к. нулевой и последний реестры вспомогательные и нужны для предотвращения ситуаций с нехваткой номеров. В обычном режиме будут использватьсяя реестры со 1-го по 254. Нулевой хранит индекс самой первой капли. А 255-й - последней.'), 
('limit_of_indexes_in_registry', '2147483648', 'Количество возможных индексов в каждом реестре.');

CREATE TABLE collections(id integer NOT NULL PRIMARY KEY, name varchar(250) NOT NULL, description text, composition_volume integer NOT NULL);

CREATE TABLE water_vessels(collection integer NOT NULL, begin_drop_index numeric(1000) NOT NULL, end_drop_index numeric(1000) NOT NULL);

CREATE TABLE drops_internal_registries(collection integer NOT NULL, registry smallint NOT NULL, sort_order smallint NOT NULL);

CREATE TABLE drops_internal_indexes(collection integer NOT NULL, drop_index numeric(1000) NOT NULL, in_registry smallint NOT NULL, in_index integer NOT NULL);

CREATE TABLE freezing_drops(collection integer NOT NULL, in_registry smallint NOT NULL, in_index integer NOT NULL, begin timestamp not null);

CREATE TABLE freezers(id integer NOT NULL PRIMARY KEY, name varchar(250) NOT NULL, description text);

CREATE TABLE compositions(collection integer NOT NULL, drop_index numeric(1000) NOT NULL, quality numeric(15, 10) NOT NULL, freezer integer NOT NULL, parameters jsonpath);

CREATE TABLE potential_snowflakes(collection integer NOT NULL, in_registry smallint NOT NULL, in_index integer NOT NULL, quality numeric(15, 10) not null);

CREATE TABLE useless_snowflakes(collection integer NOT NULL, in_registry smallint NOT NULL, in_index integer NOT NULL);

CREATE TABLE autotests_control_values(id smallint NOT NULL, step integer NOT NULL, control_value jsonpath);

GRANT SELECT ON ALL TABLES IN SCHEMA public TO snowflecto;
GRANT INSERT ON ALL TABLES IN SCHEMA public TO snowflecto;
GRANT UPDATE ON ALL TABLES IN SCHEMA public TO snowflecto;
GRANT DELETE ON ALL TABLES IN SCHEMA public TO snowflecto;
GRANT TRUNCATE ON ALL TABLES IN SCHEMA public TO snowflecto;

GRANT SELECT ON ALL TABLES IN SCHEMA public TO pgadminforouterconnection;
GRANT INSERT ON ALL TABLES IN SCHEMA public TO pgadminforouterconnection;
GRANT UPDATE ON ALL TABLES IN SCHEMA public TO pgadminforouterconnection;
GRANT DELETE ON ALL TABLES IN SCHEMA public TO pgadminforouterconnection;
GRANT TRUNCATE ON ALL TABLES IN SCHEMA public TO pgadminforouterconnection;

CREATE DATABASE snowflecto;
GRANT CONNECT ON DATABASE snowflecto TO python;
GRANT TEMPORARY ON DATABASE snowflecto TO python;

\c snowflecto
CREATE TABLE collections(link UUID not null default gen_random_uuid(), name varchar(250) not null, description text, snowflakeslimit integer not null);
GRANT SELECT ON collections TO python;
GRANT INSERT ON collections TO python;
GRANT UPDATE ON collections TO python;
GRANT DELETE ON collections TO python;

CREATE TABLE watervessels(collection UUID not null, begindropindex bigint not null, enddropindex bigint not null);
GRANT SELECT ON watervessels TO python;
GRANT INSERT ON watervessels TO python;
GRANT UPDATE ON watervessels TO python;
GRANT DELETE ON watervessels TO python;

CREATE TABLE freezingdrops(collection UUID not null, dropindex bigint not null, begin timestamp not null);
GRANT SELECT ON freezingdrops TO python;
GRANT INSERT ON freezingdrops TO python;
GRANT UPDATE ON freezingdrops TO python;
GRANT DELETE ON freezingdrops TO python;

CREATE TABLE freezers(link UUID not null default gen_random_uuid(), name varchar(250) not null, description text);
GRANT SELECT ON freezers TO python;
GRANT INSERT ON freezers TO python;
GRANT UPDATE ON freezers TO python;
GRANT DELETE ON freezers TO python;

CREATE TABLE composition(collection UUID not null, dropindex bigint not null, quality numeric(15, 10) not null, freezer UUID, parameters jsonpath);
GRANT SELECT ON composition TO python;
GRANT INSERT ON composition TO python;
GRANT UPDATE ON composition TO python;
GRANT DELETE ON composition TO python;

CREATE TABLE interestingdrops(collection UUID not null, dropindex bigint not null, quality numeric(15, 10) not null);
GRANT SELECT ON interestingdrops TO python;
GRANT INSERT ON interestingdrops TO python;
GRANT UPDATE ON interestingdrops TO python;
GRANT DELETE ON interestingdrops TO python;

CREATE TABLE formedsnowflakes(collection UUID not null, dropindex bigint not null);
GRANT SELECT ON formedsnowflakes TO python;
GRANT INSERT ON formedsnowflakes TO python;
GRANT UPDATE ON formedsnowflakes TO python;
GRANT DELETE ON formedsnowflakes TO python;

-- Deploy evergreen:create_extensions to pg
-- requires: evergreen

\c evergreen postgres;

BEGIN;

CREATE LANGUAGE plperlu;

CREATE EXTENSION tablefunc;
CREATE EXTENSION xml2;
CREATE EXTENSION hstore;
CREATE EXTENSION intarray;

COMMIT;




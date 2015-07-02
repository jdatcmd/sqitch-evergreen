-- Revert evergreen:create_extensions from pg

\c evergreen postgres;
BEGIN;

-- Deploy evergreen:create_extensions to pg
-- requires: evergreen

DROP LANGUAGE plperlu CASCADE;
DROP EXTENSION tablefunc;
DROP EXTENSION xml2;
DROP EXTENSION hstore;
DROP EXTENSION intarray;

COMMIT;
-- Revert evergreen:create_extensions from pg

\c evergreen postgres;
BEGIN;

-- Deploy evergreen:create_extensions to pg
-- requires: evergreen

DROP LANGUAGE plperlu CASCADE;
DROP EXTENSION tablefunc CASCADE;
DROP EXTENSION xml2 CASCADE;
DROP EXTENSION hstore CASCADE;
DROP EXTENSION intarray CASCADE;

COMMIT;
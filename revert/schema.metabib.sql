-- Revert evergreen:schema.metabib from pg

BEGIN;

DROP SCHEMA IF EXISTS metabib CASCADE;

-- XXX Add DDLs here.

COMMIT;

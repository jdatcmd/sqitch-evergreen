-- Revert evergreen:schema.acq from pg

BEGIN;

DROP SCHEMA IF EXISTS acq CASCADE;

-- XXX Add DDLs here.

COMMIT;

-- Revert evergreen:schema.staging from pg

BEGIN;
DROP SCHEMA IF EXISTS staging CASCADE;
-- XXX Add DDLs here.

COMMIT;

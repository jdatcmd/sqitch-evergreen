-- Revert evergreen:schema.functions from pg

BEGIN;
DROP SCHEMA IF EXISTS functions CASCADE;
-- XXX Add DDLs here.

COMMIT;

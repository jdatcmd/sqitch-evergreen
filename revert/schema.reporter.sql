-- Revert evergreen:schema.reporter from pg

BEGIN;
DROP SCHEMA IF EXISTS reporter CASCADE;
-- XXX Add DDLs here.

COMMIT;

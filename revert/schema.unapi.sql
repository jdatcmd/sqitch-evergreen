-- Revert evergreen:schema.unapi from pg

BEGIN;
DROP SCHEMA IF EXISTS unapi CASCADE;
-- XXX Add DDLs here.

COMMIT;

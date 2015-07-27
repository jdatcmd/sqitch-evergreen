-- Revert evergreen:schema.authority from pg

BEGIN;

DROP SCHEMA IF EXISTS authority CASCADE;
-- XXX Add DDLs here.

COMMIT;

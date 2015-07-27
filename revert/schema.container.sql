-- Revert evergreen:schema.container from pg

BEGIN;

DROP SCHEMA IF EXISTS container CASCADE;
-- XXX Add DDLs here.

COMMIT;

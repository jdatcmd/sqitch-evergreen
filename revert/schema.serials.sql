-- Revert evergreen:schema.serials from pg

BEGIN;

DROP SCHEMA IF EXISTS serial CASCADE;
-- XXX Add DDLs here.

COMMIT;

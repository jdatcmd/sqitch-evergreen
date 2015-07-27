-- Revert evergreen:schema.serials from pg

BEGIN;

DROP SCHEMA IF EXISTS serials CASCADE;
-- XXX Add DDLs here.

COMMIT;

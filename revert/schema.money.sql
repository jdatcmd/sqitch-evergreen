-- Revert evergreen:schema.money from pg

BEGIN;
DROP SCHEMA IF EXISTS money CASCADE;
-- XXX Add DDLs here.

COMMIT;

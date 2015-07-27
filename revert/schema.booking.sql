-- Revert evergreen:schema.booking from pg

BEGIN;

DROP SCHEMA IF EXISTS booking CASCADE;
-- XXX Add DDLs here.

COMMIT;

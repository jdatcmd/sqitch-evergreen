-- Revert evergreen:schema.vandelay from pg

BEGIN;
DROP SCHEMA IF EXISTS vandelay CASCADE;
-- XXX Add DDLs here.

COMMIT;

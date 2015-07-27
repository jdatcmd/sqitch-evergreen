-- Revert evergreen:schema.permissions from pg

BEGIN;

DROP SCHEMA IF EXISTS permissions CASCADE;
-- XXX Add DDLs here.

COMMIT;

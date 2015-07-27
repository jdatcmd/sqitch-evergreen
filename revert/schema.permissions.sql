-- Revert evergreen:schema.permissions from pg

BEGIN;

DROP SCHEMA IF EXISTS permission CASCADE;
-- XXX Add DDLs here.

COMMIT;

-- Revert evergreen:schema.action from pg

BEGIN;

DROP SCHEMA IF EXISTS action CASCADE;
-- XXX Add DDLs here.

COMMIT;

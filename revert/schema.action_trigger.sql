-- Revert evergreen:schema.action_trigger from pg

BEGIN;

DROP SCHEMA IF EXISTS action_trigger CASCADE;
-- XXX Add DDLs here.

COMMIT;

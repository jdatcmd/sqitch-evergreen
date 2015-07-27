-- Revert evergreen:schema.asset from pg

BEGIN;

DROP SCHEMA IF EXISTS asset CASCADE;
-- XXX Add DDLs here.

COMMIT;

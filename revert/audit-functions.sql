-- Revert evergreen:audit-functions from pg

BEGIN;

DROP SCHEMA IF EXISTS auditor CASCADE;

-- XXX Add DDLs here.

COMMIT;

-- Revert evergreen:url_verify.schema from pg

BEGIN;
DROP SCHEMA IF EXISTS url_verify CASCADE;
-- XXX Add DDLs here.

COMMIT;

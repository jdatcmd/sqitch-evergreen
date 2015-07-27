-- Revert evergreen:schema.staged_search from pg

BEGIN;
DROP SCHEMA IF EXISTS staged_search CASCADE;
-- XXX Add DDLs here.

COMMIT;

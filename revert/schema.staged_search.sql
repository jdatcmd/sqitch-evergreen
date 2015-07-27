-- Revert evergreen:schema.staged_search from pg

BEGIN;
DROP SCHEMA IF EXISTS search CASCADE;
-- XXX Add DDLs here.

COMMIT;

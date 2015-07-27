-- Revert evergreen:schema.query from pg

BEGIN;
DROP SCHEMA IF EXISTS query CASCADE;
-- XXX Add DDLs here.

COMMIT;

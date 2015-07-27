-- Revert evergreen:schema.biblio from pg

BEGIN;

DROP SCHEMA IF EXISTS biblio CASCADE;
-- XXX Add DDLs here.

COMMIT;

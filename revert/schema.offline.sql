-- Revert evergreen:schema.offline from pg


\c evergreen evergreen

BEGIN;

DROP SCHEMA IF EXISTS offline CASCADE;

COMMIT;

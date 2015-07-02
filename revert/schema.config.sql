-- Revert evergreen:schema.config from pg

BEGIN;

DROP SCHEMA IF EXISTS stats CASCADE;
DROP SCHEMA IF EXISTS config CASCADE;

COMMIT;

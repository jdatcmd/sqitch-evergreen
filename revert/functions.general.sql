-- Revert evergreen:functions.general from pg

BEGIN;

DROP SCHEMA IF EXISTS evergreen CASCADE;

COMMIT;

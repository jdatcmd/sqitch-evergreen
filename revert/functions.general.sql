-- Revert evergreen:functions.general from pg

\c evergreen evergreen;

BEGIN;

DROP SCHEMA IF EXISTS evergreen CASCADE;

COMMIT;

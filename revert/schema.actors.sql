-- Revert evergreen:schema.actors from pg

\c evergreen evergreen;
BEGIN;

DROP SCHEMA IF EXISTS actor CASCADE;

COMMIT;

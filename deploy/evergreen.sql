-- Deploy evergreen:evergreen to pg

-- We always connect as evergreen, evergreen unless we need to explicitly not to (such as creating extensions)

\c evergreen evergreen;
SET client_min_messages = 'ERROR';
BEGIN;

-- XXX Add DDLs here.

COMMIT;

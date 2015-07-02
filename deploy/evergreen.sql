-- Deploy evergreen:evergreen to pg

-- We always connect as evergreen, evergreen unless we need to explicitly not to (such as creating extensions)

\c evergreen evergreen;

BEGIN;

-- XXX Add DDLs here.

COMMIT;

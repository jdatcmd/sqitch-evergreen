-- Revert evergreen:view.cross-schema from pg

BEGIN;

-- currently not required as everything is within config. or money. which are reverted from their own scripts

COMMIT;

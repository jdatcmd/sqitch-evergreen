BEGIN;

ALTER FUNCTION metabib.browse_pivot (integer[], text) STABLE;
ALTER FUNCTION metabib.browse_bib_pivot (integer[], text) STABLE;
ALTER FUNCTION metabib.browse_authority_pivot (integer[], text) STABLE;
ALTER FUNCTION metabib.browse_authority_refs_pivot (integer[], text) STABLE;

COMMIT;
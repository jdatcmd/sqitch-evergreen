-- Revert evergreen:functions.aggregate from pg

\c evergreen evergreen;

BEGIN;

-- XXX Add DDLs here.

DROP AGGREGATE IF EXISTS array_accum(anyelement) CASCADE;
DROP AGGREGATE IF EXISTS public.first(anyelement) CASCADE;
DROP AGGREGATE IF EXISTS public.last(anyelement) CASCADE; 
DROP AGGREGATE IF EXISTS public.agg_text(text) CASCADE; 


COMMIT;

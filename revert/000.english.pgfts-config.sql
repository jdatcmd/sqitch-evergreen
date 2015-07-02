-- Revert evergreen:000.english.pgfts-config from pg

BEGIN;

SET search_path = public, pg_catalog;

/*
 * Copyright (C) 2004-2008  Georgia Public Library Service
 * Copyright (C) 2008  Equinox Software, Inc., Laurentian University
 * Mike Rylander <miker@esilibrary.com>
 * Dan Scott <dscott@laurentian.ca>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 */

BEGIN;

SET search_path = public, pg_catalog;

DO $$
DECLARE lang TEXT;
BEGIN
FOR lang IN SELECT substring(pptsd.dictname from '(.*)_stem$') AS lang FROM pg_catalog.pg_ts_dict pptsd JOIN pg_catalog.pg_namespace ppn ON ppn.oid = pptsd.dictnamespace WHERE ppn.nspname = 'pg_catalog' AND pptsd.dictname LIKE '%_stem' LOOP

-- RAISE NOTICE 'FOUND LANGUAGE %', lang;

EXECUTE 'DROP TEXT SEARCH DICTIONARY IF EXISTS ' || lang || '_nostop CASCADE';

END LOOP;
END;
$$;




COMMIT;

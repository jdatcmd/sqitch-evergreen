-- Deploy evergreen:functions.general to pg
-- requires: create_extensions

BEGIN;

-- Rather than polluting the public schema with general Evergreen
-- functions, carve out a dedicated schema

CREATE SCHEMA evergreen;

CREATE OR REPLACE FUNCTION evergreen.change_db_setting(setting_name TEXT, settings TEXT[]) RETURNS VOID AS $$
BEGIN
    EXECUTE 'ALTER DATABASE ' || quote_ident(current_database()) || ' SET ' || quote_ident(setting_name) || ' = ' || array_to_string(settings, ',');
END;
$$ LANGUAGE plpgsql;

SELECT evergreen.change_db_setting('search_path', ARRAY['evergreen','public','pg_catalog']);

CREATE OR REPLACE FUNCTION evergreen.array_remove_item_by_value(inp ANYARRAY, el ANYELEMENT) RETURNS anyarray AS $$ SELECT ARRAY_AGG(x.e) FROM UNNEST( $1 ) x(e) WHERE x.e <> $2; $$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION evergreen.lowercase( TEXT ) RETURNS TEXT AS $$
    return lc(shift);
$$ LANGUAGE PLPERLU STRICT IMMUTABLE;

CREATE OR REPLACE FUNCTION evergreen.xml_escape(str TEXT) RETURNS text AS $$
    SELECT REPLACE(REPLACE(REPLACE($1,
       '&', '&amp;'),
       '<', '&lt;'),
       '>', '&gt;');
$$ LANGUAGE SQL IMMUTABLE;

CREATE OR REPLACE FUNCTION evergreen.regexp_split_to_array(TEXT, TEXT)
RETURNS TEXT[] AS $$
    return encode_array_literal([split $_[1], $_[0]]);
$$ LANGUAGE PLPERLU STRICT IMMUTABLE;

-- Provide a named type for patching functions
CREATE TYPE evergreen.patch AS (patch TEXT);

CREATE OR REPLACE FUNCTION evergreen.xml_pretty_print(input XML) 
    RETURNS XML
    LANGUAGE SQL AS
$func$
SELECT xslt_process($1::text,
$$<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="1.0">
   <xsl:output method="xml" omit-xml-declaration="yes" indent="yes"/>
   <xsl:strip-space elements="*"/>
   <xsl:template match="@*|node()">
     <xsl:copy>
       <xsl:apply-templates select="@*|node()"/>
     </xsl:copy>
   </xsl:template>
 </xsl:stylesheet>
$$::text)::XML
$func$;

COMMENT ON FUNCTION evergreen.xml_pretty_print(input XML) IS
'Simple pretty printer for XML, as written by Andrew Dunstan at http://goo.gl/zBHIk';

CREATE OR REPLACE FUNCTION evergreen.could_be_serial_holding_code(TEXT) RETURNS BOOL AS $$
    use JSON::XS;
    use MARC::Field;

    eval {
        my $holding_code = (new JSON::XS)->decode(shift);
        new MARC::Field('999', @$holding_code);
    };
    return 0 if $@;
    # verify that subfield labels are exactly one character long
    foreach (keys %{ { @$holding_code } }) {
        return 0 if length($_) != 1;
    }
    return 1;
$$ LANGUAGE PLPERLU;

COMMENT ON FUNCTION evergreen.could_be_serial_holding_code(TEXT) IS
    'Return true if parameter is valid JSON representing an array that at minimum doesn''t make MARC::Field balk and only has subfield labels exactly one character long.  Otherwise false.';

COMMIT;

-- this is a template PL/SQL query for the graphs series
-- groupby: value by user input corresponding to pentade/decade/twentade
-- mycountry: country's id
-- myindicator: indicator's id
begin
    -- RETURN PENTADE
    IF (groupby = 1 ) THEN 
        return q'~
            SELECT COUNTRY.NAME || ' ' || INDICATOR.NAME as name, YEAR.PENTADE as year, SUM(DATA.VALUE) as value
            FROM (((COUNTRY
            INNER JOIN DATA ON COUNTRY.ID = DATA.COUNTRY_ID AND COUNTRY.ID = mycountry)
            INNER JOIN YEAR ON DATA.YEAR = YEAR.YEAR)
            INNER JOIN INDICATOR ON DATA.INDICATOR_ID = INDICATOR.ID AND INDICATOR.ID = myindicator)
            GROUP BY COUNTRY.NAME, INDICATOR.NAME, YEAR.PENTADE
            ORDER BY YEAR.PENTADE;
        ~';
    -- RETURN DECADE
    ELSIF (groupby = 2 ) THEN 
        return q'~
            SELECT COUNTRY.NAME || ' ' || INDICATOR.NAME as name, YEAR.DECADE as year, SUM(DATA.VALUE) as value
            FROM (((COUNTRY
            INNER JOIN DATA ON COUNTRY.ID = DATA.COUNTRY_ID AND COUNTRY.ID = mycountry)
            INNER JOIN YEAR ON DATA.YEAR = YEAR.YEAR)
            INNER JOIN INDICATOR ON DATA.INDICATOR_ID = INDICATOR.ID AND INDICATOR.ID = myindicator)
            GROUP BY COUNTRY.NAME, INDICATOR.NAME, YEAR.DECADE
            ORDER BY YEAR.DECADE;
        ~';
    -- RETURN Twentade
    ELSIF (groupby = 3 ) THEN 
        return q'~
            SELECT COUNTRY.NAME || ' ' || INDICATOR.NAME as name, YEAR.TWENTADE as year, SUM(DATA.VALUE) as value
            FROM (((COUNTRY
            INNER JOIN DATA ON COUNTRY.ID = DATA.COUNTRY_ID AND COUNTRY.ID = mycountry)
            INNER JOIN YEAR ON DATA.YEAR = YEAR.YEAR)
            INNER JOIN INDICATOR ON DATA.INDICATOR_ID = INDICATOR.ID AND INDICATOR.ID = myindicator)
            GROUP BY COUNTRY.NAME, INDICATOR.NAME, YEAR.TWENTADE
            ORDER BY YEAR.TWENTADE;
        ~';

    END IF;
    
    -- RETURN SINGLE
    return q'~
        SELECT COUNTRY.NAME || ' ' || INDICATOR.NAME as name, YEAR.YEAR as year, DATA.VALUE as value
        FROM (((COUNTRY
        INNER JOIN DATA ON COUNTRY.ID = DATA.COUNTRY_ID AND COUNTRY.ID = mycountry)
        INNER JOIN YEAR ON DATA.YEAR = YEAR.YEAR)
        INNER JOIN INDICATOR ON DATA.INDICATOR_ID = INDICATOR.ID AND INDICATOR.ID = myindicator)
        WHERE YEAR.YEAR between :P20_YEAR_FROM and :P20_YEAR_TO
        ORDER BY YEAR.YEAR;
    ~';

end;

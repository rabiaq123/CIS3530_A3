-- CIS3530 Assignment 3, Question 2a
-- Rabia Qureshi (1046427)
-- Date: December 2, 2021


-- QUESTION 2a
-- http://www.rebellionrider.com/anchored-datatype-in-pl-sql-manish-sharma/
-- display earliest release year of movies in database
DO 
$$
DECLARE
    mYear movie.year%TYPE;
BEGIN
    SELECT MIN(year) INTO mYear 
    FROM movie;
    RAISE NOTICE 'Earliest Movie Release Year: %',mYear;
END
$$;

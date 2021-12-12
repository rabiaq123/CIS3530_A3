-- CIS3530 Assignment 3, Question 2d
-- Rabia Qureshi (1046427)
-- Date: December 2, 2021


-- QUESTION 2d
-- https://www.postgresqltutorial.com/postgresql-create-function/

-- procedure to find lowest rating given for every movie in the database
CREATE OR REPLACE FUNCTION find_lowest_movie_rating(mNum movie.mid%TYPE, mTitle movie.title%TYPE)
RETURNS VOID
AS $$
DECLARE
    lowestRating rating.stars%TYPE;
BEGIN
    SELECT MIN(stars) INTO lowestRating
    FROM rating
    WHERE mid = mNum;
    RAISE NOTICE 'The lowest rating for % is: %',mTitle, lowestRating;
END;
$$
LANGUAGE 'plpgsql';

-- anonymous block to call procedure
DO 
$$
DECLARE
    c1 CURSOR FOR SELECT DISTINCT mid,title
        FROM rating NATURAL JOIN movie
        ORDER BY mid;
BEGIN
    RAISE NOTICE 'Lowest ratings for each movie in this database:';
    FOR i IN c1 LOOP
        EXECUTE find_lowest_movie_rating(i.mid,i.title);
    END LOOP;
END;
$$;

-- CIS3530 Assignment 3, Question 2b
-- Rabia Qureshi (1046427)
-- Date: December 2, 2021


-- QUESTION 2b
-- https://www.postgresql.org/docs/current/plpgsql-cursors.html
-- find and display names of movies that were given five star ratings
DO 
$$
DECLARE
    c1 CURSOR FOR SELECT title
        FROM rating NATURAL JOIN movie 
        WHERE stars=5;
BEGIN
    RAISE NOTICE '5-Star Movies:';
    FOR i IN c1 LOOP
        RAISE NOTICE 'Title: %',i.title;
    END LOOP;
END
$$;

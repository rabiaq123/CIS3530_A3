-- CIS3530 Assignment 3, Question 2c
-- Rabia Qureshi (1046427)
-- Date: December 2, 2021


-- QUESTION 2c
-- https://www.postgresqltutorial.com/plpgsql-exception/
-- searches for movies directed by Christopher Nolan and 
-- handles case in which no such movie is found
DO 
$$
DECLARE 
    rec RECORD;
	mDirector VARCHAR = 'Christopher Nolan'; -- note that using " over ' makes a difference
BEGIN
	-- select a film 
	SELECT title INTO STRICT rec
	FROM movie
	WHERE director = mDirector;
    -- catch exception
	EXCEPTION 
	   	WHEN no_data_found THEN 
	    	RAISE EXCEPTION 'Movies directed by % not in database', mDirector;
END;
$$

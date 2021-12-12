-- CIS3530 Assignment 3, Question 2e
-- Rabia Qureshi (1046427)
-- Date: December 2, 2021


-- QUESTION 2e
-- https://www.postgresql.org/docs/current/sql-createtrigger.html
-- https://www.postgresqltutorial.com/creating-first-trigger-postgresql/

-- create new table of all movies in the database with one 
-- movie title updated and inserted as new tuple
CREATE TABLE IF NOT EXISTS movieupdated AS SELECT * FROM movie;

-- procedure to copy and insert old movie data into database 
-- before its title and mid get overwritten and updated 
CREATE OR REPLACE FUNCTION store_updated_movie_title()
RETURNS TRIGGER
AS $$
BEGIN 
    INSERT INTO movieupdated(mid,title,year,director)
    VALUES(OLD.mid, OLD.title, OLD.year, OLD.director); 
    RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';

-- create trigger which is calls procedure before table row is updated 
CREATE TRIGGER movie_changes
    BEFORE UPDATE ON movieupdated
    FOR EACH ROW
    EXECUTE PROCEDURE store_updated_movie_title();

-- UPDATE existing movie id and title of 'Raiders of the Lost Ark'
UPDATE movieupdated
SET title='Dora the Explorer: The Movie', mid=109
WHERE title='Raiders of the Lost Ark';

-- show changes
SELECT * from movie;
SELECT * FROM movieupdated;

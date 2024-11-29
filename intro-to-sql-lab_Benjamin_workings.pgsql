-- SELECT * FROM cities;

-- SELECT * FROM countries;

-- SELECT * FROM countrylanguages;


-- Clue #1
-- ANSWER:: Holy See (Vatican City State)

-- SELECT name As country from countries
-- WHERE region like 'Southern Europe'
-- ORDER BY population ASC LIMIT 1;



-- Clue #2
-- ANSWER: Italian


-- SELECT language FROM countries join countrylanguages on countries.code = countrylanguages.countrycode
-- WHERE region like 'Southern Europe'
-- ORDER BY population ASC LIMIT 1;


-- SELECT title from authors join books on authors.id = books.author_id
-- Order By year_published LIMIT 1;


-- Clue #3 - Find out which nearby country speaks nothing but that language.
-- # returns 2 countries 	
-- 1	Holy See (Vatican City State)
-- 2	San Marino

-- SELECT name As country from countries join countrylanguages on countries.code = countrylanguages.countrycode
-- GROUP BY name
-- HAVING COUNT(DISTINCT language) = 1
-- AND MAX(language) = 'Italian';

-- [CODE]
-- SELECT code AS country from countries join countrylanguages on countries.code = countrylanguages.countrycode
-- GROUP BY code
-- HAVING COUNT(DISTINCT language) = 1
-- AND MAX(language) = 'Italian';

-- Clue #4
-- ANSWER: Serravalle

-- SELECT * FROM cities;

-- SELECT * FROM countries;

-- SELECT cities.name AS cities FROM cities join countries on cities.countrycode = countries.code
-- WHERE code IN (
--     SELECT code from countries join countrylanguages on countries.code = countrylanguages.countrycode
--     GROUP BY code
--     HAVING COUNT(DISTINCT language) = 1
--     AND MAX(language) = 'Italian'
-- );


-- Clue #5
-- ANSWER: Serravalle

SELECT language FROM countries join countrylanguages on countries.code = countrylanguages.countrycode;


-- [ORDER]
-- So, the correct order is always: FROM → JOIN → WHERE → GROUP BY → HAVING → SELECT → ORDER BY.
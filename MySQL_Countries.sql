-- Query #1: What query would you run to get all the countries that speak Slovene? Your query should return the name of the country, 
-- language and language percentage. Your query should arrange the result by language percentage in descending order
SELECT countries.name as name, languages.language as language, languages.percentage as percentage FROM countries
JOIN languages ON countries.id = languages.country_id
WHERE languages.language = "Slovene"
ORDER BY languages.percentage DESC;

-- Query #2: What query would you run to display the total number of cities for each country? Your query should return the name of the 
-- country and the total number of cities. Your query should arrange the result by the number of cities in descending order. 
SELECT countries.name as name, COUNT(cities.name) as cities
FROM countries
LEFT JOIN cities ON countries.id = cities.country_id
GROUP BY countries.name
ORDER BY cities DESC;

-- Query #3: What query would you run to get all the cities in Mexico 
-- with a population of greater than 500,000? Your query should arrange the result by population in descending order.
SELECT  name , population, country_id FROM cities
WHERE cities.population > 500000
AND cities.country_id = ( SELECT id FROM countries WHERE countries.name = "Mexico" )
ORDER BY population DESC;

-- Query #4: What query would you run to get all languages in each country with a percentage 
-- greater than 89%? Your query should arrange the result by percentage in descending order.
SELECT countries.name as name, languages.language as language, languages.percentage as percentage FROM countries
JOIN languages ON countries.id = languages.country_id
WHERE languages.percentage > 89
ORDER BY languages.percentage DESC;

-- Query #5: What query would you run to get all the countries with Surface Area 
-- below 501 and Population greater than 100,000?
SELECT name, surface_area, population from countries
WHERE surface_area < 501
AND population >100000;

-- Query #6: What query would you run to get countries with only
--  Constitutional Monarchy governments, with a capital greater than 200 and a life expectancy greater than 75 years?
SELECT name, government_form,capital, life_expectancy from countries
WHERE capital > 200
AND government_form ="Constitutional Monarchy"
AND life_expectancy > 75;

-- Query #7: What query would you run to get all the cities of Argentina inside the Buenos Aires district 
-- and have the population greater than 500, 000? The query should return the Country Name, City Name, District and Population. 
SELECT countries.name as country_name, cities.name as city_name, cities.district, cities.population from countries
JOIN cities ON countries.id = cities.country_id
WHERE cities.district = "Buenos Aires"
AND cities.population > 500000
ORDER BY cities.population DESC;

-- Query #8: What query would you run to summarize the number of countries in each region? The query should display the name of the 
-- region and the number of countries. Also, the query should arrange the result by the number of countries in descending order. 
SELECT countries.region, COUNT(countries.name) as countries
FROM countries
GROUP BY countries.region
ORDER BY countries DESC



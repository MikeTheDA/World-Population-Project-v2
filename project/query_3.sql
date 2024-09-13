-- Question: Which countries had the highest population in 1960 as well as 2023?

(
    SELECT name AS country
    FROM countries
    LEFT JOIN population_year
        ON countries.id = population_year.id
    WHERE year = '1960'
    ORDER BY population DESC
    LIMIT 10
)
INTERSECT
(
    SELECT name AS country
    FROM countries
    LEFT JOIN population_year
        ON countries.id = population_year.id
    WHERE year = '2023'
    ORDER BY population DESC
    LIMIT 10
);
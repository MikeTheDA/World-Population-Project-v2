-- Question: What were the Top 10 Most Populous Countries in 1960?

SELECT
    name,
    population
FROM
    countries
LEFT JOIN population_year
    ON countries.id = population_year.id
WHERE
    year = '1960'
ORDER BY
    population DESC
LIMIT 10;
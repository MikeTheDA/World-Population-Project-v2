-- Question: What was the population growth percentage from 1960 to 2023 for each country?

WITH pop_growth AS (
SELECT 
    c.name,
    CASE
        WHEN p1960.population <> '0'
        THEN ((CAST(p2023.population AS FLOAT) - CAST(p1960.population AS FLOAT)) / p1960.population) * 100 
        ELSE NULL
    END AS population_growth_percentage
FROM 
    countries AS c
LEFT JOIN 
    population_year AS p2023 ON c.id = p2023.id AND p2023.year = '2023'
LEFT JOIN 
    population_year AS p1960 ON c.id = p1960.id AND p1960.year = '1960'
ORDER BY
    population_growth_percentage DESC
)

SELECT 
    name AS country,
    ROUND(CAST(population_growth_percentage AS numeric),0) AS growth_perc
FROM 
    pop_growth
WHERE
    population_growth_percentage IS NOT NULL
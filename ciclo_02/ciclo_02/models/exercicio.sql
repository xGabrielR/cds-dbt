{{
    config(materialized="view")
}}

SELECT * FROM {{ ref('iris') }}
WHERE variety = 'Virginica'
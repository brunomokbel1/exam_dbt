{{ config(
    materialized='table',
    tags=['create_star_tables']
) }}

with artist_data as (

    select  a.artistid::NUMBER as artistid,
        a.name::STRING as name,
        a.birthyear::NUMBER as birthyear,
        a.country::STRING as country
from artist a

)

select *
from artist_data

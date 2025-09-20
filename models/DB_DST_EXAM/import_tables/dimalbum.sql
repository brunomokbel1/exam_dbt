{{ config(
    materialized='table',
    tags=['create_star_tables']
) }}

with album_data as (

    select  a.albumid as albumid,
        a.title as title,
        a.prodyear as prodyear,
        a.cdyear as cdyear,
from album a

)

select *
from album_data
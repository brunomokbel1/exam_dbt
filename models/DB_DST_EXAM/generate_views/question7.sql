{{ config(
    materialized='view',
    tags=['generate_views']
) }}
select  
    t.genre 
from {{ ref('factcd') }} as cd
join {{ ref('dimtrack') }} t 
    on t.trackid = cd.trackid
group by t.genre
order by count(t.playlist) desc 
limit 1
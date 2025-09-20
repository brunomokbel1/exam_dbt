{{ config(
    materialized='view',
    tags=['generate_views']
) }}
select 
    a.title 
from {{ ref('factcd') }} as cd
join {{ ref('dimtrack') }} t 
    on t.trackid = cd.trackid
join {{ ref('dimalbum') }} a 
    on a.albumid = cd.albumid
group by a.title
order by sum(t.millisecond) desc
limit 10
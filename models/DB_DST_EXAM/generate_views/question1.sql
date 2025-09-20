{{ config(
    materialized='view',
    tags=['generate_views']
) }}

select 
    a.title, 
    count(distinct(a.cdyear)) as number_albums  
from {{ ref('factcd') }} as cd
join {{ ref('dimalbum') }} a 
    on a.albumid = cd.albumid
group by a.title
having count(distinct(a.cdyear)) > 1
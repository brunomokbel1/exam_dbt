{{ config(
    materialized='view',
    tags=['generate_views']
) }}
select  
    t.genre, 
    avg(t.bytes) as taille_moyenne 
from {{ ref('factcd') }} as cd
join {{ ref('dimtrack') }} t 
    on t.trackid = cd.trackid
group by t.genre
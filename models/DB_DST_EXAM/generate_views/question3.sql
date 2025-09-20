{{ config(
    materialized='view',
    tags=['generate_views']
) }}
select distinct 
    t.name as titre_morceau, 
    t.composer 
from {{ ref('factcd') }} as cd
join {{ ref('dimtrack') }} t 
    on t.trackid = cd.trackid
where t.genre in ('Rock', 'Jazz')
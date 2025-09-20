{{ config(
    materialized='view',
    tags=['generate_views']
) }}

select distinct 
    t.name as titre_morceau 
from {{ ref('factcd') }} as cd
join {{ ref('dimtrack') }} t 
    on t.trackid = cd.trackid
join {{ ref('dimalbum') }} a 
    on a.albumid = cd.albumid
where a.prodyear in (2000, 2002)
{{ config(
    materialized='view',
    tags=['generate_views']
) }}
select distinct 
    t.playlist 
from {{ ref('factcd') }} as cd
join {{ ref('dimtrack') }} t 
    on t.trackid = cd.trackid
where (t.millisecond * 0.001 / 60) > 4
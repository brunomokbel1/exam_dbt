{{ config(
    materialized='view',
    tags=['generate_views']
) }}
select  
    art.name, 
    count(distinct t.trackid) as nbr_tracks 
from {{ ref('factcd') }} as cd
join {{ ref('dimartiste') }} art 
    on art.artistid = cd.artistid
join {{ ref('dimtrack') }} t 
    on t.trackid = cd.trackid
group by art.name
order by nbr_tracks desc
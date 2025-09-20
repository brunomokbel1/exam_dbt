{{ config(
    materialized='view',
    tags=['generate_views']
) }}
select  
    art.name, 
    count(distinct alb.albumid) as nbr_albums 
from {{ ref('factcd') }} as cd
join {{ ref('dimartiste') }} art 
    on art.artistid = cd.artistid
join {{ ref('dimalbum') }} alb 
    on alb.albumid = cd.albumid
group by art.name
order by nbr_albums desc
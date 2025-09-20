{{ config(
    materialized='view',
    tags=['generate_views']
) }}
select distinct 
    t.playlist 
from {{ ref('factcd') }} as cd
join {{ ref('dimtrack') }} t 
    on t.trackid = cd.trackid
join {{ ref('dimartiste') }} art 
    on art.artistid = cd.artistid
where art.birthyear > 1990
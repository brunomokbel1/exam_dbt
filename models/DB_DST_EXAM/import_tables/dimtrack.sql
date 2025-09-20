{{ config(
    materialized='table',
    tags=['create_star_tables']
) }}

with track_data as (

    select
        t.trackid::NUMBER as trackid,
        t.name::STRING as name,
        g.name::STRING as genre,
        t.composer::STRING as composer,
        t.milliseconds::NUMBER as millisecond,
        t.bytes::NUMBER as bytes,
        t.unitprice::NUMBER as unit_price,
        p.name::STRING as playlist
    from {{ source('DB_DST_EXAM', 'TRACK') }} t
    left join {{ source('DB_DST_EXAM', 'GENRE') }} g
        on t.genreid = g.genreid
    left join {{ source('DB_DST_EXAM', 'PLAYLISTTRACK') }} pt
        on t.trackid = pt.trackid
    left join {{ source('DB_DST_EXAM', 'PLAYLIST') }} p
        on pt.playlistid = p.playlistid

)

select *
from track_data

{{ config(
    materialized='table',
    tags=['create_star_tables']
) }}

with album_track_data as (

    select
        a.albumid as albumid,
        a.artistid as artistid,
        t.trackid as trackid
    from {{ source('DB_DST_EXAM', 'ALBUM') }} a
    left join {{ source('DB_DST_EXAM', 'TRACK') }} t
        on a.albumid = t.albumid

)

select *
from album_track_data
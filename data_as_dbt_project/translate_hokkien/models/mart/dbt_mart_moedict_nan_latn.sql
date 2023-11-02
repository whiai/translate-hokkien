with moedict_with_rand as (
    select 
        m.*,
        r.value as rand
    from 
        {{ ref('dbt_mart_moedict_joined') }} m
    join
        {{ ref('dbt_stg_rand_30000') }} r on m.sentence_id = r.id
)

select
    sentence_id,
    nan_tc,
    zh_xc,
    en,
    case
        when r<.40 then nan_tailo
        when r<.47 then taibun_tl_south
        when r<.50 then taibun_tl_north
        when r<.85 then taibun_poj_south
        else taibun_poj_north
    end as nan_latn,
    case
        when r<.40 then 'nan_tailo'
        when r<.47 then 'taibun_tl_south'
        when r<.50 then 'taibun_tl_north'
        when r<.85 then 'taibun_poj_south'
        else 'taibun_poj_north'
    end as nan_latn_type,
    rand
from moedict_with_rand
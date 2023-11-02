with moedict_joined as (
    select *,
        random() as r
    from {{ ref('dbt_mart_moedict_joined') }}
)

select
    sentence_id,
    nan_tc,
    zh_xc,
    en,
    case
        when r<0.4 then nan_tailo
        when r<0.47 then taibun_tl_south
        when r<0.5 then taibun_tl_north
        when r<0.85 then taibun_poj_south
        else taibun_poj_north
    end as nan_latn,
    case
        when r<0.4 then 'nan_tailo'
        when r<0.47 then 'taibun_tl_south'
        when r<0.5 then 'taibun_tl_north'
        when r<0.85 then 'taibun_poj_south'
        else 'taibun_poj_north'
    end as nan_latn_type,
    r
from moedict_joined
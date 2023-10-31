with moedict as (
    select *
    from {{ ref('dbt_stg_moedict') }}
),

en_transl as (
    select *
    from {{ ref('dbt_int_moedict_en_transl') }}
),

taibun as (
    select *
    from {{ ref('dbt_int_moedict_taibun_scripts') }}
)

select
    moedict.sentence_id,
    moedict.nan_sentence as nan_tc,
    moedict.zh_xc,
    en_transl.english_via_gpt4_zh_translation as en,
    moedict.nan_tailo,
    taibun.taibun_tl_south,
    taibun.taibun_poj_south,
    taibun.taibun_zyuyin_south,
    taibun.taibun_tl_north,
    taibun.taibun_poj_north,
    taibun.taibun_zyuyin_north
from moedict
join en_transl
on moedict.sentence_id = en_transl.sentence_id
join taibun
on moedict.sentence_id = taibun.sentence_id
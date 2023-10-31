with wiki as (
    select *
    from {{ ref('dbt_int_wiki_preunion') }}
),

omniglot as (
    select *
    from {{ ref('dbt_int_omniglot_preunion') }}
),

moedict as (
    select *
    from {{ ref('dbt_mart_moedict_joined') }}
)

select
    wiki.source_id as id,
    wiki.source_origin,
    wiki.source_id,
    wiki.text_en,
    wiki.text_nan_poj,
    null as text_nan_tc,
    wiki.text_en_comment,
    wiki.text_nan_poj_comment,
    null as text_nan_tc_comment
from wiki
union all
select
    (omniglot.source_id + 1000) as id,
    omniglot.source_origin,
    omniglot.source_id,
    omniglot.text_en,
    omniglot.text_nan_poj,
    omniglot.text_nan_tc,
    omniglot.text_en_comment,
    omniglot.text_nan_poj_comment,
    omniglot.text_nan_tc_comment
from omniglot
union all
select
    (moedict.sentence_id + 2000) as id,
    'moedict' as source_origin,
    moedict.sentence_id as source_id,
    moedict.en as text_en,
    moedict.taibun_poj_south as text_nan_poj,
    moedict.nan_tc as text_nan_tc,
    'translated from original paired zh_xc' as text_en_comment,
    'Taibun Southern-Dialect transliteration from nan_tc' as text_nan_poj_comment,
    'original' as text_nan_tc_comment
from moedict
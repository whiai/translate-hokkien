with wiki as (
    select *
    from {{ ref('dbt_int_wiki_preunion') }}
),

omniglot as (
    select *
    from {{ ref('dbt_int_omniglot_preunion') }}
)

select
    wiki.source_id as id,
    wiki.source_origin,
    wiki.source_id,
    wiki.text_en,
    wiki.text_nan_poj,
    null as text_nan_tc
from wiki
union all
select
    (omniglot.source_id + 1000) as id,
    omniglot.source_origin,
    omniglot.source_id,
    omniglot.text_en,
    omniglot.text_nan_poj,
    omniglot.text_nan_tc
from omniglot
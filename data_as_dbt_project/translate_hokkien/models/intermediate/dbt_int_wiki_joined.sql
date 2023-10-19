with wiki as (
    select *
    from {{ ref('dbt_int_wiki') }}
),

wiki_transl as (
    select *
    from {{ ref('dbt_int_wiki_transl') }}
)

select
    wiki.id,
    wiki.stg_wiki_id,
    wiki.text_nan_poj,
    wiki_transl.text_en
from wiki
join wiki_transl
on wiki.stg_wiki_id = wiki_transl.stg_wiki_id
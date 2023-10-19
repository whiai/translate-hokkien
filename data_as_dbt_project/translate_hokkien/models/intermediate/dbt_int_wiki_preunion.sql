with wiki_joined as (
    select *
    from {{ ref('dbt_int_wiki_joined') }}
)

select
    wiki_joined.stg_wiki_id as source_id,
    'wiki' as source_origin,
    wiki_joined.text_nan_poj,
    wiki_joined.text_en
from wiki_joined
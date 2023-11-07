with old as (
    select *
    from {{ ref('dbt_ml_translations_old') }}
),

nanlatn_tc as (
    select *
    from {{ ref('dbt_ml_translations_nanlatn_tc') }}
)

select
    old.date_created,
    old.model_id,
    old.target_result,
    old.source_origin,
    old.source_id,
    old.llm_prompt_tokens,
    old.llm_completion_tokens,
    old.llm_finish_reason
from old
union all
select
    nanlatn_tc.date_created,
    nanlatn_tc.model_id,
    nanlatn_tc.target_result,
    nanlatn_tc.source_origin,
    nanlatn_tc.source_id,
    nanlatn_tc.llm_prompt_tokens,
    nanlatn_tc.llm_completion_tokens,
    nanlatn_tc.llm_finish_reason
from nanlatn_tc
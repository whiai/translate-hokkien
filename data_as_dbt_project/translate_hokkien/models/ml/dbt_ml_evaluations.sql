with old as (
    select *
    from {{ ref('dbt_ml_evaluations_old') }}
),

nanlatn_tc as (
    select *
    from {{ ref('dbt_ml_evaluations_nanlatn_tc') }}
)

select
    old.model_id,
    old.evaluator,
    old.source_origin,
    old.source_id,
    old.bleu,
    old."1-gram",
    old."2-gram",
    old."3-gram",
    old."4-gram"
from old
union all
select
    nanlatn_tc.model_id,
    nanlatn_tc.evaluator,
    nanlatn_tc.source_origin,
    nanlatn_tc.source_id,
    nanlatn_tc.bleu,
    nanlatn_tc."1-gram",
    nanlatn_tc."2-gram",
    nanlatn_tc."3-gram",
    nanlatn_tc."4-gram"
from nanlatn_tc
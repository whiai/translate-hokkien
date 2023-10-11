
-- Use the `ref` function to select from other models

-- select *
-- from {{ ref('dbt_ml_testset_evaluations') }}
-- where id = 1

with evaluations as (
    select *
    from {{ ref('dbt_ml_testset_evaluations') }}
),

translations as (
    select *
    from {{ ref('dbt_ml_testset_translations') }}
)

select *
from evaluations
join translations
on evaluations.testset_translation_id = translations.id

-- Use the `ref` function to select from other models

select *
from {{ ref('dbt_ml_testset_evaluations') }}
where id = 1
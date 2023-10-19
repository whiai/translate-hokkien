with omniglot as (
    select *
    from {{ ref('dbt_stg_omniglot') }}
)

select
    omniglot.id as source_id,
    'omniglot' as source_origin,
    omniglot.reference_en as text_en,
    omniglot.reference_nan_tc as text_nan_tc,
    omniglot.reference_nan_poj as text_nan_poj
from omniglot
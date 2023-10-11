SELECT
    model_id,
    evaluator,
    AVG(score) as average_score
FROM 
    {{ref('dbt_ml_testset_evaluations_expanded')}}
GROUP BY 
    model_id, evaluator
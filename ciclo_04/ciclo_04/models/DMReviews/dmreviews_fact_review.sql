
{{
    config(
        materialized='incremental',
        unique_key='review_id',
        incremental_strategy='merge',
        on_schema_change='append_new_columns'
    )
}}


with tbl as (
    select
        "Id" as review_id,
        "ProductId" as product_id,
        "UserId" as user_id,
        "HelpfulnessNumerator" as helpfulness_numerator,
        "HelpfulnessDenominator" as helpfulness_denominator,
        "HelpfulnessNumerator" / case when "HelpfulnessDenominator" = 0 then 1 else "HelpfulnessDenominator" end as helpfulness_fraction,
        "Score" as score,
        TO_TIMESTAMP("Time") as datetime

    from ciclo_04.reviews
),
deduplicated_cte as (

	{{
		dbt_utils.deduplicate(
			relation='tbl',
			partition_by='review_id',
			order_by='review_id'
		)

	}}

)

select * from deduplicated_cte

{% if is_incremental() %}

    where datetime > (
        select coalesce(max(datetime), '1900-01-01') from {{ this }}
    )

{% endif %}
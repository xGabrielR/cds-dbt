{{
    config(
        materialized='incremental',
        unique_key='id',
        incremental_strategy='merge',
        on_schema_change='append_new_columns'
    )
}}

with source as (
    select 1 as id, '2025-01-05'::date as datetime, 'red' as color
		union all
	select 2 as id, '2025-01-02'::date as datetime, 'blue' as color
        union all
    select 3 as id, '2025-01-05'::date as datetime, 'blue' as color
    union all
    select 4 as id, '2025-01-07'::date as datetime, 'blue' as color
)
select
    id,
    datetime,
    color
from source

{% if is_incremental() %}

    where datetime > (
        select coalesce(max(datetime), '1900-01-01') from {{ this }}
    )

{% endif %}

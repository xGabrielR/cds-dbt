
{% set valores = ['red', 'blue'] %}

with tbl as (
	select 'S' as size, 'red' as color
	union all
	select 'S' as size, 'blue' as color
	union all
	select 'S' as size, 'red' as color
	union all
	select 'M' as size, 'red' as color
)
select
    size,
    {{ dbt_utils.pivot(
        'color',
        valores
    ) }}
from tbl
group by size
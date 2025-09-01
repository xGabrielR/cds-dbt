with tbl as (
	select ' ' as size, 'red' as color
	union all
	select ' A ' as size, 'blue' as color
	union all
	select ' ' as size, 'red' as color
	union all
	select 'M' as size, 'red' as color
),
deduplicate_cte as (
	{{ deduplicate(table_name="tbl") }}
)
select * from deduplicate_cte
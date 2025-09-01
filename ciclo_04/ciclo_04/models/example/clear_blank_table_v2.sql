with tbl as (
	select ' ' as size, 'red' as color
	union all
	select ' A ' as size, 'blue' as color
	union all
	select ' ' as size, 'red' as color
	union all
	select 'M' as size, 'red' as color
)
select 
	{{ clear_blank_v2("size") }} as size,
	color
from tbl
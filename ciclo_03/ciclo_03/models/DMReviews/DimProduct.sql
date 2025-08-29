

select distinct
	"ProductId" as product_id,
	md5(random()::text) as product_name

from {{ source('StgReviews', 'reviews') }}  -- "ciclo_03_StgReviews".reviews r

limit 2
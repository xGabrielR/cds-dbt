

select distinct
	"Id" as review_id,
	UPPER(TRIM("Summary")) as summary,
	UPPER(TRIM("Text")) as long_text

from {{ source('StgReviews', 'reviews') }} -- "ciclo_03_StgReviews".reviews r

limit 2
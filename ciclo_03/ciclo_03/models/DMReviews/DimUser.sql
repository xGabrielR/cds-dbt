

select distinct
	"UserId" as user_id,
	UPPER(TRIM("ProfileName")) as profile_name

from {{ source('StgReviews', 'reviews') }} --"ciclo_03_StgReviews".reviews r

limit 2
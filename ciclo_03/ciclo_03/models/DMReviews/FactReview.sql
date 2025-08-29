

select distinct
	"Id" as review_id,
	"ProductId" as product_id,
	"UserId" as user_id,
	"HelpfulnessNumerator" as helpfulness_numerator,
	"HelpfulnessDenominator" as helpfulness_denominator,
	"HelpfulnessNumerator" / case when "HelpfulnessDenominator" = 0 then 1 else "HelpfulnessDenominator" end as helpfulness_fraction,
	"Score" as score,
	TO_TIMESTAMP("Time") as datetime

from {{ source('StgReviews', 'reviews') }} --"ciclo_03_StgReviews".reviews r

limit 2


select 
	f.review_id,
	f.user_id,
	d.profile_name,
	t.summary,
	p.product_name 
from {{ source('DMReviews', 'FactReview') }} f
inner join {{ source('DMReviews', 'DimReviewText') }} t on t.review_id = f.review_id 
left join  {{ source('DMReviews', 'DimUser') }}       d on f.user_id = d.user_id 
left join  {{ source('DMReviews', 'DimProduct') }}    p on p.product_id = p.product_id
limit 2
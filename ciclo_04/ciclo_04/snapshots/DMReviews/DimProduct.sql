{% snapshot dmreviews_dim_product %}

	{{ 
		config(
			unique_key="product_id",
			strategy="check",
			check_cols=['product_name']
		) 
    }}

	with tbl as (

		select 
			"ProductId" as product_id,
			md5(random()::text) as product_name

		from ciclo_04.reviews

	),
	deduplicated_cte as (

	{{
		dbt_utils.deduplicate(
			relation='tbl',
			partition_by='product_id',
			order_by='product_id'
		)

	}}

	)

	select * from deduplicated_cte

{% endsnapshot %}
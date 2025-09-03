{% snapshot dmreviews_dim_user %}

	{{ 
		config(
			unique_key="user_id",
			strategy="check",
			check_cols=['profile_name']
		) 
    }}

	with tbl as (

		select
			"UserId" as user_id,
			UPPER(TRIM("ProfileName")) as profile_name

		from ciclo_04.reviews

	),
	deduplicated_cte as (

	{{
		dbt_utils.deduplicate(
			relation='tbl',
			partition_by='user_id',
			order_by='user_id'
		)

	}}

	)

	select * from deduplicated_cte

{% endsnapshot %}
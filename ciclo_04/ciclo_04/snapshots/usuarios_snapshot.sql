{% snapshot usuarios_snapshot %}

    {{ config(
        unique_key="cod_usuario",
        strategy="timestamp",
        updated_at="data_cadastro"
    ) 
    }}

    select * from ciclo_04.usuarios

{% endsnapshot %}
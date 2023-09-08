{% snapshot orders_snapshot %}

{{

    config (target_database = 'ANALYTICS', target_schema = 'SNAPSHOTS',unique_key = 'ID',

              strategy = 'timestamp',

              updated_at = '_ETL_LOADED_AT'

    )

}}

select * from {{ ref('stg_orders') }}

 

{% endsnapshot %}
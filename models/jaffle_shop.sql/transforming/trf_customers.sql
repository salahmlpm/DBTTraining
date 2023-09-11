{{ config(schema="transforming", materialized='table') }}
select id, concat(first_name,',',last_name) full_name from {{ref('stg_customers')}}
{{ config(materialized='table') }}


select {{ dbt_utils.generate_surrogate_key(['id', 'first_name', 'last_name']) }} as custuniqueid,*
from raw.jaffle_shop.customers




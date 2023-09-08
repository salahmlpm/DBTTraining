{{
    config(
        materialized='table', schena = 'staging'
    )
}}

select * from raw.jaffle_shop.orders


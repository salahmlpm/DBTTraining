{{
    config(
        materialized='table', schema = 'staging'
    )
}}

select * from raw.jaffle_shop.orders


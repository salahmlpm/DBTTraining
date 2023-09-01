{{ config(materialized='table') }}


select *
from raw.jaffle_shop.customers;


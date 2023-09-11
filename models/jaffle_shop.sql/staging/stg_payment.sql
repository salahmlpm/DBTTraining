{{ config(materialized='table') }}


select *
from raw.stripe.payment


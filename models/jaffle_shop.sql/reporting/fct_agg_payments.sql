{{ config(schema="Reporting", materialized = 'view') }}

select * from {{ ref('trf_order_payment_method_amounts') }}
{{ config(schema="Reporting", materialized = 'view') }}

select * from {{ ref('trf_customers') }}
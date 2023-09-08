{{config(schema='transforming', materialized='table')}}

/*
-- simple sql query without jinja code
select
orderid,
sum(case when paymentmethod = 'bank_transfer' then amount end) as bank_transfer_amount,
sum(case when paymentmethod = 'credit_card' then amount end) as credit_card_amount,
sum(case when paymentmethod = 'gift_card' then amount end) as gift_card_amount,
sum(amount) as total_amount
from {{ ref('stg_payment') }}
group by 1
*/

/*
--using for loop
select orderid,
{%for paymentmethod in ["bank_transfer", "credit_card", "gift_card"]%}
sum(case when paymentmethod = '{{paymentmethod}}' then amount end) as {{paymentmethod}}_amount,
{%endfor%}
sum(amount) as total_amount
from {{ ref('stg_payment') }}
group by 1
*/
/*
--using set variable
{%set payment_methods = ["bank_transfer", "credit_card", "gift_card"] %}
select orderid,
{%for paymentmethod in payment_methods %}
sum(case when paymentmethod = '{{paymentmethod}}' then amount end) as {{paymentmethod}}_amount,
{%endfor%}
sum(amount) as total_amount
from {{ ref('stg_payment') }}
group by 1
*/
/*
--using macro

{%set payment_methods = get_payment_methods() %}
select orderid,
{%for paymentmethod in payment_methods %}
sum(case when paymentmethod = '{{paymentmethod}}' then amount end) as {{paymentmethod}}_amount,
{%endfor%}
sum(amount) as total_amount
from {{ ref('stg_payment') }}
group by 1
*/

--using macro --added a new column taking value from macro

{%set payment_methods = get_payment_methods() %}
select orderid,
{%for paymentmethod in payment_methods %}
sum(case when paymentmethod = '{{paymentmethod}}' then amount end) as {{paymentmethod}}_amount,
{%endfor%}
sum(amount) as total_amount,
{{cents_to_dollars('sum(amount)')}} as amount_usd
from {{ ref('stg_payment') }}
group by 1
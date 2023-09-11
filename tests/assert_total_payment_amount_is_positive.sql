select order_id, total_amount
from {{ref('trf_order_payment_method_amounts')}}
where total_amount < 0
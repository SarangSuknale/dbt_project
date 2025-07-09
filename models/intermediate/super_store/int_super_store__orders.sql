
select *,
       {{ revenu_calculations('quantity', 'amount')}} as revenue,
       {{ date_persing('order_date')}}  as months
from {{ ref('stg_super_store__orders') }} 
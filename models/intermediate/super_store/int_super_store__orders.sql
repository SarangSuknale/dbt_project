
select *,
       {{ revenu_calculations('quantity', 'amount')}},
       {{ date_persing('order_date')}}   
from {{ ref('stg_super_store__orders') }} 

select 
     cust_id as customer_id,
     name as customer_name,
     segment,
     region,
     country,
     state,
     city,
     postal_code
from {{ source("super_store",'customers')}}

select 
      prod_id as product_id,
      category,
      sub_category,
      name as product_name
from {{ source('super_store','products')}}
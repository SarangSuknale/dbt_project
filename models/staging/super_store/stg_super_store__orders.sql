
select *
from {{ source('super_store', 'orders') }}
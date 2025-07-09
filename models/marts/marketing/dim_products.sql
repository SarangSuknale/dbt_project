with products as (
    select * from {{ ref('stg_super_store__products') }}
),

 orders as (
    select * from {{ ref('stg_super_store__orders') }}
),

product_summary as (
    select 
          products.product_id,
          products.category,
          products.sub_category,
          products.product_name,
          min(orders.order_date) as oldest_order,
          max(orders.order_date) as latest_order,
          sum(orders.amount) as total_amount,
          sum(orders.quantity) as total_quantity,
          sum(orders.discount) as total_discount
    from products 
    inner join orders on products.product_id=orders.product_id
    group by products.product_id,
             products.category,
             products.sub_category,
             products.product_name
)

select * from product_summary
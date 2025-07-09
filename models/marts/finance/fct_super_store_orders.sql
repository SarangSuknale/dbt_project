
with base_customer as (
    select * from {{ ref("stg_super_store__customers") }}
),

base_products as (
    select * from {{ ref('stg_super_store__products')}}
),

base_orders as (
    select * from {{ ref('stg_super_store__orders')}}
),

orders as (
    select 
          base_orders.order_id,
          base_orders.order_date,
          base_orders.ship_date,
          base_customer.customer_id,
          base_customer.state,
          base_customer.city,
          base_products.category,
          base_products.product_name,
          base_orders.amount,
          base_orders.quantity,
          base_orders.discount,
          base_orders.profit,
          {{ revenu_calculations('base_orders.quantity', 'base_orders.amount')}} as revenue

    from base_customer 
    left join  base_orders on base_customer.customer_id=base_orders.customer_id
    left join base_products on base_products.product_id=base_orders.product_id
)

select * from orders
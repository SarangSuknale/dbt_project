with customers as (
    select * from {{ ref('stg_super_store__customers') }}
),

orders as (
    select * from {{ ref('stg_super_store__orders') }}
),

cust_order_summary as (
    select customers.customer_id,
           customers.customer_name,
           customers.country,
           customers.state,
           customers.city,
           min(orders.order_date) as oldest_order,
           max(orders.order_date) as latest_order,
           sum(orders.amount) as total_spend,
           sum(orders.quantity) as total_quantity,
           sum(orders.discount) as total_discount
    from customers
    inner join orders on customers.customer_id=orders.customer_id
    group by customers.customer_id,
             customers.customer_name,
             customers.country,
             customers.state,
             customers.city  
)

select * from cust_order_summary

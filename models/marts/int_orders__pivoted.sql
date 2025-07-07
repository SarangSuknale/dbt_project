{%- set payment_method=['credit_card','coupon','bank_transfer','gift_card'] -%}

with payments as (
    select  * from {{ ref("stg_stripe__payments") }}
),
pivoted as (
    select
           order_id,
           {% for payment in payment_method -%}
            sum(case when payment_method='{{ payment }}' then amount else 0 end) as {{payment}},
           {% endfor -%}
    from payments
    where status != 'fail'
    group by order_id
)
select * from pivoted
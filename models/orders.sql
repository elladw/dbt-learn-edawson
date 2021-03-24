select 
            b.order_id
          , a.customer_id
          , sum(b.payment_amount) as payment_amount

from        {{ ref('stg_orders')}} as a
left join   {{ ref('stg_payments')}} as b
on          a.order_id = b.order_id
where       payment_status = 'success'
group by    1,2

--ran check - all order ids in stg_orders are in stg_payments (put this in relationships in dbt test later?)

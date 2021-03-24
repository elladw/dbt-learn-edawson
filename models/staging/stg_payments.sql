 {{
  config(
    materialized='view'
  )
}}

select 
            id as payment_id                  --unique key
          , orderid as order_id               --multiple payments per order
          , paymentmethod as payment_method
          , status as payment_status          --can be 'fail or success'
          , amount/100 as payment_amount      --in pounds/dollars
          , created as created_date

from        raw.stripe.payment

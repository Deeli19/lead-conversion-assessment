with source as (

    select * from {{ref('opportunities')}}
)

    select
        id as opportunity_id,
        account_id as opportunity_accountid,
        created_at as opportunity_created_date,
        closed_at as opportunity_closed_date,
        is_closed,
        is_won,
        case when is_closed = true then 1 else 0 end as is_closed_counter,
        case when is_won = true then 1 else 0 end as is_won_counter
        
    from source
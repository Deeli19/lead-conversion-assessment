with source as (

    select * from {{ref('accounts')}}
)

    select
        id as account_id,
        primary_contact_id as contactid
    
    from source
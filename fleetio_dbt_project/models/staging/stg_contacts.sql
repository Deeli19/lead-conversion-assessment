with source as (

    select * from {{ref('contacts')}}
)

    select
        id as contact_id,
        first_name as firstname,
        last_name as lastname,
        job_title as jobtitle,
        email as contact_email,
        account_id as accountid,
        lead_id as leadid,
        created_at as contact_created_date,
        created_at:: date as contact_created_date_key
    
    from source
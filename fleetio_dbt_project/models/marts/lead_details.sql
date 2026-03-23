with lead_details as (
    select 
            *
    from {{ ref('stg_leads') }} sl
    inner join {{ ref('stg_contacts') }} sc  on sl.lead_id = sc.leadid
    inner join {{ ref('stg_accounts') }} sa on sc.accountid = sa.account_id
    inner join {{ ref('stg_opportunities') }} so on sc.accountid = so.opportunity_accountid
)

select
    lead_id,
    contact_id,
    first_name,
    last_name,
    job_title,
    email,
    contact_created_date,
    lead_conversion_date_key,
    lead_source,
    company,
    contactid,
    country,
    city,
    state,
    industry,
    fleet_size,
    is_closed,
    is_won,
    opportunity_created_date,
    opportunity_closed_date,
    lead_conversion_counter,
    is_closed_counter,
    is_won_counter

from lead_details

with source as (

    select * from {{ref('leads')}}
)

    select
        id as lead_id,
        first_name,
        last_name,
        job_title,
        email,
        company,
        created_at,
        converted_at,
        source as lead_source,
        country,
        city,
        state,
        industry,
        fleet_size,
        created_at:: date as lead_creation_date_key,
        converted_at:: date as lead_conversion_date_key,
        case
            when converted_at is not null
            then 1
            else 0 end as lead_conversion_counter
    
    from source
    --where converted_at is not null
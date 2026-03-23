{{ config(materialized='table') }}

with source as (
    {{dbt_utils.date_spine(
        datepart="day",
        start_date="'2020-01-01':: date",
        end_date="'2029-12-31':: date"
    
    )}}
),

dim_dates as (    
    select 
        date_day:: date as date_key,
        extract(month from date_key) as month_number,
        extract(week from date_key) as week_of_year,
        extract(day from date_key) as day_number,
        dayname(date_key) as day_name,
        monthname(date_key) as month_name
    from source
)
    
select * from dim_dates
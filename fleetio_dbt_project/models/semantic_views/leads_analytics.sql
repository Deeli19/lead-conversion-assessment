{{ config(materialized='semantic_view') }}

TABLES(
  leads AS {{ ref('lead_details') }} PRIMARY KEY (lead_id),
  date_spine AS {{ ref('date_spine')}} PRIMARY KEY (date_key)
)
RELATIONSHIPS (
  LeadsToDates AS leads(lead_conversion_date_key) REFERENCES date_spine(date_key)
)
FACTS (
  leads.lead_conversion_counter AS lead_conversion_counter,
  leads.is_closed_counter AS is_closed_counter,
  leads.is_won_counter AS is_won_counter
)
DIMENSIONS (
  date_spine.day_name AS day_name,
  date_spine.week_of_year AS week_of_year,
  date_spine.month_name AS month_name,
  date_spine.month_number AS month_number,
  date_spine.day_number AS day_number,
  leads.lead_source AS lead_source,
  leads.job_title AS job_title,
  leads.company AS company,
  leads.industry AS industry,
  leads.city AS city,
  leads.state AS state,
  leads.country AS country,
  leads.fleet_size AS fleet_size,
  leads.is_closed AS is_closed,
  leads.is_won AS is_won
)
METRICS (
  leads.total_leads AS sum(leads.lead_conversion_counter),
  leads.total_closed_opportunities AS sum(leads.is_closed_counter),
  leads.total_won_opportunities AS sum(leads.is_won_counter)
)
COMMENT = 'Semantic view for lead conversion analytics'

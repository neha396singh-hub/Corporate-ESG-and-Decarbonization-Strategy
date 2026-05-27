-- 1: Identify Duplicate Energy Consumption Logging
SELECT 
    reporting_date, 
    plant_id, 
    energy_source, 
    quantity_mwh, 
    COUNT(*) as log_count
FROM 
    esg_energy_consumption_fact
GROUP BY 
    reporting_date, 
    plant_id, 
    energy_source, 
    quantity_mwh
HAVING 
    COUNT(*) > 1;
    
-- 2: Verify Referential Integrity (Orphaned Facility Checks)
SELECT 
    l.shipment_id, 
    l.plant_id AS logistics_plant_id
FROM 
    esg_logistics_fact l
LEFT JOIN 
    esg_facilities_dim f ON l.plant_id = f.plant_id
WHERE 
    f.plant_id IS NULL;
    
    
-- Building Clean Materialized SQL Views    
-- 1. Create a Cleaned Energy View (Deduplicated and mapped to Scope 1 & 2 carbon metrics)
CREATE OR REPLACE VIEW vw_clean_energy_emissions AS
SELECT DISTINCT
    e.reporting_date,
    YEAR(e.reporting_date) AS reporting_year,
    e.plant_id,
    e.energy_source,
    e.quantity_mwh,
    f.emission_factor,
    f.scope,
    -- Core Calculation: Volume * Factor = Metric Tons of CO2e
    ROUND((e.quantity_mwh * f.emission_factor), 2) AS mt_co2e
FROM 
    (SELECT DISTINCT reporting_date, plant_id, energy_source, quantity_mwh 
     FROM esg_energy_consumption_fact) e 
JOIN 
    esg_emissions_factors_dim f 
    ON YEAR(e.reporting_date) = f.year 
    AND e.energy_source = f.activity_type
WHERE 
    e.reporting_date <= CURDATE(); -- This dynamic filter stops data at today's date

-- 2. Create a Cleaned Logistics View (Scope 3 Carbon Calculation Engine)
CREATE OR REPLACE VIEW vw_clean_logistics_emissions AS
SELECT 
    l.shipment_id,
    l.plant_id,
    l.shipment_date,
    YEAR(l.shipment_date) AS shipment_year,
    l.mode_of_transport,
    l.weight_tons,
    l.distance_km,
    f.emission_factor,
    f.scope,
    -- Core Calculation for Scope 3: Tons * KM * Factor = Metric Tons of CO2e
    ROUND((l.weight_tons * l.distance_km * f.emission_factor), 4) AS mt_co2e
FROM 
    esg_logistics_fact l
JOIN 
    esg_emissions_factors_dim f 
    ON YEAR(l.shipment_date) = f.year 
    AND l.mode_of_transport = f.activity_type
WHERE 
    l.shipment_date <= CURDATE(); 
    
    
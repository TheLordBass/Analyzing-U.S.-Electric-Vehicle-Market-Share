SELECT *
FROM ['Vehicle_Data']

WITH Totals as
(
SELECT DISTINCT State, ([Electric (EV)] + 
[Plug-In Hybrid Electric (PHEV)] +
[Hybrid Electric (HEV)] + Biodiesel + 
[Ethanol/Flex (E85)] + 
[Compressed Natural Gas (CNG)] + Propane + Hydrogen + Methanol + Gasoline + Diesel + [Unknown Fuel]) AS Total
FROM ['Vehicle_Data']
)
SELECT v.State, 
ROUND(([Electric (EV)]/ t.Total) * 100,2 ) as EV_rate, 
ROUND(([Hybrid Electric (HEV)]/ t.Total) * 100,2 ) as HEV_rate, 
ROUND(([Plug-In Hybrid Electric (PHEV)]/ t.Total) * 100,2 ) as PHEV_rate, 
ROUND((Gasoline/ t.Total) * 100,2 ) as Gasoline_rate,
t.Total
FROM ['Vehicle_Data'] v
Left Join Totals t on v.State = t.State
ORDER BY EV_rate DESC;

SELECT TOP 5 v.State, 
ROUND(([Electric (EV)]/ t.Total) * 100,2 ) as EV_rate
FROM ['Vehicle_Data'] v
Left Join Totals t on v.State = t.State
ORDER BY EV_rate DESC;

SELECT v.State,
    [Electric (EV)] AS EV_count,
    t.Total,
    ROUND(([Electric (EV)]/ t.Total) * 100,2 ) as EV_rate, 
    ROUND(100.0 * [Electric (EV)] / SUM([Electric (EV)]) OVER (), 2) AS Share_of_US_EVs
FROM ['Vehicle_Data'] v
Left Join Totals t on v.State = t.State
WHERE v.State IN ('California', 'Texas', 'Florida', 'New York')
ORDER BY EV_rate DESC;



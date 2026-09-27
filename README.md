# US Vehicle Fuel Type & EV Adoption Analysis

An analysis of vehicle registrations by fuel type across all 50 US states and the District of Columbia, exploring where electric vehicles (EVs) are being adopted, where they lag behind, and what that means for charging infrastructure planning.

**Tools:** SQL Server (data import, cleaning, market share queries) · Power BI (Power Query, DAX, dashboard)

![Dashboard](images/dashboard.png)

---

## Business Questions

1. What percentage of vehicles in each state are EVs, PHEVs, HEVs and gasoline?
2. Which 5 states have the highest EV adoption rate?
3. How does California compare with other large states (Texas, Florida, New York)?
4. Which alternative fuels have a meaningful presence, and which are niche?
5. Which states lead and lag, and what does this imply for infrastructure planning?

---

## Key Findings

### Gasoline still dominates
- **84.6%** of registered vehicles run on gasoline.
- The **national EV rate is 1.24%** (3.56M EVs).
- Adding plug-in hybrids, **plug-in vehicles make up 1.69%**. Including standard hybrids, the **electrified share is 4.27%**.

### EV adoption is highly concentrated
- **California holds 35.3% of all US EVs** (1.26M), while accounting for only about 13% of registered vehicles.
- California's EV rate (**3.41%**) is about **2.75x the national average**.
- Only **14 of 51** states (including DC) are above the national average.

| Top 5 EV Adoption | EV Rate | Bottom 5 EV Adoption | EV Rate |
|---|---|---|---|
| California | 3.41% | North Dakota | 0.13% |
| District of Columbia* | 2.60% | Mississippi | 0.13% |
| Hawaii | 2.37% | Wyoming | 0.17% |
| Washington | 2.23% | South Dakota | 0.19% |
| Nevada | 1.85% | West Virginia | 0.19% |

*DC is not a state. If it is excluded, New Jersey (1.84%) enters the top 5.

### California vs other large states
| State | EVs | EV Rate |
|---|---|---|
| California | 1,256,600 | 3.41% |
| Florida | 254,900 | 1.37% |
| New York | 131,300 | 1.16% |
| Texas | 230,100 | 0.89% |

California's EV rate is roughly **2.5x Florida's and nearly 4x Texas's**. Texas has almost as many EVs as Florida but the lowest rate of the four, because its total fleet (25.8M vehicles) is so large. This shows why **both count and rate matter**: fleet size can hide low adoption.

### Alternative fuels: meaningful vs niche
- **Meaningful:** Ethanol/Flex (E85) is the largest alternative fuel at **7.05%** (20.2M vehicles), followed by HEV (2.58%), diesel (2.50%), EV (1.24%) and biodiesel (0.98%).
- **Niche:** PHEV (0.46%) sits just below the 0.5% threshold, while CNG, hydrogen and propane are each under 0.01%. No methanol vehicles are registered.
- **All 16,900 hydrogen vehicles are in California**, the only state with a public hydrogen refuelling network. This is a clear example of adoption following infrastructure.

---

## What Might Explain the Gap?

The factors below are **hypotheses**. They are consistent with the patterns in the data but were not directly measured in this dataset.

**1. Population density and driving distances.**
State size alone doesn't explain adoption, since California is both the largest state by vehicles and the leader. The stronger pattern is **urban vs rural**: dense areas like DC and states with large metro areas lead, while sparsely populated states (North Dakota, Wyoming, South Dakota) trail. Longer distances, fewer public chargers and range concerns make EVs a harder sell in rural areas.

**2. Charging infrastructure.**
Adoption and charger availability probably reinforce each other: more chargers encourage more EVs, which justify more chargers. The hydrogen finding above is a small-scale example of this effect.

**3. Political lean.**
EV adoption closely follows state political lean. The top four (California, DC, Hawaii, Washington) are strongly Democratic-leaning, and all five of the bottom states are strongly Republican-leaning. National surveys have consistently found that Democrats are more likely than Republicans to say they would consider buying an EV. However, political lean overlaps with urbanisation, income, state EV incentives and charger density, so this analysis **cannot isolate politics as a cause**. There are exceptions: Florida leans Republican but is above the national average, and swing-state Nevada is in the top 5.

---

## Implications for Infrastructure Planning

- **Lagging (mostly rural) states** likely face a chicken-and-egg problem. Investment should focus on **highway corridor fast-charging** to reduce range anxiety on long trips, rather than dense urban networks.
- **Leading states** face the opposite challenge: **capacity and grid load**, including home and workplace charging, and upgrades to local power distribution.
- **High-volume, low-rate states (Texas, Florida)** offer the largest growth opportunity in absolute terms. Small rate increases there would add large numbers of EVs.
- **Hybrid popularity** (2.58% HEV, higher than EV) suggests interest in electrification is held back by range concerns, which better charging access could address.

---

## Limitations

- The dataset gives a single point-in-time snapshot, so trends over time can't be assessed.
- It contains no data on chargers, income, population density or politics, so the explanations above are hypotheses rather than tested findings.
- Fuel type categories come from the source data. "Unknown Fuel" (0.59%) is included in totals.

## Next Steps

- Add charging station counts by state (US DOE Alternative Fuels Data Center) to measure **chargers per EV**.
- Add population density, median income and election results to test the hypotheses above with correlation or regression analysis.
- Add registration data from earlier years to track adoption growth.

---

## Repository Contents

| File | Description |
|---|---|
| `Vehicle_Data.csv` | Source data: registered vehicles by state and fuel type |
| `queries.sql` | SQL Server queries for market share analysis |
| `EV_Dashboard.pbix` | Power BI dashboard |
| `images/dashboard.png` | Dashboard screenshot |

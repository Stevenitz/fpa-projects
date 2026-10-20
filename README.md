# Ancillary Sales Opportunity Analysis

**Question:** Which airport rental locations have the biggest opportunity to sell more add-on products, and why?

**Finding:** Leisure mix is the clearest driver of ancillary attachment. Locations with more leisure renters sell more add-ons (r = 0.68 to 0.71 with Product 4 and Product 5 attachment). Locations that skew commercial sell fewer.

**Location example:** Location 260 shows this most clearly. It is about 85% commercial and 15% leisure, and it was bottom 10 on 3 of 5 products (P1, P2, P5). Closing part of its Product 4 gap is worth about $10K to $21K.

## How I found it
- Removed the smallest locations by rental volume (bottom 5%), because tiny sites give unstable percentages
- Ran a correlation check in R across all location metrics to see which factors moved with attachment rate
- Ranked every location by attachment rate on each of the 5 products
- Counted who kept showing up at the bottom across products, which pointed to 260
- Compared 3 weak locations (260, 137, 224) against 3 strong ones (7, 157, 233), picked across small, mid, and large sizes

## Supporting factors
- **Counter bypass:** 260 has about 81% bypass vs 25 to 35% typical. Fewer counter conversations means fewer chances to offer add-ons.
- **Vehicle mix:** stronger locations lean slightly more SUV and van (a soft pattern, not a confirmed driver)

## Size of the opportunity (Product 4, Location 260)
| Scenario | Revenue |
|---|---|
| Today | about $1,037 |
| +5 point attachment rate | about $11K |
| +10 point attachment rate | about $21.5K |

## Limits
- Correlation, not proven cause
- 260 is a smaller site (3,342 rentals), so dollar figures are scenarios, not forecasts
- Benchmark set is 3 vs 3, a directional check

## Files
- `ancillary_sales_deck.pptx`: summary slides
- `ancillary_sales_model.xlsx`: Assumptions, Opportunity Ranking, Benchmark Comparison, Revenue Scenario
- `correlation_check.R`: correlation check, bottom/top 10 lists per product

Data not included (provided as part of a case study).


# Workforce Cost Variance Analysis

**Question:** Where are the labor cost variances coming from, and is labor being spent efficiently relative to business volume?

**Finding:** The company is $865K under the 2026 Plan, but costs have crept up $292K since the last forecast. Location totals hide the real issues: a single position (Position K at Location 3) is running +$417K and +125 FTE over plan. This one job makes up 26% of all company overspend, masking the fact that another position at the same location (Position B) saved $262K. Overtime is falling everywhere, but labor cost per rental is expected to rise slightly at 3 of 4 locations compared to 2025.

**Location example:** Location 3 looks flat at the location level (-0.3% vs Plan). But this is only because its massive overrun on Position K (+$417K) cancels out savings on Position B (-$262K). Looking at location totals alone hides the biggest overspend in the company.

## How I found it
- Calculated Budget Variance (Current vs Plan) and Re-forecast Drift (Current vs Prior) for all 104 positions
- Ranked positions to isolate the Top Movers (largest overruns and savings)
- Built an efficiency ratio (Labor $ ÷ Rental Transactions) to tie spend to volume
- Used full-year figures only (2025 Actual vs 2026 Plan) to avoid partial-year bias

## Supporting factors
- **Overtime management:** OT as a % of salary is falling at every location, showing less reliance on premium pay
- **Volume vs spend:** ranking all jobs isolates specific variances that cancel out at the location level

## Size of the opportunity (Position K, Location 3)
| Metric | Value |
|---|---|
| FTE Variance vs Plan | +125 FTE |
| Labor Cost Variance vs Plan | +$416,782 |
| Share of Total Company Overspend | 26% |

## Limits
- No 2026 actuals yet, so the model uses full-year forecast vs plan
- Efficiency compares 2025 actuals to 2026 plans, not live 2026 data

## Files
- `Workforce_Cost_Executive_Summary.pptx`: 4-slide executive summary
- `Workforce_Variance_Model.xlsx`: Notes, Location Summary, Efficiency Metrics, Top Movers, Variance Analysis, Raw Data

Data not included (provided as part of a case study).

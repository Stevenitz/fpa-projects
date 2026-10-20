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

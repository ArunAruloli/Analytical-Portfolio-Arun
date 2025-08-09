# Analytics Portfolio — Arun Aruloli

Chicago-based analyst (SQL • Power BI) with underwriting + marketing analytics experience.

## What’s inside
- **Power BI**: Underwriting Ops Dashboard (PDF + screenshots)
- **SQL**: window functions, funnels, cohorts
- **Data**: sample CSV to reproduce

## Highlights
- Submissions → Quotes → Binds funnel
- KPIs: Hit Rate, Quote Rate, Loss Ratio, Avg Days to Quote
- Broker performance + monthly trends

## Reproduce
1) Power BI Desktop (free) → Get Data → `data/underwriting_sample.csv`
2) Add measures (DAX):
   - Hit Rate = DIVIDE([Binds],[Quotes])
   - Quote Rate = DIVIDE([Quotes],[Submissions])
   - Loss Ratio = DIVIDE([Incurred Losses],[Earned Premium])
   - Avg Days to Quote = AVERAGE([DaysToQuote])
3) Export PDF (File → Export → PDF)

## Links
- SQL snippets (Gist): <add gist URL here>
- LinkedIn: <your link> • Email: <your email>
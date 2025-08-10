SELECT
  date(substr(Month||'-01',1,10)) AS month,
  SUM(Submissions) AS submissions,
  SUM(Quotes)      AS quotes,
  SUM(Binds)       AS binds,
  ROUND(100.0 * SUM(Quotes)/NULLIF(SUM(Submissions),0), 2) AS quote_rate_pct,
  ROUND(100.0 * SUM(Binds)/NULLIF(SUM(Quotes),0), 2)       AS hit_rate_pct
FROM Underwriting
GROUP BY month
ORDER BY month;
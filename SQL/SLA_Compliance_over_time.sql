SELECT
  date(substr(Month||'-01',1,10)) AS month,
  ROUND(100.0 * AVG(CASE WHEN DaysToQuote <= 4 THEN 1 ELSE 0 END), 2) AS sla_pass_pct
FROM Underwriting
GROUP BY month
ORDER BY month;

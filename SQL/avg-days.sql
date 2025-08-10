SELECT
  Broker,
  ROUND(AVG(DaysToQuote), 2) AS avg_days_to_quote,
  ROUND(100.0 * AVG(CASE WHEN DaysToQuote <= 4 THEN 1 ELSE 0 END), 2) AS sla_pass_pct
FROM Underwriting
GROUP BY Broker
ORDER BY avg_days_to_quote ASC;
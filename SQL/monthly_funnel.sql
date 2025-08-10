PRAGMA table_info(Underwriting); 
SELECT * FROM Underwriting LIMIT 5;
SELECT
  Broker,
  SUM(Binds)  AS binds,
  SUM(Quotes) AS quotes,
  ROUND(100.0 * SUM(Binds) / NULLIF(SUM(Quotes),0), 2) AS hit_rate_pct
FROM Underwriting
GROUP BY Broker
ORDER BY hit_rate_pct DESC, binds DESC;
WITH t AS (
  SELECT
    date(substr(Month || '-01', 1, 10)) AS month_date,  -- SQLite
    DaysToQuote
  FROM Underwriting
  WHERE DaysToQuote IS NOT NULL
)
SELECT
  month_date                                       AS month,
  COUNT(*)                                         AS total_quotes,
  SUM(CASE WHEN DaysToQuote <= 4 THEN 1 ELSE 0 END) AS sla_pass_count,
  ROUND(
    100.0 * SUM(CASE WHEN DaysToQuote <= 4 THEN 1 ELSE 0 END)
    / NULLIF(COUNT(*), 0),
    2
  )                                                AS sla_pass_pct
FROM t
GROUP BY month_date
ORDER BY month_date;

WITH t AS (
  SELECT
    u.Broker,
    u.Line,
    /* Normalize Month to a real date so we can MAX it reliably */
    date(substr(u.Month || '-01', 1, 10)) AS month_date,
    u.Submissions,
    u.Quotes,
    u.Binds,
    u.EarnedPremium,
    u.IncurredLosses
  FROM Underwriting u
),
latest AS (
  SELECT MAX(month_date) AS m FROM t
)
SELECT
  Broker,
  Line,
  SUM(Submissions)                          AS submissions,
  SUM(Quotes)                               AS quotes,
  SUM(Binds)                                AS binds,
  ROUND(100.0 * SUM(Binds) / NULLIF(SUM(Quotes), 0), 2)         AS hit_rate_pct,
  SUM(EarnedPremium)                        AS premium,
  ROUND(100.0 * SUM(IncurredLosses) / NULLIF(SUM(EarnedPremium), 0), 2) AS loss_ratio_pct
FROM t
CROSS JOIN latest
WHERE t.month_date = latest.m
GROUP BY Broker, Line
ORDER BY binds DESC, hit_rate_pct DESC;

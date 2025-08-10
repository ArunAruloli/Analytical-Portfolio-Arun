WITH latest AS (
  SELECT MAX(date(substr(Month||'-01',1,10))) AS m FROM Underwriting
)
SELECT
  u.Broker, u.Line,
  SUM(u.Submissions) AS submissions,
  SUM(u.Quotes)      AS quotes,
  SUM(u.Binds)       AS binds,
  ROUND(100.0*SUM(u.Binds)/NULLIF(SUM(u.Quotes),0), 2) AS hit_rate_pct,
  SUM(u.EarnedPremium) AS premium,
  ROUND(100.0*SUM(u.IncurredLosses)/NULLIF(SUM(u.EarnedPremium),0), 2) AS loss_ratio_pct
FROM Underwriting u
JOIN latest l ON date(substr(u.Month||'-01',1,10)) = l.m
GROUP BY u.Broker, u.Line
ORDER BY binds DESC, hit_rate_pct DESC;

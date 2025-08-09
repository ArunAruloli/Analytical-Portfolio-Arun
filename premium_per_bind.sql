SELECT
	Broker,
	sum(EarnedPremium) as premium,
	sum(Binds)		   as binds,
	round(sum(EarnedPremium)/NULLIF(SUM(Binds),0), 2) AS premium_per_bind
FROM Underwriting
GROUP BY Broker
ORDER BY premium_per_bind DESC;

SELECT d.forename || ' ' || d.surname AS driver_name, 
		b.fastest_lap,
		b.race_name
FROM drivers d
JOIN (
	SELECT r.name AS race_name,
		MIN(l.milliseconds) AS fastest_lap,
		l.driverId
	FROM races r
	JOIN lap_times l
	ON r.raceId = l.raceId
	GROUP BY r.name, l.driverId
) b ON b.driverId = d.driverId

GROUP BY d.forename, d.surname, b.fastest_lap, b.race_name, b.driverId;
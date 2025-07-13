SELECT d.forename || ' ' || d.surname AS driver_name, b.race_name, b.lap, b.raceId as race, MIN(b.milliseconds) AS fastest_lap_time
FROM drivers d
JOIN (
	SELECT c.raceId, c.lap, r.name AS race_name, c.driverId, c.milliseconds
	FROM lap_times c 
	JOIN 
		races r ON c.raceId = r.raceId) 
	b ON d.driverId = b.driverId

GROUP BY d.driverId, d.forename, d.surname, b.race_name, b.lap, b.raceId
ORDER BY fastest_lap_time ASC;
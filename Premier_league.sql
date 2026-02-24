select *
from matches;

describe matches;

-- create a duplicate table for analysis  
Create table pl_matches as 
select 

	STR_TO_DATE(date, '%m/%d/%Y') AS match_date,
    season,
    round,
	matches.time,
    day,
    venue,
    trim(team) AS team,
	CASE 
        WHEN opponent = 'Manchester Utd' THEN 'Manchester United'
        WHEN opponent = 'Wolves' THEN 'Wolverhampton Wanderers'
        WHEN opponent = 'Tottenham' THEN 'Tottenham Hotspur'
        WHEN opponent = 'Brighton' THEN 'Brighton And Hove Albion'
        WHEN opponent = 'Sheffield Utd' THEN 'Sheffield United'
        WHEN opponent = 'West Ham' THEN 'West Ham United'
        WHEN opponent = "Nott'ham Forest" THEN 'Nottingham Forest'
        WHEN opponent = 'Newcastle Utd' THEN 'Newcastle United'
        WHEN opponent = 'West Brom' THEN 'West Bromwich Albion'
        ELSE TRIM(opponent) 
    END as opponent,
    result,
    CASE 
        WHEN result = 'W' THEN 3
        WHEN result = 'D' THEN 1
        WHEN result = 'L' THEN 0
        ELSE 0 
    END AS points,
    gf AS goals_for,
    ga AS goals_against,
    (gf - ga) AS goal_difference,
    xg AS expected_goals,
    xga AS expected_goals_against,
    poss AS possession_pct,
    captain,
    formation,
    `opp formation` AS opp_formation,
    sh AS shot,
    sot AS shot_on_target,
    dist AS distance_covered,
    fk AS freekick,
    pk AS penality_won,
    pkatt AS penality_scored,
    referee,
    attendance
FROM matches 
WHERE team IS NOT NULL;
 
 select * 
 from pl_matches;
 
 -- Analytical Queries
 
 -- total points  
SELECT team, season,
       SUM(points) AS total_points
FROM pl_matches
GROUP BY team, season
ORDER BY season, total_points DESC;

-- total gf in a season
select team, season, sum(goals_for) as total_goals 
from pl_matches
group by team, season
order by season, total_goals desc;

-- away and home performance 

select season, team, venue, 
	count(*) as matches,
    sum(points) as points
from pl_matches 
group by season, team, venue; 

-- xp VS gf for underperforming or overperforming 

select season, team,
	sum(goals_for),
    round(sum(expected_goals), 2) 
from pl_matches
group by season, team;

-- shooting efficiency
SELECT season, team,
       SUM(shot) AS total_shots,
       SUM(shot_on_target) AS shots_on_target,
       ROUND(SUM(goals_for)/SUM(shot),3) AS goal_conversion_rate
FROM pl_matches
GROUP BY season, team; 

-- table summary 
 
CREATE VIEW team_season_summary AS
SELECT
    season,
    team,
    COUNT(*) AS MP,
    SUM(points) AS PTS,
    SUM(CASE WHEN result = 'W' THEN 1 ELSE 0 END) AS W,
    SUM(CASE WHEN result = 'D' THEN 1 ELSE 0 END) AS D,
    SUM(CASE WHEN result = 'L' THEN 1 ELSE 0 END) AS L,
    SUM(goals_for) AS GF,
    SUM(goals_against) AS  GA,
    sum(goal_difference) as GD,
    ROUND(SUM(expected_goals),2) AS TXG,
    ROUND(SUM(expected_goals_against),2) AS TXGA
FROM pl_matches
GROUP BY team, season;

select *
from team_season_summary;

SELECT *,
       RANK() OVER (PARTITION BY season 
                    ORDER BY PTS DESC, GD DESC, GF DESC) AS position
FROM team_season_summary
ORDER BY season DESC, position ASC;

select season, team, round, result
from pl_matches







 


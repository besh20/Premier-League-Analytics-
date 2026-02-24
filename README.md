# Premier-League-Analytics-
## A Full Data Project; From Raw datasets to SQL to Interactive Insights

I'm a big Fan or PL and I’ve always followed the Premier League, but I wanted to look deeper than just watching the match and the league table. I wanted to see things like:

Which teams are actually clinical vs. just lucky?
How does a team's rank fluctuate week-over-week?
Does home-field advantage actually matter for teams? and other analysis 

This project was my way of practicing the "messy" part of data—cleaning raw SQL records—and turning them into a polished dashboard that someone could actually use to compare team performance.

## The Tech Stack
Database: SQL (for the heavy lifting and data cleaning)

Data Prep: Excel & Power Query (for initial data sniffing)

Visualization: Power BI (DAX, Interactive Reporting, UI Design

## THE ANALYSIS PROCESS

### 1. The SQL Cleanup
The raw data was a bit of a headache. Team names were inconsistent (e.g., "Wolves" vs. "Wolverhampton Wanderers"), and dates were just strings. I wrote a transformation script to

Normalize Team Names: Used CASE statements to ensure every team had one consistent name.

Feature Engineering: Calculated the points system ($W=3, D=1, L=0$) from scratch so the BI tool didn't have to.

Advanced Aggregation: Used Window Functions (RANK() OVER) to build a dynamic league table that updates based on Season and Goal Difference.

### 2. The Power BI Build
I didn't want a "data dump." I focused on Visual Hierarchy. So The Visuals were classified into 3 pages; League overview where we can see how the league went for in general from teams to fans and referees. The team performance where we can see teams performance individually in a deeper sense. The last page being a season journey for teams where we can do comparision between teams according to their Total points and Rank.  

### Key Insights

Efficiency Matters: By comparing Expected Goals (xG) against Actual Goals, We could see which teams were overperforming their "luck" and which were struggling to finish their chances.

Home vs. Away: The dashboard highlights a significant drop-off in defensive stability for certain mid-table teams when playing away from home, which isn't always obvious from the final points total.

Teams Journey: by comparing multiple teams, We could see at what matchweek they got passed by another teams and also beaten for the title 

### How to Use This

Check out the SQL file to see how I transformed the raw data.

Download the .pbix file to play with the filters yourself.

Check the /Screenshots folder for a quick preview of the final UI


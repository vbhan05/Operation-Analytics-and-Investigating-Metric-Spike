SELECT 
    *
FROM
    job_data
ORDER BY job_id;

-- 1. Calculate the number of jobs reviewed per hour per day for November 2020?

SELECT 
    ds AS Date,
    ROUND((COUNT(job_id) / SUM(time_spent)) * 3600) AS 'Jobs Reviewed
    per Hour per Day'
FROM
    job_data
WHERE
    ds BETWEEN '2020-11-01' AND '2020-11-30'
GROUP BY ds;
    
    

-- 2. Let’s say the above metric is called throughput. Calculate 7 day rolling average of throughput? 
-- For throughput, do you prefer daily metric or 7-day rolling and why?

SELECT a.ds AS day,
a.throughput,
round(avg(a.throughput) OVER ( ORDER BY ds rows BETWEEN 6 PRECEDING AND CURRENT row), 2) AS
7_day_avg_throughput
FROM
( SELECT ds, count(job_id) / sum(time_spent) AS throughput 
FROM job_data 
GROUP BY ds ) a
GROUP BY ds;


-- 3.  Calculate the percentage share of each language in the last 30 days?

SELECT 
	language,
	count(job_id) as no_of_jobs,
	count(job_id)*100 / sum(count(*)) OVER() as percentage_share
FROM 
	job_data
WHERE 
	ds between '2020-11-01' and '2020-11-30'
GROUP by 
	language;
        
        
-- 4. Let’s say you see some duplicate rows in the data. How will you display duplicates from the table?

SELECT actor_id, COUNT(*) AS Duplicates
FROM job_data
GROUP BY actor_id
HAVING COUNT(*) > 1;

    






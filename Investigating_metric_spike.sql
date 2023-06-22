-- 1.Calculate the weekly user engagement?

SELECT 
    WEEK(occurred_at) AS Week,
    COUNT(DISTINCT user_id) AS Weekly_User_engagement
FROM
    events
GROUP BY WEEK(occurred_at)
ORDER BY WEEK(occurred_at);


-- 2. Calculate the user growth for product?

SET @g := 0;
SELECT 
    o.no_of_users,
    o.date,
    (@g:=@g + o.no_of_users) AS user_growth
FROM
    (SELECT 
        COUNT(user_id) AS no_of_users, DATE(created_at) AS date
    FROM
        users
    WHERE
        state = 'active'
    GROUP BY DATE(created_at)) o;
    

-- 3. Calculate the weekly retention of users-sign up cohort?

SELECT first AS "Week Numbers",

SUM(CASE WHEN week_number = 0 THEN 1 ELSE 0 END) AS "Week 0",
SUM(CASE WHEN week_number = 1 THEN 1 ELSE 0 END) AS "Week 1",
SUM(CASE WHEN week_number = 2 THEN 1 ELSE 0 END) AS "Week 2",
SUM(CASE WHEN week_number = 3 THEN 1 ELSE 0 END) AS "Week 3",
SUM(CASE WHEN week_number = 4 THEN 1 ELSE 0 END) AS "Week 4",
SUM(CASE WHEN week_number = 5 THEN 1 ELSE 0 END) AS "Week 5",
SUM(CASE WHEN week_number = 6 THEN 1 ELSE 0 END) AS "Week 6",
SUM(CASE WHEN week_number = 7 THEN 1 ELSE 0 END) AS "Week 7",
SUM(CASE WHEN week_number = 8 THEN 1 ELSE 0 END) AS "Week 8",
SUM(CASE WHEN week_number = 9 THEN 1 ELSE 0 END) AS "Week 9",
SUM(CASE WHEN week_number = 10 THEN 1 ELSE 0 END) AS "Week 10",
SUM(CASE WHEN week_number = 11 THEN 1 ELSE 0 END) AS "Week 11",
SUM(CASE WHEN week_number = 12 THEN 1 ELSE 0 END) AS "Week 12",
SUM(CASE WHEN week_number = 13 THEN 1 ELSE 0 END) AS "Week 13",
SUM(CASE WHEN week_number = 14 THEN 1 ELSE 0 END) AS "Week 14",
SUM(CASE WHEN week_number = 15 THEN 1 ELSE 0 END) AS "Week 15",
SuM(CASE WHEN week_number = 16 THEN 1 ELSE 0 END) AS "Week 16",
SUM(CASE WHEN week_number = 17 THEN 1 ELSE 0 END) AS "Week 17",
SUM(CASE WHEN week_number = 18 THEN 1 ELSE 0 END) AS "Week 18"
FROM
(
SELECT m.user_id, m.login_week, n.first, m.login_week - first AS week_number
FROM
(SELECT user_id, EXTRACT(WEEK FROM occurred_at) AS login_week FROM events
GROUP BY 1,2) m,
(SELECT user_id, MIN(EXTRACT(WEEK FROM occurred_at)) AS first FROM events
GROUP BY 1) n
WHERE m.user_id = n.user_id
) sub
GROUP BY first
ORDER BY first;



-- 4.  Calculate the weekly engagement per device?

SELECT 
    WEEK(occurred_at) AS week,
    device,
    COUNT(DISTINCT user_id) AS user_engagement
FROM
    events
GROUP BY 2,1
ORDER BY 1;


-- 5. Calculate the email engagement metrics?

SELECT 
    WEEK(occurred_at) AS week,
    COUNT(DISTINCT (CASE
            WHEN action = 'sent_weekly_digest' THEN user_id
        END)) AS weekly_digest,
    COUNT(DISTINCT (CASE
            WHEN action = 'sent_reengagement_email' THEN user_id
        END)) AS reengagement_mail,
    COUNT(DISTINCT (CASE
            WHEN action = 'email_open' THEN user_id
        END)) AS opened_email,
    COUNT(DISTINCT (CASE
            WHEN action = 'email_clickthrough' THEN user_id
        END)) AS email_clickthrough
FROM
    email_events
GROUP BY WEEK(occurred_at)
ORDER BY WEEK(occurred_at);




 

 







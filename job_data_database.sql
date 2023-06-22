-- First creating database with the information provided

create database operation_analytics;

use operation_analytics;

-- Case Study 1 (Job Data)

CREATE TABLE job_data (
    job_id INT,
    actor_id INT,
    event VARCHAR(255),
    language VARCHAR(255),
    time_spent INT,
    org VARCHAR(255),
    ds DATE
);

select * from job_data;

INSERT into job_data (ds, job_id, actor_id, event, language, time_spent, org)
VALUES ('2020-11-30', 21, 1001, 'skip', 'English', 15, 'A'),
       ('2020-11-30', 22, 1006, 'transfer', 'Arabic', 25, 'B'),
       ('2020-11-29', 23, 1003, 'decision', 'Persian', 20, 'C'),
       ('2020-11-28', 23, 1005,'transfer', 'Persian', 22, 'D'),
       ('2020-11-28', 25, 1002, 'decision', 'Hindi', 11, 'B'),
       ('2020-11-27', 11, 1007, 'decision', 'French', 104, 'D'),
       ('2020-11-26', 23, 1004, 'skip', 'Persian', 56, 'A'),
       ('2020-11-25', 20, 1004, 'transfer', 'Italian', 45, 'C');
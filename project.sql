create database users;
use users;

create table users (
user_id int,
email_domain varchar(200),
country varchar(200),
postal int,
mobile_app varchar(50),
sign_up_at date
);
select*from users;
insert into users (user_id, email_domain, country, postal, mobile_app, sign_up_at) 
values (1, 'navya@.com', 'India', 505452, 'mobile_user', '2020-08-15'),
(2, 'kavya@.com', 'china', 590876, 'mobile_user', '2022-08-15'),
(3, 'shrvya@.com', 'pakisthan', 786452, 'null', '2019-08-15'),
(4, 'divya@.com', 'france', 505872, 'mobile_user', '2018-08-15'),
(5, 'bhvya@.com', 'uk', 987652, 'null', '2017-08-15'),
(6, 'ramya@.com', 'us', 505452, 'mobile_user', '2016-08-15'),
(7, 'vavya@.com', 'nigeria', 505452, 'null', '2015-08-15'),
(8, 'avya@.com', 'newzealand', 505452, 'mobile_user', '2020-08-15'),
(9, 'lavya@.com', 'italy', 865439, 'mobile_user', '2021-08-15'),
(10, 'havya@.com', 'colambia', 802789, 'null', '2022-08-15');

create table progress (
user_id int not null,
learn_cpp int,
learn_sql int,
learn_html int,
learn_javascript int,
learn_java int,
primary key (user_id)
);
select*from progress;
insert into progress (user_id, learn_cpp, learn_sql, learn_html, learn_javascript, learn_java)
values (1, 1, 1, 1, 1, 1),
(2, 1, 1, 0, 1, 1),
(3, 0, 1, 1, 1, 1),
(4, 1, 0, 1, 1, 1),
(5, 1, 1, 1, 0, 1);

 SELECT email_domain, COUNT(*) AS learner_count
FROM users
WHERE email_domain LIKE '%.edu'
GROUP BY email_domain
ORDER BY learner_count DESC
LIMIT 25;
SELECT COUNT(*) AS ny_edu_learners
FROM users
WHERE email_domain LIKE '%.edu' AND country = 'New York';
SELECT COUNT(*) AS mobile_app_users
FROM users
WHERE mobile_app = 'mobile-user';

SELECT DATE_FORMAT(sign_up_at, '%Y-%m-%d %H:00:00') AS signup_hour,
       COUNT(*) AS signup_count
FROM users
GROUP BY signup_hour
ORDER BY signup_hour;
-- Different schools (.edu domains) and their preferred courses
SELECT u.email_domain, p.learn_cpp, p.learn_sql, p.learn_html, p.learn_javascript, p.learn_java
FROM users u
JOIN progress p ON u.user_id = p.user_id
WHERE u.email_domain LIKE '%.edu'
GROUP BY u.email_domain, p.learn_cpp, p.learn_sql, p.learn_html, p.learn_javascript, p.learn_java;

-- Courses taken by New York students
SELECT u.email_domain, p.learn_cpp, p.learn_sql, p.learn_html, p.learn_javascript, p.learn_java
FROM users u
JOIN progress p ON u.user_id = p.user_id
WHERE u.country = 'New York';

-- Courses taken by Chicago students
SELECT u.email_domain, p.learn_cpp, p.learn_sql, p.learn_html, p.learn_javascript, p.learn_java
FROM users u
JOIN progress p ON u.user_id = p.user_id
WHERE u.country = 'Chicago';







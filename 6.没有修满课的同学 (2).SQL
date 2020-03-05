-- 没有修满课的 同学
SELECT s_name,s_id from student
where s_id in
(
SELECT b_s_id from
(
SELECT *,COUNT(DISTINCT c_id) as cnt from 
(
(SELECT s_id as b_s_id,s_name from student) as a
LEFT JOIN score as b
on s_id=b_s_id
)
GROUP BY s_id having cnt<(SELECT COUNT(DISTINCT c_id) from course)
)as j  
)
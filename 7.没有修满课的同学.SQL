-- 查询所有成绩小于60分的同学的学号,最高分小于60分，肯定都不及格
SELECT * from score
GROUP BY s_id having max(s_score)<60

-- 1.计算所选课程数2.计算不及格课程数 两者相同就导出
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
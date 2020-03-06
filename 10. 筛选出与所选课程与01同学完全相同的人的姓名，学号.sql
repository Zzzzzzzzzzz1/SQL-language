-- 10. 筛选出与所选课程与01同学完全相同的人的姓名，学号
SELECT s_id,s_name from student 
where s_id in 
(
SELECT DISTINCT s_id from score
where s_id!='01'
GROUP BY s_id having COUNT(DISTINCT c_id)=(SELECT COUNT(DISTINCT c_id) from score where s_id='01')
)
and s_id not in
(
SELECT s_id from score
where c_id not in
(SELECT c_id from score where s_id='01'
 )
)
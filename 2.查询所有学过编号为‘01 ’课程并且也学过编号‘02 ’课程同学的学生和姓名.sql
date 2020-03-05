-- 查询所有学过编号为‘01 ’课程并且也学过编号‘02 ’课程同学的学生和姓名
SELECT s_id,s_name from student
where s_id in 
(
SELECT a.s_id FROM
(
(SELECT * from score   where c_id='01') as a
INNER JOIN  
(SELECT * from score as b  where c_id='02') as b 
on a.s_id=b.s_id
)
)
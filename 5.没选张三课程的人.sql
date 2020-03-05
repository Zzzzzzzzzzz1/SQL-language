-- 查询没学过张三老师课的学生的学号，姓名
SELECT s_id,s_name from student
WHERE s_id not in(
SELECT s_id FROM score
WHERE c_id=(
SELECT c_id from course where t_id =(SELECT t_id from teacher where t_name='张三')
)
)

-- 查询没学过张三老师课的学生的学号，姓名
select s_name,s_id from student
where s_id not in 
(
SELECT s_id from score as s
INNER JOIN course as c on s.c_id=c.c_id
INNER JOIN teacher as t on c.t_id=t.t_id
where t.t_name='张三'
)
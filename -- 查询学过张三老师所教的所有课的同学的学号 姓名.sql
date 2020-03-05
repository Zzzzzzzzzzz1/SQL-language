-- 查询学过张三老师所教的所有课的同学的学号 姓名
SELECT s_id,s_name from student
where s_id in
(
SELECT s_id from score as a
INNER JOIN course as b on a.c_id=b.c_id
INNER JOIN teacher as t on b.t_id=t.t_id
where t_name='张三'
)
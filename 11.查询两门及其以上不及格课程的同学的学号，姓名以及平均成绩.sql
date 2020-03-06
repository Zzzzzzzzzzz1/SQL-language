-- 11.查询两门及其以上不及格课程的同学的学号，姓名以及平均成绩
SELECT s_name,a.s_id,AVG(DISTINCT s_score) from score as a
inner join student as b on a.s_id=b.s_id
where a.s_id in 
(
SELECT s_id from 
(
SELECT * ,COUNT(c_id) as cnt from score where s_score<60
GROUP BY s_id having cnt>2 or cnt=2
) as j
)
GROUP BY s_name
ORDER BY s_id
-- 18.查询所有课程的成绩第2名到第3名的学生信息及该课程成绩（重要 25类似）
SELECT c.c_name,s_score,b.* FROM
(
(SELECT c_id,s_id,s_score,row_number() over(PARTITION by c_id ORDER BY s_score) m from score ) as a 
INNER JOIN student as b
on a.s_id=b.s_id
inner join course as c
on a.c_id=c.c_id
)
where m=2 or m=3
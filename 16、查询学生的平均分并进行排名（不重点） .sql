-- 16、查询学生的平均分并进行排名（不重点） 
SELECT a.s_id,s_name,分数,排名 FROM
(
(SELECT s_id ,avg(s_score) '分数',rank() over(ORDER BY avg(s_score) desc) '排名'from score
GROUP BY s_id
)as a
inner JOIN 
(SELECT s_id,s_name from student) as s
on a.s_id=s.s_id
)
ORDER BY 排名 

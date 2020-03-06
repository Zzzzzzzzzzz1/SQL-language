-- 17.查询不同老师所教不同课程平均分从高到低显示(不重点)
-- t_id t_name c_id avg rank__
SELECT t_name,a.c_id,avg,排名 FROM
(
(SELECT c_id,avg(s_score)'avg' ,rank() over(ORDER BY AVG(s_score) desc ) "排名" from score
GROUP BY c_id
) as a
INNER JOIN course as b
on a.c_id=b.c_id
inner join teacher as c
on b.t_id=c.t_id
)
GROUP BY b.c_id
ORDER BY avg DESC
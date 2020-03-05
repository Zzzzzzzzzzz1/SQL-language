SELECT a.s_name,a.s_id,COUNT(c_id) as '选课数' ,
sum(CASE WHEN b.s_score is null then 0 else b.s_score END) as 总成绩 from 
(SELECT s_name,s_id from student) as a
left JOIN
(SELECT s_score,s_id,c_id from score) as b
on a.s_id=b.s_id
GROUP BY s_name,s_id
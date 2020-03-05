-- 选出至少有一门课与01同学相同课程的同学
SELECT s_id,s_name from student
where s_id in
( 
SELECT s_id FROM
(
(SELECT c_id from score where s_id='01') as a
inner join (SELECT s_id,c_id from score) as b on a.c_id=b.c_id

)
GROUP BY s_id
) and s_id!='01'
-- 14.查询各科成绩最高分、最低分和平均分：以如下形式显示：课程ID，课程name，最高分，
-- 最低分，平均分，及格率，中等率，优良率，优秀率
-- 及格为>=60，中等为：70-80，优良为：80-90，优秀为：>=90 (超级重点)
SELECT c_id"课程id" ,c_name"课程名字",max(s_score)"最高分",min(s_score)"最低分",AVG(DISTINCT s_score) "平均分" 
,avg(case when s_score >=60 then 1.0 else 0 END)"及格率"
,avg(case when s_score >=70 and s_score<80 then 1.0 else 0 END)"中等率"
,avg(case when s_score >=80 and s_score<90 then 1.0 else 0 END)"优良率"
,avg(case when s_score >=90 then 1.0 else 0 END)"优秀率"
FROM
(
SELECT * from score as a
inner join (SELECT c_name,c_id b_c_id from course) as b
on a.c_id=b_c_id
) as j
GROUP BY c_id
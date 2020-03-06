-- 13.按平均成绩从高到低显示学生的所有课程成绩以及平均成绩（重点）
SELECT s_id,AVG(DISTINCT s_score) "平均成绩"
,max(case when c_id='01' then s_score else NULL END) "语文"
,max(case when c_id='02' then s_score else NULL END) "数学" 
,max(case when c_id='03' then s_score else NULL END) "英语"
from score
                   
GROUP BY s_id
ORDER BY AVG(DISTINCT s_score) DESC
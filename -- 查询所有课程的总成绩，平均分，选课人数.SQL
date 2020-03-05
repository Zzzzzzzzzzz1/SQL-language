-- 查询所有课程的总成绩，平均分，选课人数


SELECT c_id,SUM(s_score),AVG(s_score),COUNT(DISTINCT s_id) from score 
GROUP BY c_id

-- 15、按各科成绩进行排序，并显示排名(重点row_number)
SELECT  s_id,c_name,RANK() OVER(PARTITION BY a.c_id ORDER BY s_score DESC) "排名",s_score
FROM
(
(SELECT s_id,c_id,RANK() OVER(PARTITION BY c_id ORDER BY s_score DESC) "排名",s_score
FROM score
ORDER BY c_id) as a
INNER join course as b
on a.c_id=b.c_id
)
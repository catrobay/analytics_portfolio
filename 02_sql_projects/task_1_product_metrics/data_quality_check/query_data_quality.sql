-- Задание 3: Оценка качества данных (Data Quality)
SELECT 
    sum(CASE WHEN end_session IS NULL THEN 1 ELSE 0 END) AS flag_null,
    
    sum(CASE WHEN end_session IS NULL THEN 1 ELSE 0 END)::float 
        / count(*) AS share_total,
        
    sum(CASE WHEN end_session IS NULL AND dev_type = 'ios' THEN 1 ELSE 0 END)::float 
        / sum(CASE WHEN dev_type = 'ios' THEN 1 ELSE 0 END) AS share_ios,
        
    sum(CASE WHEN end_session IS NULL AND dev_type = 'android' THEN 1 ELSE 0 END)::float 
        / sum(CASE WHEN dev_type = 'android' THEN 1 ELSE 0 END) AS share_android,
        
    sum(CASE WHEN end_session IS NULL AND dev_type = 'ios' THEN 1 ELSE 0 END)::float 
        / sum(CASE WHEN end_session IS NULL THEN 1 ELSE 0 END) AS share_ios_of_problem,
        
    sum(CASE WHEN end_session IS NULL AND dev_type = 'android' THEN 1 ELSE 0 END)::float 
        / sum(CASE WHEN end_session IS NULL THEN 1 ELSE 0 END) AS share_android_of_problem

FROM skygame.game_sessions sess
LEFT JOIN skygame.users users
    ON sess.id_user = users.id_user;

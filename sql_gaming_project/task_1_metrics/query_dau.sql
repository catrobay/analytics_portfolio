-- Задание 1: Расчет DAU (Daily Active Users)
SELECT 
    date_trunc('day', start_session) AS session_date,
    count(DISTINCT id_user) AS dau
FROM skygame.game_sessions
GROUP BY session_date
ORDER BY session_date;

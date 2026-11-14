-- Задание 1: Расчет MAU (Monthly Active Users)
SELECT 
    date_trunc('month', start_session) AS session_month,
    count(DISTINCT id_user) AS mau
FROM skygame.game_sessions
GROUP BY session_month
ORDER BY session_month;

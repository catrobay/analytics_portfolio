-- Задание 1: Расчет WAU (Weekly Active Users)
SELECT 
    date_trunc('week', start_session) AS session_week,
    count(DISTINCT id_user) AS wau
FROM skygame.game_sessions
GROUP BY session_week
ORDER BY session_week;

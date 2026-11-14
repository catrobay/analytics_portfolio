-- Задание 1: Объединенный запрос для DAU, WAU, MAU
SELECT 
    count(DISTINCT id_user) AS cnt_users,
    date_trunc('day', start_session) AS day_date,
    date_trunc('week', start_session) AS week_date,
    date_trunc('month', start_session) AS month_date
FROM skygame.game_sessions
GROUP BY day_date, week_date, month_date
ORDER BY day_date;

-- ==========================================
-- Задание 1: Расчет продуктовых метрик (DAU, WAU, MAU)
-- ==========================================

-- 1. DAU (Daily Active Users) - Уникальные пользователи за день
SELECT 
    date_trunc('day', start_session) AS session_date,
    count(DISTINCT id_user) AS dau
FROM skygame.game_sessions
GROUP BY session_date
ORDER BY session_date;


-- 2. WAU (Weekly Active Users) - Уникальные пользователи за неделю
SELECT 
    date_trunc('week', start_session) AS session_week,
    count(DISTINCT id_user) AS wau
FROM skygame.game_sessions
GROUP BY session_week
ORDER BY session_week;


-- 3. MAU (Monthly Active Users) - Уникальные пользователи за месяц
SELECT 
    date_trunc('month', start_session) AS session_month,
    count(DISTINCT id_user) AS mau
FROM skygame.game_sessions
GROUP BY session_month
ORDER BY session_month;


-- 4. Объединенный запрос для выгрузки (DAU, WAU, MAU в одной таблице)
SELECT 
    count(DISTINCT id_user) AS cnt_users,
    date_trunc('day', start_session) AS day_date,
    date_trunc('week', start_session) AS week_date,
    date_trunc('month', start_session) AS month_date
FROM skygame.game_sessions
GROUP BY day_date, week_date, month_date
ORDER BY day_date;

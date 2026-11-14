-- Задание 2: Расчет K-factor и прогнозирование объема когорты
WITH k_factor_calc AS (
    -- 1. Считаем K-factor (отношение регистраций к общему числу юзеров)
    SELECT 
        SUM(r.ref_reg)::float / COUNT(DISTINCT u.id_user) AS k_factor
    FROM skygame.users u
    LEFT JOIN skygame.referral r 
        ON u.id_user = r.id_user
),
cohort_stats AS (
    -- 2. Считаем средний размер исторической когорты в месяц
    SELECT 
        AVG(monthly_users) AS avg_cohort_size
    FROM (
        SELECT 
            date_trunc('month', reg_date) AS reg_month,
            COUNT(id_user) AS monthly_users
        FROM skygame.users
        GROUP BY reg_month
    ) subquery
)

-- 3. Прогнозируем ожидаемый размер будущей когорты с учетом вирусности
SELECT 
    k.k_factor,
    c.avg_cohort_size,
    (k.k_factor * c.avg_cohort_size) AS expected_cohort_size_with_virality
FROM k_factor_calc k
CROSS JOIN cohort_stats c;

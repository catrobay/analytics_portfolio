-- Задание 1: Сравнение длительности сессий (маркетинговая стратегия 11-12.2022)
SELECT 
    CASE 
        WHEN date_trunc('month', reg_date) IN ('2022-11-01', '2022-12-01') THEN 'Marketing_Cohort_11_12'
        ELSE 'Other_Cohorts'
    END AS cohort_segment,
    
    -- Считаем среднюю длительность сессии (только сессии > 5 минут)
    AVG(end_session - start_session) AS avg_session_duration
    
FROM skygame.users u
LEFT JOIN skygame.game_sessions s
    ON u.id_user = s.id_user
WHERE (end_session - start_session) > interval '5 minutes'
GROUP BY cohort_segment;

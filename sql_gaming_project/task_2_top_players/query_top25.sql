-- Задание 2: Топ-25 самых вовлеченных игроков
SELECT 
    sess.id_user,
    sum(end_session - start_session) AS total_time
FROM skygame.game_sessions sess
LEFT JOIN skygame.users users
    ON sess.id_user = users.id_user
WHERE end_session IS NOT NULL
  AND date_part('year', reg_date) = 2022
GROUP BY sess.id_user
ORDER BY total_time DESC
LIMIT 25;

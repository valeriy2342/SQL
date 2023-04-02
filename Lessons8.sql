/* Задание 1
Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.
 */

SELECT
u.id,
u.firstname AS 'Имя', 
u.lastname AS 'Фамилия',
COUNT(*) AS 'Кол-во сообщений'
FROM users u
JOIN
messages m
WHERE m.from_user_id = u.id AND m.to_user_id = 1 AND from_user_id IN (
     SELECT initiator_user_id FROM friend_requests 
     WHERE (target_user_id = 1) AND status ='approved'
     UNION
     SELECT target_user_id FROM friend_requests 
     WHERE (initiator_user_id = 1) AND status ='approved' 
)
GROUP BY u.firstname, u.lastname
ORDER BY COUNT(from_user_id) DESC
LIMIT 1;


/* Задание 2 Подсчитать общее количество лайков, которые получили пользователи младше 11 лет. 
 */


SELECT COUNT(*) 'likes'
FROM likes l 
JOIN
media m  
ON m.id = l.media_id
JOIN 
profiles p 
WHERE p.photo_id = m.id AND TIMESTAMPDIFF(YEAR, p.birthday, NOW()) < 11
;


/* Задание 3. Определить кто больше поставил лайков (всего): мужчины или женщины.
*/

SELECT CASE (gender)
        WHEN 'm' THEN 'MAN'
        WHEN 'f' THEN 'WOMAN'
    	END AS 'Result', COUNT(*) as 'Likes'
FROM profiles p 
JOIN
likes l 
WHERE l.user_id = p.user_id
GROUP BY gender;

 
 
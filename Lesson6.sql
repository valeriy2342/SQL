/* Задание 1
Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.
 */

SELECT
    from_user_id,
    (SELECT concat(firstname,' ', lastname) FROM users WHERE id = messages.from_user_id) AS 'ИМЯ',
    COUNT(*) AS send
FROM messages 
WHERE to_user_id = 1 
AND from_user_id IN (
     SELECT initiator_user_id FROM friend_requests 
     WHERE (target_user_id = 1) AND status ='approved'
     UNION
     SELECT target_user_id FROM friend_requests 
     WHERE (initiator_user_id = 1) AND status ='approved' 
)
GROUP BY from_user_id
ORDER BY send desc;

/* Задание 2 Подсчитать общее количество лайков, которые получили пользователи младше 11 лет. 
 */

SELECT COUNT(*) as 'likes'
FROM likes
WHERE user_id IN (
	SELECT user_id 
	FROM profiles
	WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) < 11);

/* Задание 3. Определить кто больше поставил лайков (всего): мужчины или женщины.
*/

   
-- Есть не соападение количества общих лайков с счетчиком мужчин и женщин
-- Это происходит из за того user_id 1 поставил 7 лайков и счетчик верно считает его за одного мужчину 

SELECT
CASE (gender)
         WHEN 'm' THEN 'мужчин'
         WHEN 'f' THEN 'женщин'
         ELSE 'не указан'
    END AS 'Большинство', COUNT(*)
FROM profiles
WHERE user_id IN (
	SELECT user_id
	FROM likes
)
group by gender 
HAVING count(*) > 1
;


SELECT r.number_room, r.room_category, v.rooms_id  FROM rooms as r join visitors as v WHERE r.number_room = v.rooms_id;
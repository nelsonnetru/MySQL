/*1.	Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/
DELIMITER $$
CREATE FUNCTION timetostr(sec INT)
RETURNS TEXT(130)
DETERMINISTIC
BEGIN
    DECLARE days INT default 0;
    DECLARE hours INT default 0;
    DECLARE minutes INT default 0;
    DECLARE resultsec INT DEFAULT 0;
	
    SET days = FLOOR(sec/60/60/24);
    SET hours = FLOOR((sec - days*24*60*60)/60/60);
	SET minutes = FLOOR((sec - days*24*60*60 - hours*60*60)/60);
    SET resultsec = sec - days*24*60*60 - hours*60*60 - minutes*60;
    RETURN CONCAT (days, ' days, ', hours, ' hours, ', minutes, ' minutes, ', resultsec, ' sec.');
END $$
DELIMITER ;

SELECT timetostr(123456) as result;
SELECT timetostr(3599) as result;
SELECT timetostr(3600) as result;
SELECT timetostr(3601) as result;

/*
2.	Выведите только четные числа от 1 до 10 включительно.
Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)
*/
DELIMITER $$
CREATE PROCEDURE dowhile(max INT)
BEGIN
    DECLARE i INT DEFAULT 2;
    DECLARE res VARCHAR(130) DEFAULT "";
    WHILE i <= max DO
        SET res = CONCAT(res, " ", i);
        SET i = i + 2;
    END WHILE;
    SELECT res;
END $$
DELIMITER ;
CALL dowhile(10);
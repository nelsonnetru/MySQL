USE test_db;

-- Выведите название, производителя и цену для товаров, 
-- количество которых превышает 2 (SQL - файл, скриншот, либо сам код)

SELECT productName, manufacturer, price
FROM phones 
WHERE productCount > 2;

-- Выведите весь ассортимент товаров марки “Samsung”
SELECT * 
FROM phones 
WHERE manufacturer = "Samsung";

-- Выведите информацию о телефонах, где суммарный чек больше 50 000 и меньше 100 000**
SELECT *, productCount*price as checkSumm 
FROM phones 
WHERE productCount*price > 50000 AND productCount*price < 100000;

-- 4.1. Товары, в которых есть упоминание "Iphone"
SELECT * 
FROM phones 
WHERE productName LIKE "%Iphone%";

-- 4.2. Товары, в которых есть упоминание "Galaxy"
SELECT * 
FROM phones 
WHERE productName LIKE "%Galaxy%";

-- 4.3. Товары, в которых есть ЦИФРЫ
SELECT * 
FROM phones 
WHERE productName RLIKE "[0-9]";

-- 4.4. Товары, в которых есть ЦИФРА "8"  
SELECT * 
FROM phones 
WHERE productName RLIKE "[8+]";

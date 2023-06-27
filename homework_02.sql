USE test_db;
# 1. Используя операторы языка SQL, создайте таблицу “sales”. Заполните ее данными. 

CREATE TABLE sales 
(
	id INT PRIMARY KEY auto_increment, 
    order_date DATE NOT NULL, 
    bucket INT NOT NULL
);

INSERT INTO sales (order_date, bucket) 
VALUES 
("2021-01-01", 150),
("2021-01-02", 190),
("2021-01-03", 80),
("2021-01-04", 275),
("2021-01-05", 450);

/* 2. Разделите  значения поля “bucket” на 3 сегмента: 
меньше 100(“Маленький заказ”), 
100-300(“Средний заказ”) 
и больше 300 (“Большой заказ”)
*/

SELECT *, 
CASE 
	WHEN bucket < 100 THEN "Маленький заказ" 
	WHEN bucket >= 100 AND bucket <= 300 THEN "Средний заказ" 
	ELSE "Большой заказ" 
END AS orderType
FROM sales;

/* 3. Создайте таблицу “orders”, заполните ее значениями. 
 Покажите “полный” статус заказа, используя оператор CASE.*/
 
 CREATE TABLE orders 
(
	orderid INT PRIMARY KEY auto_increment, 
    employeeid VARCHAR(10) NOT NULL, 
    amount DECIMAL(6,2) DEFAULT 0,
    orderstatus VARCHAR(10) NOT NULL
);

INSERT INTO orders (employeeid, amount, orderstatus) 
VALUES 
("e03", 15.00, "OPEN"),
("e01", 25.50, "OPEN"),
("e05", 100.70, "CLOSED"),
("e02", 22.18, "OPEN"),
("e04", 9.50, "CANCELLED"),
("e04", 99.99, "OPEN");

SELECT orderid, orderstatus, 
CASE
	WHEN orderstatus = "OPEN" THEN "Order is in open state" 
    WHEN orderstatus = "CLOSED" THEN "Order is closed" 
    WHEN orderstatus = "CANCELLED" THEN "Order is cancelled" 
    ELSE "unknown"
END AS order_summary
FROM orders;

-- 4. Чем 0 отличается от NULL?
/* NULL означает пустое значение, т.е. ничего. А значение 0 - это числовое значение, может быть результатом арифметической операции

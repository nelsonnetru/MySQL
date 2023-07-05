USE test_db;

-- Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов
CREATE VIEW cars_filter AS 
SELECT * FROM cars 
WHERE cost < 25000;

-- Изменить в существующем представлении порог для стоимости: 
-- пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)
ALTER VIEW  cars_filter AS
SELECT * FROM cars 
WHERE cost < 30000;

-- Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
CREATE VIEW SkodaAudi AS 
SELECT * FROM cars 
WHERE name IN ("Skoda", "Audi");

/*Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.

Есть таблица анализов Analysis:
an_id — ID анализа;
an_name — название анализа;
an_cost — себестоимость анализа;
an_price — розничная цена анализа;
an_group — группа анализов.

Есть таблица групп анализов Groups:
gr_id — ID группы;
gr_name — название группы;
gr_temp — температурный режим хранения.

Есть таблица заказов Orders:
ord_id — ID заказа;
ord_datetime — дата и время заказа;
ord_an — ID анализа.
*/

CREATE TABLE Groups 
(
	gr_id INT PRIMARY KEY auto_increment, 
    gr_name VARCHAR(45) NOT NULL,
    gr_temp VARCHAR(10) NOT NULL
);

CREATE TABLE Analysis 
(
	an_id INT PRIMARY KEY auto_increment, 
    an_name VARCHAR(45) NOT NULL,
    an_cost INT NOT NULL, 
    an_price INT NOT NULL, 
    an_group INT NOT NULL, 
	FOREIGN KEY (an_group) REFERENCES Groups (gr_id)
);

CREATE TABLE Orders 
(
	ord_id INT PRIMARY KEY auto_increment, 
    ord_datetime DATETIME NOT NULL,
    ord_an INT NOT NULL, 
    FOREIGN KEY (ord_an) REFERENCES Analysis (an_id)
);

INSERT INTO Groups (gr_name, gr_temp) 
VALUES 
("Биохимический", "HOT"),
("Общий", "COLD"),
("Углубленный", "NORMAL");

INSERT INTO Analysis (an_name, an_cost, an_price, an_group) 
VALUES 
("Анализ крови", 1000, 5000, 1),
("Генетический анализ", 12000, 17000, 2),
("Полный анализ на клетчатом уровне", 120000, 170000, 2),
("Тест COVID", 670, 1000, 1),
("Инфекционный", 7500, 12300, 3),
("Аллергический", 8000, 14500, 3);

/*
Добавьте новый столбец под названием «время до следующей станции». Чтобы получить это значение, 
мы вычитаем время станций для пар смежных станций. Мы можем вычислить это значение без использования 
оконной функции SQL, но это может быть очень сложно. Проще это сделать с помощью оконной функции LEAD . 
Эта функция сравнивает значения из одной строки со следующей строкой, чтобы получить результат. 
В этом случае функция сравнивает значения в столбце «время» для станции со станцией сразу после нее.
*/

CREATE TABLE Train 
(
	id INT PRIMARY KEY auto_increment, 
	train_id INT, 
    station VARCHAR(20) NOT NULL,
    station_time TIME NOT NULL
);

INSERT INTO Train (train_id, station, station_time) 
VALUES 
(110, "San Francisco", "10:00:00"),
(110, "Redwood City", "10:54:00"),
(110, "Palo Alto", "11:02:00"),
(110, "San Jose", "12:35:00"),
(120, "San Francisco", "11:00:00"),
(120, "Palo Alto", "12:49:00"),
(120, "San Jose", "13:30:00");

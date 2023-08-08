SELECT * from zadanie2 z ;
-- создаём таблицу
create table zadanie2 ( table_name VARCHAR(50), name_primary_key VARCHAR(50) );

-- находим название таблиц
show tables ;

-- нашёл таблицу информационная схема
SELECT * from  information_schema.tables;
-- пробуем сделать запрос данных 
SELECT TABLE_SCHEMA , TABLE_NAME  from information_schema.tables WHERE TABLE_SCHEMA  = 'sakila';
-- заполняем нашу таблицу найдённым списком названия таблиц
INSERT INTO zadanie2 (table_name) 
select table_name from information_schema.tables 
WHERE  table_schema = 'sakila';
-- смотрим
SELECT * FROM  zadanie2;
-- удаляем строки из таблицы задание2, нашёл другую таблицу 
delete from zadanie2;
-- в этой таблицу есть информацию о названии таблицы и первичный ключ


SELECT * FROM  information_schema.key_column_usage;
-- запрос данных таблиицы где название таблицы сакила и значение ключа - первичный
SELECT TABLE_NAME, COLUMN_NAME from information_schema.key_column_usage  WHERE table_schema = 'sakila' AND CONSTRAINT_NAME = 'primary';
-- запихиваем всё это в нашу таблицу 
INSERT INTO zadanie2 (table_name, name_primary_key)
select TABLE_NAME, COLUMN_NAME from information_schema.key_column_usage 
WHERE table_schema = 'sakila' AND CONSTRAINT_NAME = 'primary';
-- смотрим
SELECT * FROM  zadanie2;


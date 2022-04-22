CREATE DATABASE Taxi;


CREATE TABLE employee_accounting
(	
	id_employee INTEGER PRIMARY KEY NOT NULL,
	first_name CHARACTER VARYING(30),
	last_name CHARACTER VARYING(30),
	patronymic CHARACTER VARYING(30),
	phone CHARACTER VARYING(30),
	date_of_issue DATE,
	passport_SaN BIGINT,
	department_code BIGINT,
	residential_address VARCHAR(250),
	date_of_birth DATE,
	position_ CHARACTER VARYING(30)
);


CREATE TABLE employee_vehicle_accounting
(
	number_car INTEGER PRIMARY KEY NOT NULL,
	mark VARCHAR(30),
	type_ VARCHAR(30),
	category VARCHAR(10),
	year_of_issue INTEGER,
	passport_series BIGINT,
	colour CHARACTER VARYING(30)
);



CREATE TABLE vip_customer_accounting
(
	id_call INTEGER PRIMARY KEY NOT NULL,
	id_client INTEGER NOT NULL,
	first_name CHARACTER VARYING(30),
	last_name CHARACTER VARYING(30),
	patronymic CHARACTER VARYING(30),
	discounts INTEGER,
	phone CHARACTER VARYING(30),
	address VARCHAR(250)
);


CREATE TABLE accounting_of_received_calls
(
	id_call INTEGER PRIMARY KEY,
	id_employee INTEGER REFERENCES employee_accounting (id_employee),
	number_car INTEGER REFERENCES employee_vehicle_accounting (number_car),
	date_time TIMESTAMP,
	phone CHARACTER VARYING(30),
	address VARCHAR(250),
	destination VARCHAR(250) UNIQUE
);


CREATE TABLE vip_calls
(
	vip_call INTEGER REFERENCES vip_customer_accounting (id_call),
	received_call INTEGER REFERENCES accounting_of_received_calls (id_call)
);


CREATE TABLE rates
(
	destination VARCHAR(250) PRIMARY KEY NOT NULL,
	mileage SMALLINT,
	price INTEGER
);


CREATE TABLE rate_calls
(
	rate_dest VARCHAR(250) NOT NULL REFERENCES rates (destination),
	calls_dest VARCHAR(250) NOT NULL REFERENCES accounting_of_received_calls (destination)
);



INSERT INTO employee_accounting  (id_employee, first_name, last_name, patronymic,
									 phone, date_of_issue, passport_SaN, department_code,
									 residential_address, date_of_birth, position_)
VALUES
(101, '»ван', 'ѕетров', 'Ќикитович', 89060100010, '2016-02-01', 9214524102, 127842, ' улахметова 11ј', '1996-01-13', '“аксист'),
(102, 'ѕитер', 'ƒжексон', '«иннурович', 89060100011, '2015-08-14', 9214575670, 120437, 'Ћугова€ улица 75', '1980-01-12', '“аксист'),
(103, '–асим', '’алиуллин', 'јлгизов', 89060100012, '2011-12-05', 9200846179, 128548, '¬осстани€ 98Ќ', '1995-01-11', '“аксист'),
(104, '»льназ', 'Ѕагаутдинов', ' амилович', 89060100013, '2014-07-30', 5798410234, 179008, '’асана “уфана 50', '1972-01-10', '“аксист'),
(105, 'јртем', ' арлосон', 'Ќикитович', 89060100014, '2018-02-01', 1068461857, 140573, '√агарина 12ј', '1976-02-13', '“аксист'),
(106, '¬ладимир', '“акта', '¬ладимирович', 89060100015, '2016-02-25', 9828567557, 548032, ' омбинатска€ улица 15', '1967-02-12', '“аксист'),
(107, '–егина', 'ћусина', '»льгизовна', 89060100016, '2016-03-07', 1057957004, 984051, '√аврилова 48', '1971-02-11', '“аксист'),
(108, 'Ёнже', 'Ўайхуллина', 'јльбертовна', 89060100017, '2010-11-04', 1895792493, 789540, ' омбинатска€ улица 15', '1985-02-10', '“аксист'),
(109, 'ћаксим', '‘ексил', '“умбочкович', 89060100018, '2012-01-18', 5867855961, 924631, 'јдел€  уту€ 122', '1985-04-13', '“аксист'),
(110, '«иннур', '‘ахриев', '–адикович', 89060100019, '2019-10-10', 9520626402, 828105, '√умера √али 50', '1994-12-12', '“аксист');



INSERT INTO employee_vehicle_accounting (number_car, mark, type_, category, 
												 year_of_issue, passport_series, colour)
VALUES
(123, 'KIA', 'Sedan', 'B1', 2014, 456784206, 'White'),
(124, 'Hyundai', 'Hatchback', 'B1', 2015, 456715257, 'Black'),
(125, 'KIA', 'Sedan', 'B1', 2018, 558464844, 'Black'),
(126, 'Toyota', 'Sedan', 'B1', 2010, 456774565, 'White'),
(127, 'Hyundai', 'Hatchback', 'B1', 2018, 456745606, 'Yellow'),
(128, 'Hyundai', 'Sedan', 'B1', 2019, 874384206, 'White'),
(129, 'KIA', 'Hatchback', 'B1', 2020, 987454206, 'Black'),
(130, 'Toyota', 'Hatchback', 'B1', 2016, 456705406, 'White'),
(131, 'KIA', 'Sedan', 'B1', 2017, 456705795, 'Yellow'),
(132, 'Opel', 'Sedan', 'B1', 2016, 456705468, 'White');



INSERT INTO vip_customer_accounting  (id_call, id_client, first_name, last_name,
								patronymic, discounts, phone, address)
VALUES
(1, 1, 'Ёлжей', 'ћиннуллин', 'ћаркович', 10, 89374585539, 'Ѕаумана_15'),
(2, 2, '√абдулла', 'јлиш', '–агнарович', 0, 89374585538, 'Ѕаумана_34'),
(3, 3, '»льшат', '–ашитов', 'Ќазимович', 0, 89194585538, 'ƒекабристов 48'),
(4, 4, 'јйваз', '√ардиев', 'ј€зович', 10, 89194585539, '”ниверситетска€ 3'),
(5, 5, '–ейхан', '√алиева', '–устамовна', 0, 89374585528, 'јвиастроительна€ 31а'),
(6, 6, '√олнара', 'јмирова', '–аисовна', 10, 89074585538, 'јдел€  ута€ 7'),
(7, 7, '√ульчачак', ' амалова', '–инатовна', 0, 89194585500, 'ѕитербургска€ 42'),
(8, 8, 'Ўамил', '‘ардиев', 'Ўаукатович', 10, 89194585501, 'ѕушкина 60'),
(9, 9, 'Ёльвира', 'ћагсумз€нова', 'Ќарикович', 10, 89194585502, 'Ўал€пина 12'),
(10, 10, 'Ѕулат', '’акимов', 'јйгизович', 0, 89194585503, 'јйвазовского 3а');



INSERT INTO accounting_of_received_calls  (id_call, id_employee, number_car,
						date_time, phone, address, destination)
VALUES
(1, 101, 123, '2020-04-18 16:30', 89374585539, 'Ѕаумана_15', 'јбсал€мова 25'),
(2, 102, 124, '2020-04-10 04:00', 89374585539, 'Ѕаумана_34', '“ихорецка€ 2'),
(3, 103, 124, '2020-04-11 06:10', 89194585538, 'ƒекабристов 48', 'ћагистральна€ 14'),
(4, 104, 127, '2020-04-11 22:00', 89194585539, 'јйвазовского 3а', 'јктайска€ 7а'),
(5, 105, 132, '2020-04-11 12:10', 89374585528, 'јвиастроительна€ 31а', '«айцева 15'),
(6, 106, 123, '2020-04-01 18:00', 89074585538, 'Ѕаумана_15', 'ѕортова€ 6'),
(7, 107, 127, '2020-04-07 17:50', 89194585500, 'ѕитербургска€ 42', '„ишм€ле 7'),
(8, 108, 130, '2020-03-25 06:10', 89194585501, 'ѕушкина 60', 'ћухамедь€ра 17'),
(9, 109, 132, '2020-03-20 17:50', 89194585502, 'Ўал€пина 12', ' азанска€ 43'),
(10, 110, 132, '2020-03-20 17:50', 89194585503, 'јйвазовского 3а', 'јшхабадска€ 172');




INSERT INTO rates (destination, mileage, price)
VALUES
('јбсал€мова 25', 15, 300),
 ('“ихорецка€ 2', 45, 500),
 ('ћагистральна€ 14', 9, 150),
 ('јктайска€ 7а', 6, 150),
 ('«айцева 15', 8, 150),
 ('ѕортова€ 6', 8, 150),
 ('„ишм€ле 7', 3, 100),
 ('ћухамедь€ра 17', 1.6, 100),
 (' азанска€ 43', 8, 150),
 ('јшхабадска€ 172', 7, 150);


CREATE VIEW colour_car AS
    SELECT *
    FROM employee_vehicle_accounting
    WHERE colour = 'Black';


CREATE VIEW vehicle_mark AS
    SELECT *
    FROM employee_vehicle_accounting
    WHERE mark = 'KIA'
    WITH LOCAL CHECK OPTION;


CREATE VIEW vehicle_colour AS
    SELECT *
    FROM employee_vehicle_accounting
    WHERE colour = 'White'
    WITH CASCADED CHECK OPTION;

SELECT eva.mark, eva.colour FROM employee_vehicle_accounting eva 
WHERE colour = 'White' and mark = 'Toyota';

SELECT eva.mark, eva.number_car, count(*) quantity 
FROM employee_vehicle_accounting eva
LEFT JOIN accounting_of_received_calls arc on arc.number_car=eva.number_car
GROUP BY eva.number_car ORDER BY quantity DESC LIMIT 1;

SELECT date_of_issue, first_name || ' ' || last_name AS FullName 
FROM employee_accounting
WHERE date_of_issue < '2010-12-31';

SELECT vca.first_name, vca.last_name, arc.date_time 
FROM vip_customer_accounting vca
INNER JOIN accounting_of_received_calls arc ON arc.id_call = vca.id_call
WHERE arc.date_time >= '2020-03-01 00:00' and arc.date_time <= '2020-03-31 00:00';

SELECT MAX(r.price)
FROM rates r
WHERE mileage <=40;

SELECT MIN(r.mileage)
FROM rates r
WHERE price <= 200;

SELECT SUM(r.price)
FROM rates r
WHERE mileage > 6 and mileage < 20;

SELECT AVG(price) 
FROM rates WHERE mileage < 20;

SELECT eva.mark, count(eva.mark) as count_car
FROM employee_vehicle_accounting eva
GROUP BY eva.mark;

SELECT ea.first_name, ea.last_name, ea.phone, ea.date_of_issue
FROM employee_accounting ea
ORDER BY date_of_issue ASC;

SELECT number_car
FROM employee_vehicle_accounting WHERE type_ = 'Hatchback'
UNION SELECT number_car
FROM accounting_of_received_calls;

SELECT id_call, first_name || ' ' || last_name AS FullName,
CONCAT('...', RIGHT(address, 10)) 
FROM vip_customer_accounting;

SELECT va.id_call, va.first_name || ' ' || va.last_name 
AS FullName, arc.date_time, arc.address, arc.destination
FROM accounting_of_received_calls arc
JOIN vip_customer_accounting va ON va.id_call=arc.id_call;

SELECT va.id_call, va.first_name || ' ' || va.last_name 
AS FullName, arc.date_time, eva.mark, eva.colour
FROM accounting_of_received_calls arc
JOIN vip_customer_accounting va ON va.id_call=arc.id_call
LEFT JOIN employee_vehicle_accounting eva
ON eva.number_car=arc.number_car
ORDER BY arc.date_time ASC;

SELECT ea.first_name, ea.last_name, ea.phone, ea.position_,
eva.number_car, eva.year_of_issue
FROM employee_accounting ea
JOIN accounting_of_received_calls arc
ON arc.id_employee=ea.id_employee
JOIN employee_vehicle_accounting eva 
ON eva.number_car=arc.number_car
ORDER BY eva.year_of_issue DESC;



CREATE OR REPLACE FUNCTION check_row_employee_accounting() RETURNS TRIGGER AS $$
BEGIN
	
	-- ѕровер€ем есть ли сотруднику 18 лет
	IF(extract(year from age(now(), NEW.date_of_birth)) < 18) THEN
		-- ≈сли нет - выдаем ошибку
		RAISE EXCEPTION '—отрудник слишком молодой: %', NEW.date_of_birth;
	-- ѕровер€ем номер телефона
	ELSIF(char_length(NEW.phone) < 8 OR char_length(NEW.phone) > 16) THEN
		-- ≈сли номер содержит меньше 8-и или больше 16-и сиимволов - выдаем ошибку
		RAISE EXCEPTION 'Ќеверно введен номер телефона: %', NEW.phone;
	END IF;
 
	RETURN NEW;

END; $$ LANGUAGE plpgsql;


-- ”дал€ем триггер если существует
DROP TRIGGER IF EXISTS tr_check_row_employee_accounting on employee_accounting;
-- —оздаем триггер, которой будет срабатывать перед вставкой или при обновлении 
-- записи в таблице employee_accounting
CREATE TRIGGER tr_check_row_employee_accounting
BEFORE INSERT OR UPDATE ON employee_accounting
FOR EACH ROW EXECUTE PROCEDURE check_row_employee_accounting();





CREATE OR REPLACE FUNCTION check_car_accounting_of_received_calls() RETURNS TRIGGER AS $$
DECLARE
	l_year_of_issue INTEGER;
BEGIN
	-- ѕолучаем год выпуска автомобил€
	SELECT year_of_issue INTO l_year_of_issue from employee_vehicle_accounting
	WHERE number_car = NEW.number_car;

	l_year_of_issue := 2020-l_year_of_issue;

	--IF(l_year_of_issue > 10) THEN 
		RAISE NOTICE 'јвтомобилю % лет. ѕора покупать новый.', l_year_of_issue;
	--END IF;
 
	RETURN NEW;

END; $$ LANGUAGE plpgsql;


-- ”дал€ем триггер если существует
DROP TRIGGER IF EXISTS tr_check_car_accounting_of_received_calls on accounting_of_received_calls;
-- —оздаем триггер, которой будет срабатывать перед вставкой 
-- записи в таблицу accounting_of_received_calls
CREATE TRIGGER tr_check_car_accounting_of_received_calls
BEFORE INSERT ON accounting_of_received_calls
FOR EACH ROW EXECUTE PROCEDURE check_car_accounting_of_received_calls();


-- —оздаем функцию, котора€ будет выдавать количество заказов такси за определенный промежуток времени
CREATE OR REPLACE FUNCTION get_colls_count(start_date TIMESTAMP, finish_date TIMESTAMP)
RETURNS INTEGER AS $$
DECLARE
result INTEGER := 0;
BEGIN

SELECT COUNT(*) INTO result FROM accounting_of_received_calls
WHERE start_date < date_time AND date_time < finish_date;

RETURN result;

END; $$ LANGUAGE plpgsql;

select * from get_colls_count('2018-04-18 16:30','2020-04-11 20:00');

CREATE OR REPLACE FUNCTION date_of_issue_acc(finish_date DATE)
RETURNS INTEGER AS $$
DECLARE
result INTEGER := 0;
BEGIN

SELECT COUNT(*) INTO result FROM employee_accounting
WHERE date_of_issue < finish_date;

RETURN result;

END; $$ LANGUAGE plpgsql;


SELECT * FROM date_of_issue_acc('2011-01-01');

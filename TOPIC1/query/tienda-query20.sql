-- 1. List the name of all the products in the "product" table.
USE tienda; SELECT nombre FROM producto;
-- 2. List the names and prices of all products in the "product" table.
USE tienda; SELECT nombre, precio FROM producto;
-- 3. List all columns in the "product" table.
USE tienda; SELECT * FROM producto;
-- 4. List the name of the "products", the price in euros and the price in US dollars (USD).
USE tienda; SELECT nombre, precio, ROUND(precio * 1.1, 2) FROM producto;
-- 5. List the name of the "products", the price in euros and the price in US dollars. Use the following aliases for the columns: "product" name, euros, US dollars.
USE tienda; SELECT nombre AS 'product', precio AS 'euros', ROUND(precio * 1.1) AS 'US dollars' FROM producto;
-- 6. List the names and prices of all products in the "product" table, converting the names to uppercase.
USE tienda; SELECT UPPER(nombre) AS 'NombreMayuscula', precio FROM producto;
-- 7. List the names and prices of all products in the "product" table, converting the names to lowercase.
USE tienda; SELECT LOWER(nombre) AS 'NombreMinuscula', precio FROM producto;
-- 8. List the name of all manufacturers in one column, and in another column capitalize the first two characters of the manufacturer's name.
USE tienda; SELECT nombre, UPPER(LEFT(nombre,2)) FROM fabricante;
-- 9. Lists the names and prices of all products in the "product" table, rounding the price value.
USE tienda; SELECT nombre, ROUND(precio) FROM producto;
-- 10. List the names and prices of all products in the "product" table, truncating the price value to display it without any decimal places.
USE tienda; SELECT nombre, FLOOR(precio) FROM producto;
-- 11. List the code of the manufacturers that have products in the "product" table.
USE tienda; SELECT codigo_fabricante FROM producto;
-- 12. List the code of the manufacturers that have products in the "producto" table, removing the codes that appear repeatedly.
USE tienda; SELECT DISTINCT codigo_fabricante FROM producto;
-- 13. List manufacturer names in ascending order.
USE tienda; SELECT nombre FROM fabricante ORDER BY nombre ASC;
-- 14. List manufacturer names in descending order.
USE tienda; SELECT nombre FROM fabricante ORDER BY nombre DESC;
-- 15. Lists product names sorted first by name in ascending order and second by price in descending order.
USE tienda; SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
-- 16. Returns a list with the first 5 rows of the "manufacturer" table.
USE tienda; SELECT * FROM fabricante LIMIT 5;
-- 17. Returns a list with 2 rows starting from the fourth row of the "manufacturer" table. The fourth row must also be included in the answer.
USE tienda; SELECT * FROM fabricante LIMIT 3, 2;
-- 18. List the cheapest product name and price. (Use only the ORDER BY and LIMIT clauses). NOTE: Here you could not use MIN(price), you would need GROUP BY
USE tienda; SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
-- 19. List the name and price of the most expensive product. (Use only ORDER BY and LIMIT clauses). NOTE: Here you could not use MAX(price), you would need GROUP BY.
USE tienda; SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
-- 20. List the name of all products from the manufacturer whose manufacturer code is equal to 2.
USE tienda; SELECT nombre, codigo_fabricante FROM producto WHERE codigo_fabricante = 2;
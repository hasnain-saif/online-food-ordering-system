SELECT c.name, o.order_id, o.total_amount
FROM CUSTOMER c
JOIN ORDERS o ON c.customer_id = o.customer_id;

SELECT r.name, SUM(o.total_amount) AS total_sales
FROM RESTAURANT r
JOIN FOOD f ON r.restaurant_id = f.restaurant_id
JOIN ORDER_DETAILS od ON f.food_id = od.food_id
JOIN ORDERS o ON od.order_id = o.order_id
GROUP BY r.name;

SELECT f.name, COUNT(*) AS total_orders
FROM FOOD f
JOIN ORDER_DETAILS od ON f.food_id = od.food_id
GROUP BY f.name;

SELECT SUM(amount) AS total_revenue FROM PAYMENT;

SELECT * FROM ORDERS
WHERE total_amount = (SELECT MAX(total_amount) FROM ORDERS);
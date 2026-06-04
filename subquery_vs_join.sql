USE sql_store;

SELECT 
	DISTINCT customer_id, 
    first_name,
    last_name
FROM customers
JOIN orders USING (customer_id)
JOIN order_items USING (order_id)
WHERE product_id = 3;

SELECT 
	customer_id, 
    first_name,
    last_name
FROM customers c
WHERE c.customer_id IN (
	SELECT customer_id
	FROM orders o
	JOIN order_items oi
	ON o.order_id = oi.order_id AND oi.product_id = 3
)
SELECT 
	CONCAT(c.first_name , ' ' , c.last_name) AS full_name,
    state, 
    SUM(unit_price * quantity) AS total_spent
FROM orders o
JOIN customers c
USING (customer_id)
JOIN order_items oi
USING (order_id)
GROUP BY state , full_name
HAVING state = 'VA' AND total_spent > 100
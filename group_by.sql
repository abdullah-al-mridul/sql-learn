SELECT 
	p.date, 
    pm.name ,
    SUM(amount) AS total_payments
FROM payments p
JOIN payment_methods pm
ON pm.payment_method_id = p.payment_method
GROUP BY p.date , pm.name
ORDER BY date
USE sql_invoicing;

SELECT 
	client_id,
	name,
	SUM(invoice_total) AS total_sales,
    (
		SELECT AVG(invoice_total)
        FROM invoices
    ) AS average,
    SUM(invoice_total) - (SELECT average) AS difference
FROM clients c
JOIN invoices 
USING (client_id )
GROUP BY (client_id)
ORDER BY (client_id);
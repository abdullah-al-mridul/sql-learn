-- get invoices that are larger than the
-- clients average invoice amount

USE sql_invoicing;

SELECT i.client_id , invoice_id , c.name , i.invoice_total
FROM invoices i
JOIN clients c USING (client_id)
WHERE invoice_total > (
	SELECT AVG(invoice_total) AS avg_total 
	FROM invoices
	WHERE client_id = i.client_id
)
ORDER BY client_id;
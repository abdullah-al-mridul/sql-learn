USE sql_invoicing;

SELECT *
FROM clients c
WHERE c.client_id NOT IN (
    SELECT DISTINCT client_id FROM invoices
);
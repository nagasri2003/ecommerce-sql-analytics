-- Total revenue per client
SELECT client_name, SUM(amount) AS total_revenue
FROM transactions
GROUP BY client_name
ORDER BY total_revenue DESC;

-- Average revenue per order
SELECT AVG(amount) AS avg_order_revenue FROM transactions;

--Top 5 Clients by Total Revenue
SELECT client_name, SUM(amount) AS total_revenue
FROM transactions
GROUP BY client_name
ORDER BY total_revenue DESC
LIMIT 5;

--Average Order Value by Industry
SELECT industry, AVG(amount) AS avg_order_value
FROM transactions
JOIN clients USING (client_id)
GROUP BY industry
ORDER BY avg_order_value DESC;
 
--. Highest Revenue Day
SELECT order_date, SUM(amount) AS revenue
FROM transactions
GROUP BY order_date
ORDER BY revenue DESC
LIMIT 1;

--Revenue Contribution by Industry
SELECT industry, ROUND(SUM(amount)*100.0 / (SELECT SUM(amount) FROM transactions), 2) AS revenue_percentage
FROM transactions
JOIN clients USING (client_id)
GROUP BY industry
ORDER BY revenue_percentage DESC;

--Clients with Zero Transactions
SELECT client_name
FROM clients
WHERE client_id NOT IN (SELECT DISTINCT client_id FROM transactions);

-- Which branch has the best results in the loyalty program?
SELECT branch, COUNT(DISTINCT invoice_id) AS number_of_loyal_customers
FROM sales
WHERE customer_type = 'Member'
GROUP BY branch
ORDER BY number_of_loyal_customers DESC;

-- Does the membership depend on customer rating?
SELECT branch, rating, COUNT(DISTINCT invoice_id) AS number_of_customers
FROM sales
GROUP BY branch, rating
ORDER BY branch, rating DESC;

-- Does gross income depend on the proportion of customers in the loyalty program? On payment method?
SELECT branch, COUNT(DISTINCT invoice_id) AS number_of_customers,
SUM(total) AS gross_income,
(SUM(total) / COUNT(DISTINCT invoice_id)) AS average_income
FROM sales
GROUP BY branch;

SELECT payment, COUNT(DISTINCT invoice_id) AS number_of_customers,
SUM(total) AS gross_income,
(SUM(total) / COUNT(DISTINCT invoice_id)) AS average_income
FROM sales
GROUP BY payment;

-- Are there any differences in indicators between men and women?
SELECT gender, COUNT(DISTINCT invoice_id) AS number_of_customers,
SUM(total) AS gross_income,
(SUM(total) / COUNT(DISTINCT invoice_id)) AS average_income
FROM sales
GROUP BY gender;

-- Which product category generates the highest income?
SELECT product_line, SUM(total) AS gross_income
FROM sales
GROUP BY product_line
ORDER BY gross_income DESC;
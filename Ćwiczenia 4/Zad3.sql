SELECT e.last_name, p.product_name, SUM(s.amount) AS total_sales,
       RANK() OVER (ORDER BY SUM(s.amount) DESC) AS sales_rank
FROM employees e
JOIN sales s ON e.employee_id = s.employee_id
JOIN products p ON s.product_id = p.product_id
GROUP BY e.last_name, p.product_name;

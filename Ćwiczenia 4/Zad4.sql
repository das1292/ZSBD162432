SELECT e.last_name, p.product_name, s.price,
       COUNT(*) OVER (PARTITION BY p.product_name, s.sale_date) AS transactions_per_day,
       s.amount,
       LAG(s.price) OVER (PARTITION BY p.product_name ORDER BY s.sale_date) AS previous_price,
       LEAD(s.price) OVER (PARTITION BY p.product_name ORDER BY s.sale_date) AS next_price
FROM sales s
JOIN employees e ON s.employee_id = e.employee_id
JOIN products p ON s.product_id = p.product_id;

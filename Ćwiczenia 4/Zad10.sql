SELECT e.last_name, p.product_name,
       s.amount * s.price AS value,
       RANK() OVER (PARTITION BY s.sale_date ORDER BY s.amount * s.price DESC) AS rank_per_day,
       RANK() OVER (ORDER BY s.amount * s.price DESC) AS global_rank
FROM sales s
JOIN employees e ON s.employee_id = e.employee_id
JOIN products p ON s.product_id = p.product_id;

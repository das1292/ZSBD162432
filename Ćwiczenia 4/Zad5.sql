SELECT p.product_name, TO_CHAR(s.sale_date, 'YYYY-MM') AS month,
       SUM(s.amount) AS monthly_total,
       SUM(SUM(s.amount)) OVER (PARTITION BY p.product_name ORDER BY TO_CHAR(s.sale_date, 'YYYY-MM')) AS running_total
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name, TO_CHAR(s.sale_date, 'YYYY-MM');

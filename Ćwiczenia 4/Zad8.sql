SELECT p.product_name, s.sale_date, s.price,
       ROUND(AVG(s.price) OVER (
           PARTITION BY p.product_name
           ORDER BY s.sale_date
           ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
       ), 2) AS moving_avg
FROM products p
JOIN sales s ON p.product_id = s.product_id;

SELECT p.category, p.product_name, s.price,
       MIN(s.price) OVER (PARTITION BY p.category) AS min_price,
       MAX(s.price) OVER (PARTITION BY p.category) AS max_price,
       MAX(s.price) OVER (PARTITION BY p.category) - MIN(s.price) OVER (PARTITION BY p.category) AS price_range
FROM products p
JOIN sales s ON p.product_id = s.product_id;

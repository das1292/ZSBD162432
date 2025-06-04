SELECT p.product_name, p.category, s.price,
       RANK() OVER (PARTITION BY p.category ORDER BY s.price DESC) AS rank_regular,
       DENSE_RANK() OVER (PARTITION BY p.category ORDER BY s.price DESC) AS rank_dense
FROM products p
JOIN sales s ON p.product_id = s.product_id;

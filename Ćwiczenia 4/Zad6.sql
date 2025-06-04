SELECT p.product_name, p.category,
       s2022.price AS price_2022, s2023.price AS price_2023,
       (s2023.price - s2022.price) AS price_diff
FROM
  (SELECT product_id, sale_date, price FROM sales WHERE EXTRACT(YEAR FROM sale_date) = 2022) s2022
JOIN
  (SELECT product_id, sale_date, price FROM sales WHERE EXTRACT(YEAR FROM sale_date) = 2023) s2023
  ON s2022.product_id = s2023.product_id AND TO_CHAR(s2022.sale_date, 'MM-DD') = TO_CHAR(s2023.sale_date, 'MM-DD')
JOIN products p ON s2022.product_id = p.product_id;

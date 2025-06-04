SELECT first_name, last_name,
       MONTHS_BETWEEN(SYSDATE, hire_date) AS miesiace_pracy,
       CASE
         WHEN MONTHS_BETWEEN(SYSDATE, hire_date) <= 150 THEN 0.10 * salary
         WHEN MONTHS_BETWEEN(SYSDATE, hire_date) <= 200 THEN 0.20 * salary
         ELSE 0.30 * salary
       END AS wysokosc_dodatku
FROM employees
ORDER BY miesiace_pracy;

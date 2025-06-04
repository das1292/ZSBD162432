SELECT employee_id, last_name, salary,
       RANK() OVER (ORDER BY salary DESC) AS ranking
FROM employees;

SELECT employee_id, last_name, salary,
       SUM(salary) OVER () AS total_salary
FROM employees;

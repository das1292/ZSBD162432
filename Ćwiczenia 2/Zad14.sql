SELECT last_name, salary, hire_date
FROM employees
WHERE hire_date = (
    SELECT MIN(hire_date) FROM employees
);

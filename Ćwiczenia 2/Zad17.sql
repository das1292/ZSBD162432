SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date = (
    SELECT MIN(hire_date)
    FROM employees
);

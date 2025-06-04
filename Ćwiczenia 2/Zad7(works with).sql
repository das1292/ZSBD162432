SELECT first_name, last_name
FROM employees
WHERE department_id = (
    SELECT department_id
    FROM employees
    WHERE first_name = 'Jennifer'
);
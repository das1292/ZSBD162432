SELECT department_name
FROM departments
WHERE department_id NOT IN (
    SELECT DISTINCT department_id
    FROM employees
    WHERE department_id IS NOT NULL
);

SELECT last_name, department_id
FROM employees e
WHERE 1 = (
    SELECT COUNT(*)
    FROM employees
    WHERE department_id = e.department_id
);

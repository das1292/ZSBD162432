SELECT e.last_name, e.department_id
FROM employees e
WHERE e.department_id IN (
    SELECT department_id
    FROM employees
    GROUP BY department_id
    HAVING COUNT(*) > 3
);

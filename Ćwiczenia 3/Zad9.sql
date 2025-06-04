CREATE MATERIALIZED VIEW v_managerowie AS
SELECT DISTINCT e.employee_id, e.last_name, e.first_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.employee_id IN (SELECT DISTINCT manager_id FROM employees WHERE manager_id IS NOT NULL);

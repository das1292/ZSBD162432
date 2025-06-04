SELECT e.last_name AS pracownik, m.last_name AS przelozony
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id
ORDER BY przelozony;

SELECT DISTINCT e.first_name, e.last_name, e.job_title
FROM employees e
JOIN sales s ON e.employee_id = s.employee_id;

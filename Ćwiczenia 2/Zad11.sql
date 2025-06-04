SELECT e.first_name, e.last_name, e.manager_id,
       m.last_name AS nazwisko_przelozonego
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;

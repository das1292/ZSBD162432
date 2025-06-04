SELECT first_name, last_name, salary, phone_number
FROM employees
WHERE LOWER(last_name) LIKE 'e%'
  AND LOWER(first_name) LIKE '%jennifer%'
ORDER BY first_name, last_name;

SELECT last_name, hire_date,
       ROUND(SYSDATE - hire_date) AS dni_pracy
FROM employees
ORDER BY dni_pracy DESC;

SELECT hire_date, last_name, job_id
FROM employees
WHERE job_id LIKE '%MAN%'
  AND EXTRACT(YEAR FROM hire_date) = 2005
ORDER BY job_id;

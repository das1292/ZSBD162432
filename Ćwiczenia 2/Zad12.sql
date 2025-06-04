SELECT department_id, COUNT(*) AS liczba_pracownikow
FROM employees
GROUP BY department_id
HAVING COUNT(*) > (
    SELECT AVG(cnt)
    FROM (
        SELECT COUNT(*) AS cnt
        FROM employees
        GROUP BY department_id
    )
);

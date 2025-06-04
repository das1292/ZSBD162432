CREATE VIEW v_statystyki_dzialu AS
SELECT d.department_id,
       d.department_name,
       COUNT(e.employee_id) AS liczba_pracownikow,
       AVG(e.salary) AS srednia_pensja,
       MAX(e.salary) AS najwyzsza_pensja
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.employee_id) >= 4;

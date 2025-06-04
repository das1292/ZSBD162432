CREATE VIEW v_finance_employees AS
SELECT employee_id, last_name, first_name
FROM employees
WHERE department_id = (
    SELECT department_id FROM departments WHERE department_name = 'Finance'
);

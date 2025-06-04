CREATE OR REPLACE VIEW v_wysokie_pensje AS
SELECT * FROM employees
WHERE salary > 12000;

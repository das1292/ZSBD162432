CREATE VIEW v_najlepiej_oplacani AS
SELECT * FROM (
    SELECT * FROM employees
    ORDER BY salary DESC
)
WHERE ROWNUM <= 10;

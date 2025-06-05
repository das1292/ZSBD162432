CREATE FUNCTION get_annual_salary(
    p_employee_id NUMBER
) RETURN NUMBER AS
    v_salary NUMBER;
    v_commission_pct NUMBER;
BEGIN
    SELECT salary, NVL(commission_pct,0) INTO v_salary, v_commission_pct
    FROM employees WHERE employee_id = p_employee_id;
    
    RETURN v_salary * 12 + (v_salary * v_commission_pct);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
END;
CREATE OR REPLACE PACKAGE pkg_dept_stats AS
  FUNCTION avg_salary(p_department_id NUMBER) RETURN NUMBER;
  PROCEDURE min_max_salary(p_job_id VARCHAR2, p_min_salary OUT NUMBER, p_max_salary OUT NUMBER);
  PROCEDURE generate_report(p_department_id NUMBER, p_report OUT CLOB);
END pkg_dept_stats;
/

CREATE OR REPLACE PACKAGE BODY pkg_dept_stats AS

  FUNCTION avg_salary(p_department_id NUMBER) RETURN NUMBER IS
    v_avg NUMBER;
  BEGIN
    SELECT AVG(salary) INTO v_avg FROM employees WHERE department_id = p_department_id;
    RETURN v_avg;
  END;

  PROCEDURE min_max_salary(p_job_id VARCHAR2, p_min_salary OUT NUMBER, p_max_salary OUT NUMBER) IS
  BEGIN
    SELECT MIN(salary), MAX(salary) INTO p_min_salary, p_max_salary
    FROM employees
    WHERE job_id = p_job_id;
  END;

  PROCEDURE generate_report(p_department_id NUMBER, p_report OUT CLOB) IS
    v_avg NUMBER;
    v_min NUMBER;
    v_max NUMBER;
  BEGIN
    v_avg := avg_salary(p_department_id);
    min_max_salary('IT_PROG', v_min, v_max); 

    p_report := 'Raport dla departamentu ' || p_department_id || CHR(10) ||
                'Średnia pensja: ' || TO_CHAR(v_avg) || CHR(10) ||
                'Min pensja (IT_PROG): ' || TO_CHAR(v_min) || CHR(10) ||
                'Max pensja (IT_PROG): ' || TO_CHAR(v_max);
  END;

END pkg_dept_stats;
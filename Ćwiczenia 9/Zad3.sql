CREATE OR REPLACE PACKAGE pkg_regions_ex AS
  ex_region_exists EXCEPTION;
  ex_region_in_use EXCEPTION;
  
  PROCEDURE add_region(p_region_name VARCHAR2);
  PROCEDURE delete_region(p_region_id NUMBER);
  PROCEDURE log_error(p_message VARCHAR2);
END pkg_regions_ex;
/

CREATE OR REPLACE PACKAGE BODY pkg_regions_ex AS

  PROCEDURE log_error(p_message VARCHAR2) IS
  BEGIN
    INSERT INTO audit_log(log_date, message) VALUES (SYSDATE, p_message);
  END;

  PROCEDURE add_region(p_region_name VARCHAR2) IS
    v_count NUMBER;
  BEGIN
    SELECT COUNT(*) INTO v_count FROM regions WHERE region_name = p_region_name;
    IF v_count > 0 THEN
      RAISE ex_region_exists;
    END IF;
    INSERT INTO regions(region_name) VALUES (p_region_name);
  EXCEPTION
    WHEN ex_region_exists THEN
      log_error('Dodanie regionu o istniejącej nazwie: ' || p_region_name);
      RAISE_APPLICATION_ERROR(-20010, 'Region o takiej nazwie już istnieje');
    WHEN OTHERS THEN
      log_error(SQLERRM);
      RAISE;
  END;

  PROCEDURE delete_region(p_region_id NUMBER) IS
    v_count NUMBER;
  BEGIN
    SELECT COUNT(*) INTO v_count FROM countries WHERE region_id = p_region_id;
    IF v_count > 0 THEN
      RAISE ex_region_in_use;
    END IF;
    DELETE FROM regions WHERE region_id = p_region_id;
  EXCEPTION
    WHEN ex_region_in_use THEN
      log_error('Usunięcie regionu z przypisanymi krajami: ' || p_region_id);
      RAISE_APPLICATION_ERROR(-20011, 'Region ma przypisane kraje i nie może być usunięty');
    WHEN OTHERS THEN
      log_error(SQLERRM);
      RAISE;
  END;

END pkg_regions_ex;
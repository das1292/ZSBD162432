CREATE OR REPLACE PACKAGE pkg_regions AS
  PROCEDURE add_region(p_region_name VARCHAR2);
  PROCEDURE update_region(p_region_id NUMBER, p_region_name VARCHAR2);
  PROCEDURE delete_region(p_region_id NUMBER);
  FUNCTION get_region_name(p_region_id NUMBER) RETURN VARCHAR2;
  FUNCTION get_region_id_by_name(p_region_name VARCHAR2) RETURN NUMBER;
  PROCEDURE list_regions(p_cursor OUT SYS_REFCURSOR);
END pkg_regions;
/

CREATE OR REPLACE PACKAGE BODY pkg_regions AS
  PROCEDURE add_region(p_region_name VARCHAR2) IS
  BEGIN
    INSERT INTO regions(region_name) VALUES (p_region_name);
  END;

  PROCEDURE update_region(p_region_id NUMBER, p_region_name VARCHAR2) IS
  BEGIN
    UPDATE regions SET region_name = p_region_name WHERE region_id = p_region_id;
  END;

  PROCEDURE delete_region(p_region_id NUMBER) IS
  BEGIN
    DELETE FROM regions WHERE region_id = p_region_id;
  END;

  FUNCTION get_region_name(p_region_id NUMBER) RETURN VARCHAR2 IS
    v_name VARCHAR2(50);
  BEGIN
    SELECT region_name INTO v_name FROM regions WHERE region_id = p_region_id;
    RETURN v_name;
  END;

  FUNCTION get_region_id_by_name(p_region_name VARCHAR2) RETURN NUMBER IS
    v_id NUMBER;
  BEGIN
    SELECT region_id INTO v_id FROM regions WHERE region_name = p_region_name;
    RETURN v_id;
  END;

  PROCEDURE list_regions(p_cursor OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN p_cursor FOR SELECT * FROM regions;
  END;
END pkg_regions;
/
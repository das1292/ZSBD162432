-- Tabela REGIONS
CREATE TABLE REGIONS (
    region_id NUMBER PRIMARY KEY,
    region_name VARCHAR2(50)
);

-- Tabela COUNTRIES
CREATE TABLE COUNTRIES (
    country_id CHAR(2) PRIMARY KEY,
    country_name VARCHAR2(50),
    region_id NUMBER,
    CONSTRAINT fk_country_region FOREIGN KEY (region_id) REFERENCES REGIONS(region_id)
);

-- Tabela LOCATIONS
CREATE TABLE LOCATIONS (
    location_id NUMBER PRIMARY KEY,
    street_address VARCHAR2(100),
    postal_code VARCHAR2(20),
    city VARCHAR2(50),
    state_province VARCHAR2(50),
    country_id CHAR(2),
    CONSTRAINT fk_location_country FOREIGN KEY (country_id) REFERENCES COUNTRIES(country_id)
);

-- Tabela DEPARTMENTS
CREATE TABLE DEPARTMENTS (
    department_id NUMBER PRIMARY KEY,
    department_name VARCHAR2(50),
    manager_id NUMBER,
    location_id NUMBER,
    CONSTRAINT fk_dept_location FOREIGN KEY (location_id) REFERENCES LOCATIONS(location_id)
);

-- Tabela JOBS
CREATE TABLE JOBS (
    job_id VARCHAR2(10) PRIMARY KEY,
    job_title VARCHAR2(50),
    min_salary NUMBER,
    max_salary NUMBER,
    CONSTRAINT chk_salary_range CHECK (min_salary < max_salary AND (max_salary - min_salary) >= 2000)
);

-- Tabela EMPLOYEES
CREATE TABLE EMPLOYEES (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(30),
    last_name VARCHAR2(30),
    email VARCHAR2(50),
    phone_number VARCHAR2(20),
    hire_date DATE,
    job_id VARCHAR2(10),
    salary NUMBER,
    commission_pct NUMBER(2,2),
    manager_id NUMBER,
    department_id NUMBER,
    CONSTRAINT fk_emp_job FOREIGN KEY (job_id) REFERENCES JOBS(job_id),
    CONSTRAINT fk_emp_manager FOREIGN KEY (manager_id) REFERENCES EMPLOYEES(employee_id),
    CONSTRAINT fk_emp_dept FOREIGN KEY (department_id) REFERENCES DEPARTMENTS(department_id)
);

-- Tabela JOB_HISTORY
CREATE TABLE JOB_HISTORY (
    employee_id NUMBER,
    start_date DATE,
    end_date DATE,
    job_id VARCHAR2(10),
    department_id NUMBER,
    CONSTRAINT pk_job_history PRIMARY KEY (employee_id, start_date),
    CONSTRAINT fk_jh_emp FOREIGN KEY (employee_id) REFERENCES EMPLOYEES(employee_id),
    CONSTRAINT fk_jh_job FOREIGN KEY (job_id) REFERENCES JOBS(job_id),
    CONSTRAINT fk_jh_dept FOREIGN KEY (department_id) REFERENCES DEPARTMENTS(department_id)
);

4. Create a row level trigger for the customers table that would fire for INSERT or UPDATE or DELETE operations performed on the CUSTOMERS table. This trigger will display the salary difference between the old & new Salary. CUSTOMERS (ID, NAME, AGE, ADDRESS, SALARY)

Step 1: Create the CUSTOMERS Table:

CREATE TABLE CUSTOMERS (
    ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(100),
    AGE NUMBER,
    ADDRESS VARCHAR2(200),
    SALARY NUMBER
);
Step 2: Create the Trigger:

CREATE OR REPLACE TRIGGER salary_difference_trigger
AFTER INSERT OR UPDATE OR DELETE
ON CUSTOMERS
FOR EACH ROW
DECLARE
    v_old_salary CUSTOMERS.SALARY%TYPE;
    v_new_salary CUSTOMERS.SALARY%TYPE;
    v_salary_diff CUSTOMERS.SALARY%TYPE;
BEGIN
    IF INSERTING THEN
        v_old_salary := 0;
        v_new_salary := :NEW.SALARY;
    ELSIF UPDATING THEN
        v_old_salary := :OLD.SALARY;
        v_new_salary := :NEW.SALARY;
    ELSIF DELETING THEN
        v_old_salary := :OLD.SALARY;
        v_new_salary := 0;
    END IF;

    v_salary_diff := v_new_salary - v_old_salary;

    DBMS_OUTPUT.PUT_LINE('Salary difference: ' || v_salary_diff);
END;
Step 3: Test the Trigger: Now, perform INSERT, UPDATE, and DELETE operations on the CUSTOMERS table to see the trigger in action.

Insert Operation:

INSERT INTO CUSTOMERS 
VALUES (1, 'Braham Kumar', 30, 'Bangalore', 8000);
Update Operation:

UPDATE CUSTOMERS
SET SALARY = 6000
WHERE ID = 1;
Delete Operation:

DELETE FROM CUSTOMERS
WHERE ID = 1;
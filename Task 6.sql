6. Write a PL/SQL block of code using parameterized Cursor, that will merge the data available in the newly created table N_RollCall with the data available in the table O_RollCall. If the data in the first table already exist in the second table then that data should be skipped.

Step 1: Create Table N_RollCall:

CREATE TABLE N_RollCall (
    id NUMBER,
    name VARCHAR2(100),
    roll_date DATE
);
Step 2: Insert data in N_RollCall Table:

INSERT INTO N_RollCall VALUES (1, 'Braham Kumar', '01-22-2015');
INSERT INTO N_RollCall VALUES (2, 'Shubham Kumar', '04-22-2016');
INSERT INTO N_RollCall VALUES (3, 'Bikash Singh', '05-22-2017');
Step 3: Create Table O_RollCall:

CREATE TABLE O_RollCall (
    id NUMBER,
    name VARCHAR2(100),
    roll_date DATE
);
Step 4: Insert data in O_RollCall Table:

INSERT INTO O_RollCall VALUES (4, 'Amit Singh', '01-22-2015');
INSERT INTO O_RollCall VALUES (5, 'Mukesh Kumar', '04-22-2016');
INSERT INTO O_RollCall VALUES (6, 'Abhay Singh', '05-22-2017');
Step 5: Write the PL/SQL Block:

DECLARE
    v_n_rollcall_id N_RollCall.id%TYPE;
    v_n_rollcall_name N_RollCall.name%TYPE;
    v_n_rollcall_date N_RollCall.roll_date%TYPE;
    
    CURSOR c_merge_rollcall_data IS
        SELECT id, name, roll_date
        FROM N_RollCall nrc
        WHERE NOT EXISTS (
            SELECT 1
            FROM O_RollCall orc
            WHERE orc.id = nrc.id
            AND orc.name = nrc.name
            AND orc.roll_date = nrc.roll_date
        );
BEGIN

    OPEN c_merge_rollcall_data;
    
    LOOP
        FETCH c_merge_rollcall_data INTO v_n_rollcall_id, v_n_rollcall_name, v_n_rollcall_date;
        EXIT WHEN c_merge_rollcall_data%NOTFOUND;
        
        INSERT INTO O_RollCall (id, name, roll_date)
        VALUES (v_n_rollcall_id, v_n_rollcall_name, v_n_rollcall_date);
    END LOOP;
    
    CLOSE c_merge_rollcall_data;
    
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Data merged successfully from N_RollCall to O_RollCall.');
EXCEPTION
    WHEN OTHERS THEN

        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK;
END;
Step 6: To see the output command:

SELECT * FROM O_RollCall;
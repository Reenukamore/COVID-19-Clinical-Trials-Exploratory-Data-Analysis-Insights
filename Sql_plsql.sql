CREATE TABLE covid(
    Rank NUMBER,
    NCT_Number VARCHAR2(50),
    Title VARCHAR2(500),
    Acronym VARCHAR2(100),
    Status VARCHAR2(50),
    Conditions VARCHAR2(500),
    Study_results VARCHAR2(50),
    Interventions VARCHAR2(500),
    Outcome_measures VARCHAR2(1000),
    Sponsor_collaborators VARCHAR2(500),
    Gender VARCHAR2(50),
    Age VARCHAR2(100),
    Phases VARCHAR2(50),
    Enrollment NUMBER,
    Funded_bys VARCHAR2(100),
    Study_type VARCHAR2(100),
    Study_designs VARCHAR2(1000),
    Other_ids VARCHAR2(200),
    Start_date VARCHAR2(50),
    Primary_completion_date VARCHAR2(50),
    Completion_date VARCHAR2(50),
    First_posted VARCHAR2(50),
    Results_first_posted VARCHAR2(50),
    Last_update_posted VARCHAR2(50),
    Locations VARCHAR2(1000),
    Study_documents VARCHAR2(500),
    URL VARCHAR2(500)
);
select * from covid;
----------------------------------------------------------------

--1.total studies
SELECT COUNT(*) AS total_studies
FROM covid;
-- Calculated the total number of clinical trials in the dataset. 
-------------------------------------
--2.Study Status Distribution
SELECT status, COUNT(*) AS total
FROM covid
GROUP BY status
ORDER BY total DESC;
--2. Analyzed how studies are distributed based on their current status.  
-----------------------------------------
--3.Top 10 Most Studied Conditions
SELECT *
FROM (
    SELECT conditions, COUNT(*) AS total
    FROM covid
    GROUP BY conditions
    ORDER BY total DESC
)
WHERE ROWNUM <= 10;
-------------------------------------------------
4. Studies by Phase
SELECT phases, COUNT(*) AS total
FROM covid
GROUP BY phases
ORDER BY total DESC;

--? 5. Average Enrollment (Handled Safely)
SELECT AVG(TO_NUMBER(enrollment)) AS avg_enrollment
FROM covid
WHERE REGEXP_LIKE(enrollment, '^[0-9]+$');

--? 6. Top Sponsors
SELECT *
FROM (
    SELECT sponsor_collaborators, COUNT(*) AS total
    FROM covid
    GROUP BY sponsor_collaborators
    ORDER BY COUNT(*) DESC
)
WHERE ROWNUM <= 10;

--? 7. Gender-Based Studies
SELECT gender, COUNT(*) AS total
FROM covid
GROUP BY gender
ORDER BY total DESC;

--? 8. Study Type Distribution
SELECT study_type, COUNT(*) AS total
FROM covid
GROUP BY study_type
ORDER BY total DESC;

--? 9. Year-wise Trend (Oracle Style)
SELECT 
    REGEXP_SUBSTR(start_date, '[0-9]{4}') AS year,
    COUNT(*) AS total
FROM covid
GROUP BY REGEXP_SUBSTR(start_date, '[0-9]{4}')
ORDER BY year;

------------------------------------------------------
--? 10. High Enrollment Completed Studies
SELECT title, TO_NUMBER(enrollment) AS enrollment
FROM covid
WHERE status = 'Completed'
AND REGEXP_LIKE(enrollment, '^[0-9]+$')
AND TO_NUMBER(enrollment) > 1000
ORDER BY enrollment DESC;

---------------------------------------------------------------------------------
set SERVEROUTPUT ON;
--1.? 1. Count Studies by Status (Using Cursor)
DECLARE
    CURSOR c_status IS
        SELECT status, COUNT(*) AS total
        FROM covid
        GROUP BY status;

    v_status covid.status%TYPE;
    v_total NUMBER;

BEGIN
    OPEN c_status;
    
    LOOP
        FETCH c_status INTO v_status, v_total;
        EXIT WHEN c_status%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Status: ' || v_status || ' | Total: ' || v_total);
    END LOOP;

    CLOSE c_status;
END;
/
-----------------------------------------------------------------------
--2. Find High Enrollment Studies
DECLARE
    v_title covid.title%TYPE;
    v_enroll NUMBER;

BEGIN
    FOR rec IN (
        SELECT title, TO_NUMBER(enrollment) AS enrollment
        FROM covid
        WHERE REGEXP_LIKE(enrollment, '^[0-9]+$')
        AND TO_NUMBER(enrollment) > 1000
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE('Study: ' || rec.title || 
                             ' | Enrollment: ' || rec.enrollment);
    END LOOP;
END;
/
----------------------------------------------------------

--3. Procedure: Get Studies by Phase
CREATE OR REPLACE PROCEDURE get_studies_by_phase(p_phase VARCHAR2)
IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM covid
    WHERE phases = p_phase;

    DBMS_OUTPUT.PUT_LINE('Total studies in ' || p_phase || ': ' || v_count);
END;
/

--execute
BEGIN
    get_studies_by_phase('Phase 3');
END;
/

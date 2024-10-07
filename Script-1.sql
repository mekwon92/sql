GRANT CREATE VIEW TO SAMPLE;

SELECT * FROM SAMPLE.STUDENT;

--AUDIT

-- SAMPLE이 HR의 EMPLOYEES의 셀렉트 할 수 있는 권한 부여
GRANT SELECT
ON HR.EMPLOYEES 
TO SAMPLE;

--다시 철회
REVOKE SELECT
ON HR.EMPLOYEES 
FROM SAMPLE;

--SAMPLE CREATE SYNONIM 권한 부여
GRANT CREATE PUBLIC SYNONYM
TO SAMPLE;

--전용동의어에서 공용동의어로
DROP PUBLIC SYNONYM STU;
CREATE PUBLIC SYNONYM STU FOR SAMPLE.STUDENT;

GRANT DBA
TO SAMPLE;

REVOKE DBA
FROM SAMPLE;
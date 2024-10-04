--2일차-------------------------------------------------------------------------------------------
--부서 테이블의 모든 정보 조회
SELECT *
FROM DEPARTMENT d ;

--부서 테이블의 특정 컬럼 조회(중복가능)
SELECT DEPTNO, COLLEGE 
FROM DEPARTMENT d ;

--201번이 아닌 학과별 학생수, 학생평균키 구하기
SELECT COUNT(*), AVG(HEIGHT) 
FROM STUDENT s 
WHERE DEPTNO != 201
GROUP BY DEPTNO ;

--그중 COUNT가 5 이상인....
SELECT COUNT(*), AVG(HEIGHT) 
FROM STUDENT s 
WHERE DEPTNO != 201
GROUP BY DEPTNO 
HAVING COUNT(*) >= 5;

--학생 역순정렬 후 학번 오름차순
SELECT * 
FROM STUDENT s
ORDER BY GRADE DESC, STUDNO ;
--학생 테이블의 학과번호 출력 (중복제거)
SELECT DISTINCT DEPTNO 
FROM STUDENT s ;
--SELECT DISTINCT DEPTNO, STUDNO 은 중복제거가 안됨(생각해보기)

--학생 테이블의 학과번호, 학년 (중복제거)
SELECT DISTINCT DEPTNO ,GRADE 
FROM STUDENT s ;

--부서테이블에서 부서이름은 "부서이름", 부서번호는 "부서 번호"라는 별명을 붙여서 조회
SELECT DNAME 부서이름, DEPTNO AS "부서 번호"
FROM DEPARTMENT d ;

--학생테이블에서 학번과 이름을 연결하여 STUDENT라는 별칭을 붙인 결과 조회
--1. || 이용해서
SELECT STUDNO || ' '||NAME STUDENT
FROM STUDENT s ;
--2. CONCAT 이용해서
SELECT CONCAT(STUDNO, CONCAT(' ', NAME)) STUDENT
FROM STUDENT s ;

--3일차-------------------------------------------------------------------------------------------
--WHERE 1=0; -- 결과가 TRUE FALSE(결과가 안나옴)
--EX_TYPE TABLE을 생성해라. C V N 3가지 칼럼이 나오고 CHAR과 VARVHAR은 7글자, N은 5칸에 2는 소수이하부분이다.
CREATE TABLE EX_TYPE (
	C CHAR(7),
	V VARVHAR(7),
	N NUMBER(5,2)
	);

--학생의 각 행에 부여된 일련번호를 5개만 출력하라
SELECT ROWID 
FROM STUDENT
WHERE ROWNUM <= 5;

--2학년 학생의 모든 정보를 출력하라
SELECT *
FROM STUDENT; 

--2학년 학생의 모든 정보와 일련번호를 출력하라
SELECT STUDENT.*,ROWID 
FROM STUDENT; 

--학생 테이블에서 1학년 학생의 학번 이름 학과번호 조회
SELECT STUDNO ,NAME, DEPTNO 
FROM STUDENT s 
WHERE GRADE = '1';

--학번 이름 학년 학과번호 몸무게 조회, 학생테이블에서 70kg이상
SELECT STUDNO ,NAME , GRADE , DEPTNO ,WEIGHT 
FROM STUDENT s 
WHERE WEIGHT >= 70;

--이름 학년 몸무게 학과번호 조회, 70kg 이상이면서 1학년 학생
SELECT NAME, GRADE, WEIGHT 
FROM STUDENT s 
WHERE WEIGHT >= 70 AND GRADE = 1;

--학번 이름 몸무게 출력 / 체중이 50이상 70 이하인 1학년 학생
SELECT STUDNO, NAME, WEIGHT 
FROM STUDENT s 
WHERE (WEIGHT BETWEEN 50 AND 70) AND GRADE = 1;

--이름 생년월일 출력 /81년에서 83년도에 태어난 학생
SELECT NAME, BIRTHDATE
FROM STUDENT s 
WHERE BIRTHDATE BETWEEN '81/01/01' AND '83,12,31';

--81년에서 83년도에 태어난 학생(타입 변경 후 IN 사용)
SELECT NAME, BIRTHDATE
FROM STUDENT s 
WHERE TO_CHAR(BIRTHDATE, 'YY') IN (81,82,83);

--이름 학년 학과번호 조회 / 102번,201번 학과만
SELECT NAME, GRADE ,DEPTNO 
FROM STUDENT s 
WHERE DEPTNO = 102 OR DEPTNO= 201;

SELECT NAME, GRADE ,DEPTNO 
FROM STUDENT s 
WHERE DEPTNO IN(102, 201);

--이름 학년 학과번호 조회/ 김씨만
SELECT NAME, GRADE, DEPTNO 
FROM STUDENT s 
WHERE NAME LIKE '김%';

--김0영
SELECT NAME, GRADE, DEPTNO 
FROM STUDENT s 
WHERE NAME LIKE '김_영';

--이름에 영을 포함
SELECT NAME, GRADE, DEPTNO 
FROM STUDENT s 
WHERE NAME LIKE '%영%';

--이름,직급,보직수당 조회 / 수당이 있는 교수
SELECT NAME, POSITION, COMM
FROM PROFESSOR p 
WHERE COMM IS NOT NULL;

SELECT * FROM PROFESSOR p ;

--이름,급여,수당,급여+수당 조회/ NVL이나 NVL2 이용
SELECT NAME , SAL, COMM, NVL(COMM,0)+SAL, NVL2(COMM,SAL+COMM,SAL)
FROM PROFESSOR p ;

--4일차-------------------------------------------------------------------------------------------
--학과번호 학생번호 이름 학년 조회 / 102번 학과 학생이면서 4학년이거나 1학년

SELECT DEPTNO ,STUDNO ,NAME ,GRADE 
FROM STUDENT s 
WHERE DEPTNO = 102 AND (GRADE = 4 OR GRADE = 1);

SELECT DEPTNO ,STUDNO ,NAME ,GRADE 
FROM STUDENT s 
WHERE 
	DEPTNO = 102 
	AND GRADE IN(1,4);

--1학년 학생 중 몸무게가 70KG 이상인 학생을 대상으로 STUD_HEAVY라는 새로운 테이블 생성
CREATE TABLE STUD_HEAVY AS
SELECT *
FROM STUDENT s 
WHERE WEIGHT >= 70 AND GRADE = 1;

--1학년 학생 중 학과번호가 101인 학생을 대상으로 STUD_101이라는 새로운 테이블 생성
CREATE TABLE STUD_101 AS
SELECT *
FROM STUDENT s 
WHERE GRADE = 1 AND DEPTNO = 101;

--UNION, UNION ALL을 활용해 학번 이름 조회(대상 테이블:STUD_HEAVY, STUD_101)
SELECT STUDNO, NAME
FROM STUD_HEAVY;

SELECT STUDNO, NAME
FROM STUD_101;


SELECT STUDNO, NAME
FROM STUD_HEAVY
UNION
SELECT STUDNO, NAME
FROM STUD_101;

SELECT STUDNO, NAME
FROM STUD_HEAVY
UNION ALL
SELECT STUDNO, NAME
FROM STUD_101;

--학생테이블에서 이름순으로 정렬 / 이름 학년 전화번호
SELECT NAME, GRADE, TEL
FROM STUDENT s 
ORDER BY NAME;

--학생테이블에서 학년을 내림차순으로 정렬/ 이름 학년 전화번호
SELECT NAME ,GRADE ,TEL
FROM STUDENT s 
ORDER BY GRADE DESC;

--학생테이블에서 학년을 내림차순으로 정렬/같은 학년일 경우 이름으로 정렬/ 이름 학년 전화번호
SELECT NAME, GRADE, TEL
FROM STUDENT s 
ORDER BY GRADE DESC, NAME;

--학생의 학번, 이름, 담당교수번호를 출력하라. 학번의 내림차순으로 정렬하라
SELECT STUDNO ,NAME ,PROFNO 
FROM STUDENT s 
ORDER BY 1 DESC; --1은 학번기준 3은 교수넘버기준

--학생의 학번, 이름을 출력하라. 교수번호의 내림차순으로 정렬하라

--학생의 담당교수번호의 내림차순/오름차순으로 정렬하고 NULL값을 확인하기
SELECT PROFNO 
FROM STUDENT s 
ORDER BY PROFNO DESC;

--학생의 이름, 아이디 조회, 아이디의 첫글자는 대문자, 소문자, 모든 글자 대문자로
SELECT NAME, INITCAP(USERID), LOWER(USERID), UPPER(USERID) 
FROM STUDENT s ;

--부서의 이름을 조회하고 이름의 길이와 바이트 개수를 조회
SELECT LENGTH(DNAME), LENGTHB(DNAME) 
FROM DEPARTMENT d ;

--1학년 학생들의 생년월일, 태어난 달을 조회(IDNUM 이용)
SELECT STUDNO , IDNUM , SUBSTR(IDNUM, 1, 6), SUBSTR(IDNUM, 3, 2)
FROM STUDENT s 
WHERE GRADE = '1';
--SUBSTR(대상컬럼,여기서부터,몇개자를게)

--학생의 전화번호 출력. 마지막 4글자를 *로 변경(02 주의)
SELECT TEL, SUBSTR(TEL, 1, INSTR(TEL,'-',1)) || '****' TEL
FROM STUDENT s ;

SELECT TEL, CONCAT(SUBSTR(TEL,1,INSTR(TEL,'-')),'****') TEL
FROM STUDENT s ;
--INSTR(대상컬럼,이거가나오는게,몇번째 이거를 원하니)

--교수의 직급의 왼쪽에 +기호를 추가하여 10글자로, 아이디의 오른쪽에 *를 추가하여 12글자로 조회
SELECT LPAD(POSITION, 10, '+'), RPAD(POSITION,12,'*') 
FROM PROFESSOR p ;

--부서테이블에서 부서이름의 마지막 '과'글자를 제거
SELECT RTRIM(DNAME,'과') 
FROM DEPARTMENT d ;

--교수테이블에서 일급계산(1달은 22일 가정)
--1. 소수점 첫째 자리에서 반올림&절삭
--2. 소수점 셋째 자리에서 반올림&절삭
--3. 십의자리로 반올림
SELECT ROUND(SAL / 22) ,
		ROUND(SAL / 22, 2),
		ROUND(SAL / 22, -1),
		TRUNC(SAL / 22 , 2)
FROM PROFESSOR p ;

--교수번호 9908교수님의 입사일 , 입사30일후, 입사60 일후의 날짜를 조회
SELECT HIREDATE , HIREDATE+30, HIREDATE+60
FROM PROFESSOR p 
WHERE PROFNO = 9908;

--태어난지 몇개월되었나
SELECT ROUND(MONTHS_BETWEEN(SYSDATE,'1992-10-9')) FROM DUAL; 

--입사한지 320개월 이전 교수들을 조회
--교수번호, 입사일, 입사일 + 6개월 후, 입사일로부터 현재까지의 개월 계산
SELECT 
	PROFNO , 
	HIREDATE , 
	ADD_MONTHS(HIREDATE,6) , 
	ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE)) 
FROM PROFESSOR p 
WHERE MONTHS_BETWEEN(HIREDATE,SYSDATE) < 320; 

--오늘이 속한 달의 마지막 날짜, 다가오는 일요일 조회
SELECT 
	LAST_DAY(SYSDATE),
	NEXT_DAY(SYSDATE,1),
--	NEXT_DAY(SYSDATE,'일요일')
FROM DUAL;

--현재시간을 조회 4시간전 , 반올림, 절삭처리(정오 시준)
SELECT 
	SYSDATE-4/24
	, ROUND(SYSDATE)
	, TRUNC(SYSDATE) 
FROM DUAL;

--현재시간을 반올림. 날짜, 월, 연, 시간,분으로 반올림
SELECT 
	ROUND(SYSDATE, 'DD') DAY,
	ROUND(SYSDATE, 'YY') YEAR,
	ROUND(SYSDATE, 'MM') MONTH,
	ROUND(SYSDATE, 'HH') HOUR,
	ROUND(SYSDATE, 'MI') MINUTE
FROM DUAL;

--5일차-------------------------------------------------------------------------------------------
--'2024 10월 05 월' 행식으로 102번 학과 학생의 생년월일 출력
SELECT BIRTHDATE ,TO_CHAR(BIRTHDATE, 'YYYY MONTH DD DAY') 
FROM STUDENT s 
WHERE DEPTNO = 102;

--보직수당을 받는 교수들을 대상으로 수당과 급여를 더한 값에 12를 곱하여 
--ANUAL이라는 이름으로 연봉 계산을 하고 세 자리마다 쉼표로 표시
--소수점 둘째자리까지 표시
SELECT TO_CHAR((SAL+COMM)*12,'9,999.99') ANUAL
FROM PROFESSOR p 
WHERE COMM IS NOT NULL;

--문자열 1234를 숫자 데이터로 변환하여라
--문자열 1,234를 숫자 데이터로 변환하여라
SELECT TO_NUMBER('1,234','9,999') 
FROM DUAL;

--학번, 이름, 학과를 출력한다.
--학과번호가
--101이면 컴퓨터 공학과
--102이면 멀티미디어학과
--201이면 전자공학과
--나머지 기계공학과 로 출력하고 컬럼이름을 DNAME으로 변경
SELECT 
	STUDNO,
	NAME,
	DECODE(DEPTNO,
		101, '컴퓨터공학과',
		102, '멀티미디어학과',
		201, '전자공학과',
		'기계공학과') DNAME 
FROM STUDENT s ;

--교수번호, 이름, 월급, 보너스를 출력한다.
--교수의 소속학과에 따라 보너스 지급, 
--101학과 급여의 10% 
--102학과 20%
--201학과 30%
--나머지 0%(2가지방법)
SELECT 
	PROFNO ,
	NAME ,
	SAL ,
	CASE DEPTNO 
		WHEN 101 THEN SAL * 0.1
		WHEN 102 THEN SAL * 0.2
		WHEN 201 THEN SAL * 0.3
		ELSE 0
	END BONUS
FROM PROFESSOR p ;

SELECT 
	PROFNO,
	NAME,
	SAL,
	CASE
		WHEN DEPTNO=101 THEN SAL*0.1
		WHEN DEPTNO=102 THEN SAL*0.2
		WHEN DEPTNO=201 THEN SAL*0.3
		ELSE 0
	END BONUS2
FROM PROFESSOR p ;

--교수의 인원수, 수당을 받는 인원수, 최대월급, 최소월급을 구하여라
SELECT COUNT(*), COUNT(COMM), MAX(SAL), MIN(SAL) 
FROM PROFESSOR p ;

--101학과 학생들의 몸무게 평균 합계 최대키 최소키
SELECT AVG(WEIGHT), SUM(WEIGHT), MAX(HEIGHT), MIN(HEIGHT)
FROM STUDENT s 
WHERE DEPTNO = 101;

--학년별로 몇명인지 구하여라(오름차순)
--SELECT에서 언급하려면 GROUP BY에 항상 명시
SELECT GRADE,COUNT(*)
FROM STUDENT s 
GROUP BY GRADE
ORDER BY 1;


--학년, 학과별 몇명인지 구하여라(학년, 학과 순으로 정렬)
SELECT GRADE , DEPTNO ,COUNT(*)
FROM STUDENT s 
GROUP BY GRADE, DEPTNO 
ORDER BY GRADE ,DEPTNO;

--학과변호별 교수의 인원수와 수당을 받는 인원수를 조회
--SELECT * 불가능
SELECT DEPTNO ,COUNT(*) ,COUNT(COMM)
FROM PROFESSOR p 
GROUP BY DEPTNO ;

--학과별로 소속 교수들의 최대급여, 최소급여
SELECT DEPTNO ,MAX(SAL), MIN(SAL)
FROM PROFESSOR p 
GROUP BY DEPTNO ;

--학생의 학과과 학년을 기준으로
--그룹하여 학과와 학년별 인원수와 평균체중을 구하고 반올림처리
--학과기준으로 정렬
SELECT DEPTNO, GRADE, COUNT(*), ROUND(AVG(WEIGHT))
FROM STUDENT s 
GROUP BY DEPTNO, GRADE
ORDER BY DEPTNO;

--학생의 생년월일을 기준으로 탄생 계절별 인원수구하기
SELECT 
	CASE TO_CHAR(ADD_MONTHS(BIRTHDATE, -2), 'Q')
	WHEN '1' THEN '봄'
	WHEN '2' THEN '여름'
	WHEN '3' THEN '가을'
	WHEN '4' THEN '겨울'
	END SEASON,
	COUNT(*)
FROM STUDENT s 
GROUP BY TO_CHAR(ADD_MONTHS(BIRTHDATE, -2), 'Q');

--	BIRTHDATE, 
--	TO_CHAR(BIRTHDATE , 'MM') , 
--	TO_CHAR(BIRTHDATE, 'Q'), 
--	TO_CHAR(ADD_MONTHS(BIRTHDATE, -2) , 'Q') 
--처음부터 GROUP BY 하지않아야됨~!


--ROLLUP : 부분합, 축 한방향(자주사용됨)
--CUBE : 부분합, 양측
----적은비용이 소모됨.

--296PAGE
--ROLL UP : 학과 및 직급별 교수 수, 학과별 교수 수, 전체 교수 수를 구하여라
SELECT DEPTNO ,POSITION ,COUNT(*)
FROM PROFESSOR p 
GROUP BY ROLLUP(DEPTNO, POSITION)
ORDER BY 1,2;

--ROLLUP과 똑같은 결과
SELECT DEPTNO ,POSITION ,COUNT(*) 
FROM PROFESSOR p 
GROUP BY DEPTNO ,POSITION
UNION
SELECT DEPTNO ,NULL, COUNT(*) 
FROM PROFESSOR p 
GROUP BY DEPTNO
UNION 
SELECT NULL, NULL, COUNT(*)
FROM PROFESSOR p 
ORDER BY 2;

--CUBE : 학과 및 직급별 교수 수, 학과별 교수 수, 전체 교수 수를 구하여라
SELECT DEPTNO ,POSITION ,COUNT(*)
FROM PROFESSOR p 
GROUP BY CUBE(DEPTNO, POSITION)
ORDER BY 1,2;

--GROUPING
SELECT DEPTNO ,POSITION ,COUNT(*), GROUPING(DEPTNO), GROUPING(POSITION)
FROM PROFESSOR p 
GROUP BY CUBE(DEPTNO, POSITION)
ORDER BY 1,2;

--학생수가 4명 이상인 학년에 대해 학생 평균 신장과 체중을 조회
SELECT COUNT(*) , ROUND(AVG(HEIGHT)) AVG_HEIGHT, ROUND(AVG(WEIGHT)) AVG_WEIGHT 
FROM STUDENT s 
GROUP BY GRADE 
HAVING COUNT(*)>=4 ;

--WHERE COUNT(*) >=4 그룹관련함수는 WHERE 위치에 올 수도 없다. 그룹에의한 조건이기때문에
--FROM > WHERE > GROUP > HAVING > SELECT > ORDER 순서로 진행된다
SELECT GRADE, COUNT(*) 
FROM STUDENT
WHERE DEPTNO = 101
GROUP BY GRADE
HAVING COUNT(STUDNO) >= 2 
ORDER BY GRADE;

--101학과가 아닌 학생들의 인원수 조회
SELECT DEPTNO, COUNT(*) 
FROM STUDENT s 
WHERE DEPTNO != 101
GROUP BY DEPTNO ;
--HAVING DEPTNO  != 101; 이거보다 WHERE 추천

--중첩함수
--학과별 학생의 평균 몸무게 중 최대 평균 몸무게를 구하여라
SELECT MAX(AVG(WEIGHT)) MAX_WEIGHT
FROM STUDENT s 
GROUP BY DEPTNO;

SELECT MAX(DEPTNO), MAX(AVG(WEIGHT)) --안됨 안맞음.
FROM STUDENT s 
GROUP BY DEPTNO ;

--학과별 학생 수가 최대 또는 최소인 학과의 학생 수를 구하여라
SELECT MAX(COUNT(*)),MIN(COUNT(*))
FROM STUDENT s 
GROUP BY DEPTNO ;

SELECT MAX(COUNT(STUDNO)),MIN(COUNT(STUDNO))
FROM STUDENT s 
GROUP BY DEPTNO ;

SELECT DEPTNO, COUNT(STUDNO)
FROM STUDENT s 
GROUP BY DEPTNO ;

SELECT DEPTNO, PROFNO, GRADE,COUNT(PROFNO), COUNT(GRADE)
FROM STUDENT s 
GROUP BY DEPTNO ,PROFNO ,GRADE 
ORDER BY 1;

--313PAGE

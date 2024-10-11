--6일차---------------------------------------------------------------------------------------------------
--학번, 이름, 학과번호, 학과이름을 출력하여라
SELECT STUDNO, S.DEPTNO ,DNAME
FROM STUDENT S, DEPARTMENT D
WHERE S.DEPTNO = D.DEPTNO ;

--INNER JOIN 사용
SELECT STUDNO, S.DEPTNO, DNAME
FROM STUDENT S
INNER JOIN DEPARTMENT D ON S.DEPTNO = D.DEPTNO;

--학생테이블과 부서 테이블을 카티션 곱 하여라
--학생이름,학과번호,학과이름,학과위치 출력
SELECT STUDNO, S.DEPTNO ,DNAME, LOC
FROM STUDENT S, DEPARTMENT D;
--CROSS JOIN 사용
SELECT STUDNO, S.DEPTNO ,DNAME, LOC
FROM STUDENT S CROSS JOIN DEPARTMENT D ;

--전인하 학생의 학번,이름,학과이름,학과위치를 조회
SELECT STUDNO, NAME, DNAME, LOC
FROM STUDENT s ,DEPARTMENT d 
WHERE S.DEPTNO = D.DEPTNO 
	AND NAME = '전인하';

--몸무게가 80KG 이상인 학생의 학번,이름,체중,학과이름,학과위치 조회
SELECT STUDNO, NAME, WEIGHT, DNAME, LOC
FROM STUDENT s ,DEPARTMENT d 
WHERE S.DEPTNO = D.DEPTNO 
	AND S.WEIGHT >= 80;

--1호관 소속 학생의 학번,이름,학과이름 조회
SELECT STUDNO, NAME, DNAME, LOC
FROM STUDENT s , DEPARTMENT d 
WHERE S.DEPTNO = D. DEPTNO 
	AND D.LOC = '1호관';

--EQUI JOIN을 사용하여 학번, 이름, 학과번호, 소속학과 이름, 학과위치 출력
SELECT STUDNO, NAME, S.DEPTNO , DNAME, LOC
FROM STUDENT s ,DEPARTMENT d 
WHERE S.DEPTNO = D.DEPTNO ;

--자연 조인을 사용하여 학번,이름,학과번호,학과이름 조회
SELECT STUDNO, NAME, DEPTNO ,DNAME 
FROM STUDENT
NATURAL JOIN DEPARTMENT;

--NATURAL JOIN, JOIN ~ USING, JOIN ~ ON을 사용 
--교수번호 교수 이름,학과 번호 학과 이름 조회
SELECT PROFNO, NAME, DEPTNO, DNAME
FROM PROFESSOR p 
NATURAL JOIN DEPARTMENT d ;

SELECT PROFNO, NAME, DEPTNO, DNAME
FROM PROFESSOR p 
JOIN DEPARTMENT d USING(DEPTNO);

SELECT PROFNO, NAME, P.DEPTNO, DNAME
FROM PROFESSOR p 
JOIN DEPARTMENT d ON(P.DEPTNO=D.DEPTNO);

--교수별 급여 등급을 조회
--대상테이블 :professor,salgrard NON EQUT 조인
SELECT PROFNO, NAME, SAL, GRADE
FROM PROFESSOR,SALGRADE
WHERE SAL BETWEEN LOSAL AND HISAL;

SELECT PROFNO, NAME, SAL, GRADE
FROM PROFESSOR p 
JOIN SALGRADE s --JOIN앞에 INNER생략 
ON SAL >= LOSAL AND SAL <= HISAL;

--학번,이름,교수번호,담당교수이름 조회
--PROFNO, NAME, DEPTNO 이렇게 같은 칼럼이라 NATURAL은 사용불가
--무엇을 사용해야할지 생각부터...
SELECT S.NAME, S.STUDNO ,P.NAME, PROFNO ,p.DEPTNO 
FROM STUDENT s 
JOIN PROFESSOR p USING(PROFNO);

--왜안되는겠니?
SELECT S.NAME, S.STUDNO, P.NAME, P.PROFNO ,DEPTNO 
FROM STUDENT s 
JOIN PROFESSOR p USING(DEPTNO);


--학번,이름,교수번호,담당교수이름 조회하는데 담당교수가 없는 학생도 출력
SELECT 
FROM STUDENT s 
LEFT JOIN PROFESSOR p ;


-- (+)
--탄생 월별 학생 숫자 구하기
--6개만 나오게 하기
--
--부서 테이블에서 상위 부서 이름을 출력하라 DEPARTMENT,SELF JOIN
--학생의 학번, 이름,담당교수의 교수번호,교수이름,학생의 소속학과이름을 조회
--단 모든 학생의 정보를 조회
--SELECT DEPTNO ,NAME,DNAME 
--서브쿼리(SELECT)
--학번 ,이름 ,학과번호,학과이름 조회

--7일차----------------------------------------------------------------------------------------------------
--사용자 아이디가 jun123인 학생과 같은 학년인 학생의 학번, 이름, 학년을 조회
--101번학과 학생들의 평균몸무게보다 적은 학생들의 학번, 학과번호, 몸무게를 조회
--20101번 학생과 학년이 같고, 키는 20101번 학생보다 큰 학생의 이름, 학년, 키를 출력하여라
--정보미디어학부에 소속된 학생의 학번, 이름, 학과번호 조회
--차근차근 안에있는거부터 하면됨. 함수처럼
--4학년 학생 중 키가 제일 작은 학생보다 키가 큰 학생의 학번, 이름, 키를 출력
--동일한 문제 MIN을 이용해서
--4학년 학생중에서 키가 가장 큰 학생보다 큰 학생의 학번, 이름, 키를 조회
--MAX이용
--보직수당을 받는 교수가 존재한다면 교수들의 교수번호, 이름, 급여, 수당, 급여+수당을 조회
--	WHERE COMM IS NOT NULL
--학년별 체중이 최소인 학생의 이름, 학년, 체중을 조회 PAIRWISE
--행개수를 예상하면서... UNPAIRWISE
--학년별 체중이 최소인 학생의 이름, 학년, 체중을 조회
--뭐가 추가되었을까 확인해보자..
--상호연관 서브쿼리. 눈으로 확인못하니까 비추천.. 다른방법사용..?
--학과별 평균 키보다 키가 큰 학생의 이름, 학과번호, 키를 출력
--
--달력만들기
--DML
--홍길동 데이터 입력
--학번 : 10110, 이름 : '홍길동', USERID : 'hong', GRADE : '1', IDNUM : '85101010101',
--BIRTHDATE : '85/10/10', TEL : '041)123-4567', HEIGHT : 170, WEIGHT : 70, DEPTNO : 101, PROFNO : 9903
--AUTO COMMIT -> MANUAL COMMIT으로 변경후 추가 여러번 함.
--트랜잭션 커밋 전에는 외부에서 알수없다.
--롤백하면 마지막 커밋 전으로 간다.
--예매할때 중요하게 쓰이는 개념임
--학과테이블에 DEPTNO : 300, DNAME: 생명공학부를 추가
--빈문자는 NULL로 취급된다.
--US_EN, UK_EN, KO
--날짜입력시에 TO_DATE 사용하는걸 추천함
--교수테이블에 날짜입력
--만약 삭제하고싶으면 WHERE을 사용
--SYSDATE를 넣으면 시분초 정보가 들어감..TRUNC로 자르면 일까지 들어감~!
--다중행입력은 별로안씀
--VALUES 대신 서브쿼리
--학생과 동일한 테이블 생성, 단 데이터 없음


--8일차-----------------------------------------------------------------------------------------------------
--2학년 이상의 학생, 
--HEIGHT_INFO에는 학번, 이름, 키, 
--WHEGHT_INFO에는 학번 이름 체중을 입력
--2학년 이상의 학생, 
--HEIGHT_INFO에는 학번, 이름, 키, 
--WHEGHT_INFO에는 학번 이름 체중을 입력
--INSERT ALL CONDITIONAL
--HEIGHT_INFO에는 170이상만
--WEIGIT_INFO에는 70이상만
--PIVOTING
--다시 변경. 행은 줄고 컬럼은 늘어난다. 어렵;;
--이걸 또 다시 변경...??????????!!!!!!!!!!!!-0-....
--UPDATE 1문제나옴
--교수번호가 9903인 교수의 직급을 부교수로 수정
--교수번호가 9903인 교수의 데이터 변경
--직급을 전임교수, 아이디를 'littlePascal',급여를 20올린 데이터로 수정
--서브쿼리를 이용하여 학번이 10201인 학생의 학년과 학과 번호를 103학번 학생의 학년과 학과 번호와 동일하게 수정
--컴퓨터공학과 소속 학생 데이터 삭제
--다시 테이블 만드는 방법
--PROFESSOR_TEMP 테이블 생성, 교수 직급만 가져와서 생성
--MERGE 하려고하는데 교수2명 겹침- UPDATE 김도경은 INSERT로 처리
--외울필요없음
--SEQUENCE
--게시판용 테이블 생성
--SEQ_BOARD에는 다음값, 현재값
--연속적인 숫자를 보고싶을 때
--기본키는 NOT NULL이라 불가능
--중복도 불가능

--315PAGE
--학번, 이름, 학과번호, 학과이름을 출력하여라

--학생테이블과 부서 테이블을 카티션 곱 하여라
--학생이름,학과번호,학과이름,학과위치 출력

--전인하 학생의 학번,이름,학과이름,학과위치를 조회

--몸무게가 80KG 이상인 학생의 학번,이름,체중,학과이름,학과위치 조회

--1호관 소속 학생의 학번,이름,학과이름 조회

--EQUI JOIN을 사용하여 학번, 이름, 학과번호, 소속학과 이름, 학과위치 출력

--자연 조인을 사용하여 학번,이름,학과번호,학과이름 조회

--NATURAL JOIN, JOIN ~ USING, JOIN ~ ON을 사용 
--교수번호 교수 이름,학과 번호 학과 이름 조회

--교수별 급여 등급을 조회
--대상테이블 :PROFESSOR, SALGRADE

--학번,이름,교수번호,담당교수이름 조회

--학번,이름,교수번호,담당교수이름 조회하는데 담당교수가 없는 학생도 출력

--부서 테이블에서 상위 부서 이름을 출력하라 DEPARTMENT,SELF JOIN

--학생의 학번, 이름,담당교수의 교수번호,교수이름,학생의 소속학과이름을 조회
--단 모든 학생의 정보를 조회

--출제예정
--4학년 학생 중 키가 제일 작은 학생보다 키가 큰 학생의 학번, 이름, 키를 출력

--동일한 문제 MIN을 이용해서

--4학년 학생중에서 키가 가장 큰 학생보다 큰 학생의 학번, 이름, 키를 조회

--MAX이용

--교수들의 교수번호, 이름, 급여, 수당, 급여+수당을 조회
--보직수당을 받지않는 교수도 포함

--학년별 체중이 최소인 학생의 이름, 학년, 체중을 조회

--학과별 평균 키보다 키가 큰 학생의 이름, 학과번호, 키를 출력

--학번 ,이름 ,학과이름, 교수이름 조회


--학생에 홍길동 데이터 입력
--학번 : 10110, 이름 : '홍길동', USERID : 'hong', GRADE : '1', IDNUM : '85101010101',
--BIRTHDATE : '85/10/10', TEL : '041)123-4567', HEIGHT : 170, WEIGHT : 70, DEPTNO : 101, PROFNO : 9903


--학과테이블에 DEPTNO : 300, DNAME: 생명공학부를 추가

--방금 작성한 행만 삭제

--교수 테이블에 (PROFNO, NAME, POSITION, HIREDATE, DEPTNO)에 (9920, '최윤식', '조교수', '2006-01-01', 102) 입력

--방금 작성한 행만 삭제

--교수 테이블에 9910, '백미선', 'white', '전임강사', 200, 현재시간, 10, 101 입력

--방금 작성한 행만 삭제

--STUDENT에서 학번, 이름, 키를 가져와 HEIGHT_INFO 테이블을 만들어라

-- 그 행의 내용 제거

--STUDENT에서 학번, 이름, 키를 가져와 WEIGHT_INFO 테이블을 만들어라

-- 그 행의 내용 제거

--2학년 이상의 학생, 
--HEIGHT_INFO에는 학번, 이름, 키, 
--WHEGHT_INFO에는 학번 이름 체중을 입력

--2학년 이상의 학생, 
--HEIGHT_INFO에는 학번, 이름, 키, 
--WHEGHT_INFO에는 학번 이름 체중을 입력
--HEIGHT_INFO에는 170이상
--WEIGIT_INFO에는 70이상
--(중복가능)

--2학년 이상의 학생, 
--HEIGHT_INFO에는 학번, 이름, 키, 
--WHEGHT_INFO에는 학번 이름 체중을 입력
--HEIGHT_INFO에는 170이상
--WEIGIT_INFO에는 70이상
--(중복되는 경우 HEIGHT_INFO에만 입력)

--강좌 테이블 생성(subject)
--SUBNO 번호 PK
--SUBNAME 이름 NN
--TERM 학기(1,2) 
--TYPE 필수 여부 CHAR(1)

--STUDENT TABLE에서 STUDNO에 PK

----SUGANG 테이블 생성
--STUDNO는 STUDENT의 STUDNO을 외래키로
--SUBNO은 숫자 타입
--REGDATE는 데이터타입
--RESULT는 3자리 숫자 타입
--SUBNO은 SUBJECT의 SUBNO을 외래키로
--SUGANG의 PK는 (STUDNO,SUBNO)
CREATE TABLE SUGANG(
	STUDNO CONSTRAINT SUGANG_STUD_FK REFERENCES STUDENT,
	SUBNO CONSTRAINT SUGANG_SUB_FK REFERENCES SUBJECT,
	CONSTRAINT SUGANG_PK PRIMARY KEY(STUDNO,SUBNO);
);

--학과 테이블에 제약조건 넣기
--PK:DEPTNO, DNAME: NN, COLLEGE <> DEPTNO PK
ALTER TABLE DEPARTMENT MODIFY(DEPTNO PRIMARY KEY);

--학생 테이블에 제약조건 넣기
--PK:STUDNO, NAME:NN, USERID:UNIQUE, DEPARTMENT.DEPTNO : FK , PROFESSOR.PROFNO : FK

--교수 테이블에 제약조건 넣기
--PK:PROFNO, 이름:NN, 아이디 : UNIQUE

--학번, 이름, 학과번호를 이용하여 뷰를 생성하라

--학번, 이름, 학과번호, 학과이름으로 VIEW_STUD_DEPT라는 뷰 생성

--학과별 인원수를 조회하여 VIEW_STUD_DEPT2 라는 VIEW 생성(DNO, CNT 명명)
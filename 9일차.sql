--466page 노션작성하기
--주소록 테이블 생성
--id varchar(100), name varchar(100)

 CREATE  TABLE ADDR (
 	ID VARCHAR2(100),
 	NAME VARCHAR2(100)
 );
--주소록에 컬럼추가 birth date
--위치지정 불가능하고 마지막 부분에 생성된다.
--추가된 칼럼에도 기본 값을 지정 할 수 있다.
--수정할 테이블에 기존 데이터가 존재하면 칼럼 값은 NULL
ALTER TABLE ADDR ADD (BIRTH DATE);

SELECT * FROM ADDR;

--주소록에 COMMENTS 칼럼 추가, VARCHAR(200) 기본값 'NO COMMENT'
ALTER TABLE ADDR ADD (COMMENTS VARCHAR2(200) DEFAULT 'NO COMMENT' );

INSERT INTO ADDR (ID) VALUES ('id1');

--주소록에  COMMENTS 칼럼 삭제
ALTER TABLE ADDR DROP (COMMENTS);

--MODIFY 테이블에서 칼럼의 타입, 크기, 기본값 변경 가능
--기존 칼럼에 데이터가 없는 경우 : 자유로움
--기존 데이터가 존재하는 경우 : CHAR, VARCHAR만 허용

--주소록 ID 컬럼의 크기를 1BYTE로 변경
ALTER TABLE ADDR MODIFY ID VARCHAR(1); --불가능
ALTER TABLE ADDR MODIFY ID VARCHAR(10); --가능

--ADDR 테이블 이름을 ADDR2로 변경
RENAME ARRD2 TO ADDR2;
SELECT * FROM ADDR; --불가능
SELECT * FROM ADDR2;

--생성된 인덱스, 관련 뷰, 동의어 invalid 상태
--삭제할 테이블의 기본키나 고유키를 다른 테이블에서 참조하는 경우 삭제 불가능
----1.참조하는 테이블(자식 테이블을) 먼저 삭제
----2.CASCADE CONSTRAINTS 옵션을 삭제하여 무결성 제약조건을 동시에 삭제. 자식이랑 연결이 끊어짐?!
------CASCADE : 수직적인 형태의 상하흐름. 상명하복(조심해서써야됨) 
DROP TABLE ADDR2; --제약조건, 인덱스 등 까지 모두 삭제해서 불편함.

--TRUNCATE : 테이블 구조는 그대로 유지하고 테이블의 데이터와 할당된 공간만 삭제
----DELETE : ROLLBACK 가능
-------------WHERE절 이용해 특정 행만 삭제 가능. TRGGER 등으로 인해 느림.

----TRUNCATE : 데이터 삭제 뿐 아니라 물리적인 저장 공간까지 반환. 빠름
---------------DDL문이라 ROLLBACK이 불가능하다. 

--주석추가 : 프로젝트 시 필요.
--ADDR2 테이블에다가 '주소록'이라는 COMMENT 추가
COMMENT ON TABLE ADDR2 IS '주소록';

--ADDR2의 NAME 컬럼에 '이름'이라는 COMMENT 추가
COMMENT ON COLUMN ADDR2.NAME IS '이름';


--컬럼레벨에서 제약조건 정의
--제약조건은 defer를 걸수있다.. defer(지연)

--테이블 레벨에서 제약조건 정의(컬럼레벨 제약조건을 추천)
--열조합기본키는 반드시 테이블레벨에서.....흙..어렵다....

--강좌 테이블 생성(subject)
--SUBNO 번호
--SUBNAME 이름
--TERM 학기(1,2)
--TYPE 필수 여부 CHAR(1)

CREATE TABLE SUBJECT(
	SUBNO NUMBER CONSTRAINT SUBJECT_PK PRIMARY KEY,
	SUBNAME VARCHAR(200) CONSTRAINT SUBNAME_NN NOT NULL,
	TERM CHAR(1) CONSTRAINT TERM_CK CHECK (TERM IN ('1','2')),
	TYPE CHAR(1)
);

--테이블?
ALTER TABLE STUDENT ADD CONSTRAINT STUDENT_PK PRIMARY KEY(STUDNO);	


--533page
--제약조건거는거 시험문제 나옴.. 수강테이블인스턴스가 주어지는........
--열조합PK는 열레벨로 선언하는게 아니라 테이블,,?

CREATE TABLE SUGANG (	
	STUDNO CONSTRAINT SUGANG_STUDNO_FK REFERENCES STUDENT, --컬럼명이똑같으면 생략가능. STUDENT.STUDNO
	SUBNO NUMBER,
	REGATE DATE,
	RESULT NUMBER(3),
	CONSTRAINT SUGANG_SUBNO_FK FOREIGN KEY(SUBNO) REFERENCES SUBJECT(SUBNO), --테이블레벨로 선언..길다..
	CONSTRAINT SUGANG_PK PRIMARY KEY(STUDNO, SUBNO) --순서 잘 기억..?
);

--부모 : unique, ~ .
--제약을 생성시 거는게 아니라 나중에 거는 것? 
--학과 테이블에 제약조건 넣기
--PK:DEPTNO, DNAME: NN, COLLEGE <> DEPTNO PK
ALTER TABLE DEPARTMENT MODIFY (DEPTNO CONSTRAINT DEPARTMENT_PK PRIMARY KEY);
--이름은 PK랑...~만 주는.. 보통.....?
ALTER TABLE DEPARTMENT MODIFY (DNAME NOT NULL);
ALTER TABLE DEPARTMENT MODIFY (COLLEGE REFERENCES DEPARTMENT(DEPTNO));
--DEPTNO가 바라볼 대상이고 COLLEGE ..... 노드기준.....

--교수 테이블에 제약조건 넣기
--PK, 이름 NN, 아이디 UNIQUE
ALTER TABLE PROFESSOR ADD CONSTRAINT PROFESSOR_PK PRIMARY KEY(PROFNO);
--NN은 테이블레벨에서 불가능~?!
ALTER TABLE PROFESSOR MODIFY (NAME NOT NULL);
ALTER TABLE PROFESSOR ADD CONSTRAINT PROF_USERID_UK UNIQUE(USERID);
ALTER TABLE PROFESSOR ADD FOREIGN KEY(DEPTNO) REFERENCES DEPARTMENT ;

SELECT * FROM STUDENT s ;
--학생
--이름 NN, 아이디 UNIQUE, 주민번호 UNIQUE, FK DEPTNO, FK PROFNO
ALTER TABLE STUDENT MODIFY (NAME NOT NULL);
ALTER TABLE STUDENT MODIFY (USERID CONSTRAINT STUD_USERID_UK UNIQUE); --COLUNM 레벨
--ALTER TABLE STUDENT ADD CONSTRAINT STUD_USERID_UK UNIQUE(USERID); --TABLE 레벨
ALTER TABLE STUDENT ADD CONSTRAINT STUD_IDNUM_UK UNIQUE(IDNUM);
ALTER TABLE STUDENT MODIFY (DEPTNO REFERENCES DEPARTMENT);
--ALTER TABLE STUDENT ADD FOREIGN KEY(DEPTNO) REFERENCES DEPARTMENT;
ALTER TABLE STUDENT ADD FOREIGN KEY(PROFNO) REFERENCES PROFESSOR;

SELECT * FROM PROFESSOR p ;




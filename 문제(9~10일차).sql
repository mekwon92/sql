--9일차

--466page 노션작성하기
--주소록 테이블 생성
--id varchar(100), name varchar(100)
--주소록에 컬럼추가 birth date
--위치지정 불가능하고 마지막 부분에 생성된다.
--추가된 칼럼에도 기본 값을 지정 할 수 있다.
--수정할 테이블에 기존 데이터가 존재하면 칼럼 값은 NULL
--주소록에 COMMENTS 칼럼 추가, VARCHAR(200) 기본값 'NO COMMENT'
--주소록에  COMMENTS 칼럼 삭제
--MODIFY 테이블에서 칼럼의 타입, 크기, 기본값 변경 가능
--기존 칼럼에 데이터가 없는 경우 : 자유로움
--기존 데이터가 존재하는 경우 : CHAR, VARCHAR만 허용
--주소록 ID 컬럼의 크기를 1BYTE로 변경
--ADDR 테이블 이름을 ADDR2로 변경
--생성된 인덱스, 관련 뷰, 동의어 invalid 상태
--삭제할 테이블의 기본키나 고유키를 다른 테이블에서 참조하는 경우 삭제 불가능
----1.참조하는 테이블(자식 테이블을) 먼저 삭제
----2.CASCADE CONSTRAINTS 옵션을 삭제하여 무결성 제약조건을 동시에 삭제. 자식이랑 연결이 끊어짐?!
------CASCADE : 수직적인 형태의 상하흐름. 상명하복(조심해서써야됨) 
--TRUNCATE : 테이블 구조는 그대로 유지하고 테이블의 데이터와 할당된 공간만 삭제
----DELETE : ROLLBACK 가능
-------------WHERE절 이용해 특정 행만 삭제 가능. TRGGER 등으로 인해 느림.
----TRUNCATE : 데이터 삭제 뿐 아니라 물리적인 저장 공간까지 반환. 빠름
---------------DDL문이라 ROLLBACK이 불가능하다. 
--주석추가 : 프로젝트 시 필요.
--ADDR2 테이블에다가 '주소록'이라는 COMMENT 추가
--ADDR2의 NAME 컬럼에 '이름'이라는 COMMENT 추가
--컬럼레벨에서 제약조건 정의
--제약조건은 defer를 걸수있다.. defer(지연)
--테이블 레벨에서 제약조건 정의(컬럼레벨 제약조건을 추천)
--열조합기본키는 반드시 테이블레벨에서.....흙..어렵다....
--강좌 테이블 생성(subject)
--SUBNO 번호
--SUBNAME 이름
--TERM 학기(1,2)
--TYPE 필수 여부 CHAR(1)
ALTER TABLE STUDENT ADD CONSTRAINT STUDENT_PK PRIMARY KEY(STUDNO); 
--테이블?
--533page
--제약조건거는거 시험문제 나옴.. 수강테이블인스턴스가 주어지는........
----SUGANG 테이블 생성
--STUDNO는 STUDENT의 STUDNO을 외래키로
--SUBNO은 숫자 타입
--REGDATE는 데이터타입
--RESULT는 3자리 숫자 타입
--SUBNO은 SUBJECT의 SUBNO을 외래키로
--SUGANG의 PK는 (STUDNO,SUBNO)
--열조합PK는 열레벨로 선언하는게 아니라 테이블,,?
--부모 : unique, ~ .
--제약을 생성시 거는게 아니라 나중에 거는 것? 
--학과 테이블에 제약조건 넣기
--PK:DEPTNO, DNAME: NN, COLLEGE <> DEPTNO PK
--이름은 PK랑...~만 주는.. 보통.....?
--DEPTNO가 바라볼 대상이고 COLLEGE ..... 노드기준.....
--교수 테이블에 제약조건 넣기
--PK, 이름 NN, 아이디 UNIQUE
--NN은 테이블레벨에서 불가능~?!
--학생
--이름 NN, 아이디 UNIQUE, 주민번호 UNIQUE, FK DEPTNO, FK PROFNO
--ALTER TABLE STUDENT ADD CONSTRAINT STUD_USERID_UK UNIQUE(USERID); --TABLE 레벨
--ALTER TABLE STUDENT ADD FOREIGN KEY(DEPTNO) REFERENCES DEPARTMENT;

--10일차

--인덱스 생성에 ROWID 사용됨
--DEPARTMENT 테이블 DNAME에 고유 인덱스 생성
--인덱스이름은 헝가리안표기법
--ctrl+shift+e : 실행계획보기
--힌트 : 옵티마이저에게 직접 실행 경로를 작성해 주는 것 (학과이름 오름차순)
--INDEX DESC를 PK에 거는 형태로 많이 사용됨?!
--STUDENT BIRTHDATE에 비고유 인덱스 생성
--STUDENT 테이블의 DEPTNO, GRADE에 결합 인덱스 생성
--SELECT DISTINCT GRADE, DEPTNO FROM STUDENT s ; 
--중복된값이 있어서 UNIQUE 불가능
-- 뷰 생성(SYSTEM에서 권한부여 필요)
--FROM절 서브쿼리와 동일한 결과
--ALTER 대신 CREATE OR REPLACE 사용
--VIEW에만 추가된게 아니라 학생 테이블에도 추가됨
--오탈자가 있어도 강제적으로 처리하는 경우
--학번, 이름, 학과번호, 학과이름으로 VIEW_STUD_DEPT라는 뷰 생성
--복합뷰 : 조회는 가능하지만 DML처리는 안됨.
-- 11111, 고길동, 101, 컴퓨터 공학과
--학과별 인원소를 조회하여 VIEW_STUD_DEPT2 라는 VIEW 생성
--인라인 뷰,,,
--한페이지에 몇개씩? 10개!
--RANGE SCAN(범위설정)이 FULL SCAN보다 빠름.
--왜 NO처리가 안되는걸까,,,,,,???
-- 가독성이 더 좋은 방법
--FILE SYSTEM
--FILE의 권한
--동의어. 별칭과 비슷. 객체로 저장됨
--테이블이나 뷰에도 적용 가능
--데이터 사전
-- 접두어 : USER_ ALL_ DBA_
--P : primary C : check R :relational

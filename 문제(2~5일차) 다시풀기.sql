----201번이 아닌 학과별 학생수, 학생평균키 구하기 다만 학생수가 5이상인..

--학생 역순정렬 후 학번 오름차순

--학생 테이블의 학과번호, 학년 (중복제거)

--부서테이블에서 부서이름은 "부서이름", 부서번호는 "부서 번호"라는 별명을 붙여서 조회

--학생테이블에서 학번과 이름을 연결하여 STUDENT라는 별칭을 붙인 결과 조회(2가지 방법 이용)

--EX_TYPE TABLE을 생성해라. C V N 3가지 칼럼이 나오고 각 순서대로 
--CHAR과 VARVHAR은 7글자, N은 5칸에 2는 소수이하부분이다.

--현재시간 출력 테이블을 만들어라

--학생의 각 행에 부여된 일련번호를 5개만 출력하라

--2학년 학생의 모든 정보를 출력하라

--2학년 학생의 모든 정보와 일련번호를 출력하라

--학생 테이블에서 1학년 학생의 학번 이름 학과번호 조회

--학번 이름 학년 학과번호 몸무게 조회, 학생테이블에서 70kg이상

--이름 학년 몸무게 학과번호 조회, 70kg 이상이면서 1학년 학생

--학생테이블에서 학번과 이름을 연결하여 STUDENT라는 별칭을 붙인 결과 조회

--학번 이름 몸무게 출력 / 체중이 50이상 70 이하인 1학년 학생

--이름 생년월일 출력 /81년에서 83년도에 태어난 학생

--81년에서 83년도에 태어난 학생(타입 변경 후 IN 사용)

--이름 학년 학과번호 조회 / 102번,201번 학과만(IN 사용)

--이름 학년 학과번호 조회/ 김씨만

--이름 학년 학과번호 조회/ 김0영

--이름 학년 학과번호 조회/ 이름에 0을 포함하는 경우만

--이름,직급,보직수당 조회 / 수당이 있는 교수

--이름,급여,수당,급여+수당 조회/NVL이나 NVL2 이용

--학과번호 학생번호 이름 학년 조회 / 102번 학과 학생이면서 4학년이거나 1학년

--1학년 학생 중 몸무게가 70KG 이상인 학생을 대상으로 STUD_HEAVY라는 새로운 테이블 생성

--1학년 학생 중 학과번호가 101인 학생을 대상으로 STUD_101이라는 새로운 테이블 생성

--두 테이블을 UNION, UNION ALL을 이용해서 합치고 결과확인

----학생테이블에서 이름순으로 정렬 / 이름 학년 전화번호

--학생테이블에서 학년을 내림차순으로 정렬/ 이름 학년 전화번호

--학생테이블에서 학년을 내림차순으로 정렬/같은 학년일 경우 이름으로 정렬/ 이름 학년 전화번호

--학생의 학번, 이름, 담당교수번호를 출력하라. 학번의 내림차순으로 정렬하라

--학생의 담당교수번호의 내림차순/오름차순으로 정렬하고 NULL값을 확인하기

--학생의 이름, 아이디 조회, 아이디의 첫글자는 대문자, 소문자, 모든 글자 대문자로

--부서의 이름을 조회하고 이름의 길이와 바이트 개수를 조회

--1학년 학생들의 생년월일, 태어난 달을 조회(IDNUM을 이용해서)

--학생의 전화번호 출력(단 마지막 4글자를 *로 변경)

--교수의 직급의 왼쪽에 +기호를 추가하여 10글자로, 아이디의 오른쪽에 *를 추가하여 12글자로 조회

--부서테이블에서 부서이름의 마지막 '과'글자를 제거

--교수테이블에서 일급계산(1달은 22일 가정)
--1. 소수점 첫째 자리에서 반올림&절삭
--2. 소수점 셋째 자리에서 반올림&절삭
--3. 십의자리로 반올림

--교수번호 9908교수님의 입사일 , 입사30일후, 입사60 일후의 날짜를 조회

--태어난지 몇개월되었나

--입사한지 320개월 이전 교수들을 조회 
--교수번호, 입사일, 입사일 + 6개월 후, 입사일로부터 현재까지의 개월 계산

--오늘이 속한 달의 마지막 날짜, 다가오는 일요일 조회

--현재시간을 조회 4시간전 , 반올림, 절삭처리(정오 시준)

--현재시간을 반올림. 날짜, 월, 연, 시간,분으로 반올림

--'2024 10월 05 월' 행식으로 102번 학과 학생의 생년월일 출력

--보직수당을 받는 교수들을 대상으로 수당과 급여를 더한 값에 12를 곱하여 
--ANUAL이라는 이름으로 연봉 계산을 하고 세 자리마다 쉼표로 표시
--소수점 둘째자리까지 표시

--문자열 1234를 숫자 데이터로 변환하여라
--문자열 1,234를 숫자 데이터로 변환하여라

--학번, 이름, 학과를 출력한다.
--학과번호가
--101이면 컴퓨터 공학과
--102이면 멀티미디어학과
--201이면 전자공학과
--나머지 기계공학과 로 출력하고 컬럼이름을 DNAME으로 변경

--교수번호, 이름, 월급, 보너스를 출력한다.
--교수의 소속학과에 따라 보너스 지급, 
--101학과 급여의 10% 
--102학과 20%
--201학과 30%
--나머지 0%(2가지방법)

--교수의 인원수, 수당을 받는 인원수, 최대월급, 최소월급을 구하여라

--101학과 학생들의 몸무게 평균 합계 최대키 최소키

--학년별로 몇명인지 구하여라(오름차순)
--SELECT에서 언급하려면 GROUP BY에 항상 명시

--학년, 학과별 몇명인지 구하여라(학년, 학과 순으로 정렬)

--학과변호별 교수의 인원수와 수당을 받는 인원수를 조회

--학과별로 소속 교수들의 최대급여, 최소급여

--학생의 학과과 학년을 기준으로
--그룹하여 학과와 학년별 인원수와 평균체중을 구하고 반올림처리
--학과기준으로 정렬

--학생의 생년월일을 기준으로 탄생 계절별 인원수구하기

























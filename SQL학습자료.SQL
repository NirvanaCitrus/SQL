-- MySQL SQL 학습
1. DDL 언어 학습하기
1-1.
CREATE 문
CREATE TABLE 테이블 이름(
       컬럼이름 컬럼타입 컬럼크기 null여부 컬럼기본값 제약조건,
);

-- 회원테이블 MEMBER를 생성하고 다음과 같은 각 회원정보를 등록하세요
-- 회원번호 midx 타입은 숫자형, null 은 허용하지 않음, 주요키(primary key) 등록
-- 회원아이디 memberid 타입은 문자형, 크기 100byte null 허용 안함
-- 회원비밀번호 memberpwd 타입은 문자형, 크기 100byte null 허용 안함
-- 회원이름 membername 타입은 문자형, 크기는 100byte, null 허용 안함
-- 회원성별 membergender 타입은 문자형 크기는 1byte, null 허용 안함 (남성은 M, 여성은 F)
-- 회원생년월일 memberbirth 타입은 숫자형 크기는 8byte, null 허용 안함
-- 회원주소 memberaddr 타입은 문자형 크기는 10byte, null 허용
-- 회원전화 memeberphone 타입은 문자형, 크기는 20byte null 허용
-- 회원이메일 memberemail 타입은 문자형 크기는 100byte, null 허용
-- 회원취미 memberhobby 타입은 문자형 크기는 100byte, null 허용
-- 탈퇴여부 delyn 타입은 고정문자형 크기는 1byte, 기본값은 N, null 허용 안함
-- 회원등록일 writeday 타입은 날짜형 기본값은 시스템 날짜(now()함수) null 허용 안함
-- 회원ip memberip 타입은 문자형 크기는 20byte, null 허용

--입력
--1 hong 1234 홍길동 M 19990101 대전 01047478585 hong@naver.com 축구 N 2024-09-25 211.155.244.37

-- 테이블 스키마 생성
create table MEMBER (
midx int not null auto_increment primary key,
memberid varchar(100) not null,
memberpwd varchar(100) not null,
membername varchar(100) not null,
membergender char(1) not null,
memberbirth int not null,
memberaddr varchar(10) null,
memberphone varchar(20) null,
memberemail varchar(100) null,
memberhobby varchar(100) null,
delyn char(1) default 'N' not null,
writeday DATETIME default NOW() not null,
memberip varchar(20) null
);

-- 테이블 이름 대소문자 확인방법(1:대소문자구분 안함, 0:대소문자구분)
--show variables like 'lower_case_table_names';

-- DML 언어중 insert 명령어로 데이터 입력

형식:
--insert into 테이블이름(컬럼1,컬럼2,컬럼3......) values(값,값,값......); -- 값을 입력할때 문자값은 "안에 입력한다"

insert into member(memberid,memberpwd,membername,membergender,memberbirth,memberaddr,memberphone,memberemail,memberhobby)
values('hong','1234', '홍길동', 'M', 19990101, '대전', '01047478585', 'hong@naver.com', '축구');


1-2 alter 구문 사용해서 컬럼 변경하기. (기존데이터를 삭제하고 컬럼을 변경해야하나 삭제할수 없는 상황이라면 변경시 데이터를 미리 백업한다.)
형식 : alter table 테이블이름
컬럼 추가 ADD
컬럼 수정 MODIFY
컬럼 삭제 DROP
컬럼 이름변경 RENAME

alter table member
modify memberbirth varchar(10) null;

샘플데이터 입력하기
insert into member(memberid,memberpwd,membername,membergender,memberbirth,memberaddr,memberphone,memberemail,memberhobby)
values('hong','1234', '홍길동', 'M', 19990101, '대전', '01047478585', 'hong@naver.com', '축구');
insert into member(memberid,memberpwd,membername,membergender,memberbirth,memberaddr,memberphone,memberemail,memberhobby)
values('jieun','4747', '이지은', 'F', 20000101, '서울', '01051348585', 'jieun@gmail.com', '야구');
insert into member(memberid,memberpwd,membername,membergender,memberbirth,memberaddr,memberphone,memberemail,memberhobby)
values('shin','5929', '신유빈', 'F', 20020201, '포항', '01052368585', 'shin@daum.net', '탁구');
insert into member(memberid,memberpwd,membername,membergender,memberbirth,memberaddr,memberphone,memberemail,memberhobby)
values('kang','7923', '강감찬', 'M', 19990101, '인천', '01054328585', 'kang@naver.com', '야구');
insert into member(memberid,memberpwd,membername,membergender,memberbirth,memberaddr,memberphone,memberemail,memberhobby)
values('lee','1212', '이순신', 'M', 19900101, '서울', '01074748585', 'lee@naver.com', '검도');
insert into member(memberid,memberpwd,membername,membergender,memberbirth,memberaddr,memberphone,memberemail,memberhobby)
values('moon','9090', '문예은', 'F', 19990101, '마산', '01076548585', 'cindymoon@kakao.com', 'cheerleading');
insert into member(memberid,memberpwd,membername,membergender,memberbirth,memberaddr,memberphone,memberemail,memberhobby)
values('woo','4321', '우도윤', 'M', 19990101, '수원', '01052398585', 'woo@naver.com', '축구');
insert into member(memberid,memberpwd,membername,membergender,memberbirth,memberaddr,memberphone,memberemail,memberhobby)
values('nirvana','2143', '김건주', 'M', 19990101, '대전', '01052528585', 'gichael@naver.com', '야구');
insert into member(memberid,memberpwd,membername,membergender,memberbirth,memberaddr,memberphone,memberemail,memberhobby)
values('ahn','8753', '안창호', 'M', 19990101, '대전', '01087538585', 'ahn@naver.com', '야구');
insert into member(memberid,memberpwd,membername,membergender,memberbirth,memberaddr,memberphone,memberemail,memberhobby)
values('lim','7658', '임윤아', 'F', 19900330, '서울', '01030308585', 'lim@naver.com', '댄스');
insert into member(memberid,memberpwd,membername,membergender,memberbirth,memberaddr,memberphone,memberemail,memberhobby)
values('kim','2747', '김태연', 'F', 19890101, '전주', '01027478585', 'kim@naver.com', '노래');
commit;
-- mysql에서는 자동커밋이 설정되어있다. 그래서 commit 명령어를 쓰지 않아도 된다.

-- 자동커밋확인방법
show variables like 'autocommit';
set autocommit = true;

-- 데이터 삭제 DML 구문
delete from member;
commit; -- db 반영
rollback; -- 이전복원

-- DML 구문중에 select 구문(데이터를 조회하는 구문)
형식 : select 컬럼1, 컬럼2, 컬럼3, 컬럼4.....from 테이블이름 where 조건절 groupby 그룹절 orderby 순서정렬;

-- 회원이름을 나열하시요
select membername from member;
-- 모든 회원 아이디와 회원 성별을 보여주세요
select memberid, membergender from member;
-- 회원정보 모든 값을 출력해주세요
select * from member;

-- 회원정보중에서 회원이 여성인 회원만 이름을 출력하시오.
select membername from member where membergender = 'F';

1-3. -- DDL 언어중에 3번째 table 삭제하기
형식 : drop table 테이블이름;

drop table member;

-- 회원번호 5번인 사람의 아이디와 이름 그리고 사는곳을 출력하세요.

select memberid, memberaddr from member where midx = '5';

-- 회원메일중에 네이버 메일을 사용하는 회원 정보를 모두 출력해주세요.

select * from member where memberemail like '%naver.com%';

-- 회원메일중에 네이버 메일을 사용하고 대전에 사는 회원 정보를 모두 출력해주세요.
select * from member where memberemail like '%naver.com%' and memberaddr = '대전'; -- like 조건 (포함하는)

-- 서울에 살고 성별이 여성인 회원의 정보를 출력해주세요.
select * from member where membergender = 'F' and memberaddr = '서울'; -- and 조건(교집합)

-- 회원의 성씨가 김씨인 사람의 회원정보를 모두 출력하세요
1. 데이터를 조회한다
select * from member
2. 앞글자를 가져오는 함수나 like 구문을 활용한다.
select * from member where membername like '김%'; -- 김으로 시작하는 모든값, %% 두개를 하면 김으로 검색되는 모든 값.
select * from member where SUBSTR(membername,1,1) = '김'; -- 글자자르기를 통해서 첫글자가 김인 사람데이터를 가져온다.

-- 나이가 25살이고 성이 이씨인 사람의 정보를 출력하세요.
select * from member where 2024 - SUBSTR(memberbirth,1,4) = '25' and membername like '이%';

-- 취미가 축구이고 성별이 여성인 사람이며 박씨인 사람을 출력하세요.
select * from member where membergender = 'F' and memberhobby like '%축구%';

-- 회원 이름중에 신으로 끝나는 회원의 이름을 출력해주세요.
select membername from member where membername like '%신';

select * from member where SUBSTR(membername,CHAR_LENGTH(membername)-1) = '신';

select length(membername)-3 from member; -- 글자 바이트 크기
select char_length(membername) from member; -- 글자 크기

SUBSTR(컬럼,자리,갯수) -- 갯수가 생략되어있으면 그 자리부터 끝까지라는 뜻.
자리수는 처음을 기준으로 하면 1로 시작되고 끝을 기준으로 하면 -1로 시작한다.

select * from member where SUBSTR(membername,-1,1) = '신'; -- 끝 글자를 뽑아내는 3가지 방법.

-- 정렬하기

order by (desc,asc) -- desc 내림차순 asc 오름차순 asc는 생략가능하고 desc 는 반드시 써줌.

-- 회원번호의 순서를 내림차순으로 정렬해서 출력하세요.
select * from member order by midx desc;
select * from member order by midx asc;

-- 회원 이름 순서대로 오름차순으로 정렬하시오
select * from member order by membername asc;

-- 회원 1차 이름 오름차순 2차 지역 내림차순으로 정렬하시오.
select * from member order by membername asc, memberaddr desc;

-- 데이터 수정 구문 update
-- 회원번호 3번인 사람의 이름을 이지은으로 바꾸세요.
update member SET membername='이지은' where midx = '3';
select * from member;

-- 서울에 살고 성이 홍씨인 사람들의 명단을 1차 회원번호 내림차순으로 2차 이름 오름차순으로 정렬해서 출력하시오.
select * from member where memberaddr = '서울' and SUBSTR(membername,1,1)='홍' order by midx DESC, membername asc;

-- 성을 제외한 회원 이름이 길동일때 해당 회원의 나이를 출력하세요.
select SUBSTR(NOW()1,4) - substr(memberbirth,1,4) as age from member where SUBSTR(membername,2) = '길동';

-- 시스템 날짜 함수
select now() from dual;

-- 별칭 as

--dual 가상테이블

-- or (합집합)

-- 회원들중에 서울 대전 부산에 사는 사람들의 명단을 최근 가입한 회원번호순으로 정렬해서 출력하시오.

select * from member where memberaddr='서울' or memberaddr='대전' or memberaddr='부산' order by midx desc;

-- 서울 대구 광주 대전에 살고 있는 여성회원들의 이메일이 네이버인 사람들의 데이터를 뽑아서 내림차순으로 정렬하세요

select * from member where memberaddr in ('서울','대구','광주','대전') and membergender = 'F' and memberemail like '%naver.com%' order by midx desc;

-- 비교연산
>, <, >=, <=

-- 회원번호가 3보다 큰 사람들의 아이디를 출력하세요.
select memberid from member where midx>3;

-- 회원번호가 3보다 크고 7보다 작은 사람들의 이름을 출력하세요.
select membername from member where midx>3 and midx<7;
-- between 연산자 활용.
select membername from member where midx between 4 and 6;


-- group by 절 사용하기. (그룹으로 묶을때)

형식 : select 1차 컬럼이름, 2차 컬럼이름 from member group by 1차 컬럼이름, 2차 컬럼이름

-- 회원들의 사는 곳을 그룹별로 출력하세요.

select memberaddr from member group by memberaddr;

select * from member;

-- 회원들의 사는 곳의 그룹별 성별로 출력하세요.



SELECT   memberaddr,
         membergender
FROM     member
GROUP BY memberaddr,
         membergender
ORDER BY memberaddr ASC,
         membergender DESC;

-- 전체그룹
select * from member;

-- 집계함수.

1. count() 함수
-- 갯수함수를 사용해서 전체 인원수를 출력하세요. count()

select count(*) as cnt from member; -- 행의 갯수
select count(midx) as midxcnt from member; -- 행의 컬럼갯수 null 값 제외

2. sum() 함수 : 합을 구하는 함수

-- 회원들의 회원번호 총합을 구해서 값을 출력하세요.

select sum(midx) as midxsum from member;

3. max() 함수 : 그룹내에 최고값
-- 회원들 중에 최고회원번호(최근에 가입한 회원) 최고값을 구해서 출력하세요.
select max(midx) as midxmax from member;

4. min() 함수 : 그룹내에 최소
select min(midx) as midxmin from member;

5. avg() 함수 : 그룹내에 평균값
select avg(midx) as midxavg from member;

-- 회원들중에 사는곳을 각 지역별로 인원수를 출력하세요.

select memberaddr, count(*) as membercnt from member group by memberaddr;

-- 회원들중에 사는곳을 각 지역별 성별로 인원수를 출력하세요.
select memberaddr,membergender, count(midx) as membercnt from member group by memberaddr,membergender
order by memberaddr, membergender;

-- 회원번호 3~7까지의 회원중에 naver메일을 사용하는 사람들의 인원수를 출력하세요.

select count(*) from member where midx between 4 and 6 and memberemail like '%naver.com%';

-- 회원번호 2부터 9번까지 회원중에 지역별로 각 인원수를 출력하세요.

select memberaddr, count(*) as addrcnt from member where midx >=2 and midx <=9 group by memberaddr;

-- instr() 위치값을 출력하는 함수
-- 메일에서 @의 자리수 위치를 출력하세요.

select memberemail, instr(memberemail,'@') from member;

-- 메일도메인 어디사용하는지 추출해보기.
select substr(memberemail,instr(memberemail,'@')) from member;

-- 회원들의 각 메일 사용 현황(인원수)를 출력하세요.

SELECT   SUBSTR(memberemail,instr(memberemail,'@')), count(*) as membercnt
FROM     member
GROUP BY SUBSTR(memberemail,instr(memberemail,'@'))

--concat() 글자 붙이기 함수

select membername+"회원님" from member;
select concat(membername,'회원님') as con from member;

-- 서브쿼리 학습하기
1. where 절 서브쿼리 : where 조건절 안에 쿼리가 존재

-- 회원들중에 회원번호가 회원번호 평균값보다 작은 사람들의 명단을 출력하세요.
select midx, membername from member where midx < (select avg(midx) as midxavg from member);

-- 회원번호중에 홀수인 사람들의 명단을 서브쿼리를 활용해서 출력하세요.
select * from member where midx in(select midx from member where mod(midx,2)=1);

-- mod() 함수 : 나머지 추출 연산함수

select mod(midx,2) as midxmod from member;

-- 홀수 뽑아내기
select * from member where mod(midx,2)=1;

-- 스칼라 서브쿼리

-- 테이블 별칭
select A. * from member A

-- 스칼라 서브쿼리 : 컬럼절 안에 존재하는 쿼리
-- 회원번호와 회원 이름을 스칼라 쿼리를 활용해서 출력하시오

select a.midx,(select b.membername from member b where b.midx=a.midx) from member a

-- 인라인 뷰 : from절에 쿼리가 들어간다.
-- 회원 이름 회원 성별 회원 나이만 있는 테이블 만들고 성별이 여성인 사람의 명단을 출력하세요.

select A.* from(select membername, membergender, (2024 - substr(memberbirth,1,4)) as age from member) A
where A.membergender='F';

-- case when then else end 컬럼 조건식
-- 회원번호가 1번 5번인 사람은 로또당첨이라고 출력하고 나머지는 꽝이라고 출력하세요.

select
	CASE midx
		when 1 then '로또당첨'
		when 5 then '로또당첨'
	else
		'꽝입니다'
	end as msg
from member

select midx,
	case when midx=1 or midx=5 then '로또당첨'
	ELSE '꽝입니다'
	end as msg
from member;

-- if()함수 : 조건식 함수

select midx, if(midx in(1,5),'로또당첨','꽝입니다') as msg from member;

select midx, if(midx=1, '로또당첨', if(midx=5,'로또당첨','꽝입니다')) as msg from member;

-- null 체크 함수 nvl()

select ifnull(memberip,'아이피가 존재하지 않습니다.') as memberip from member;

-- 회원 ip가 null 인 사람의 명단을 출력하세요.
SELECT a.membername FROM member a where a.memberip=null; -- 이거 안먹음
SELECT a.membername FROM member a where a.memberip is null;

-- 날짜 함수 사용하기
-- 년도를 추출하는 함수 DAYOFYEAR()

-- 회원번호 3번인 사람의 가입년도를 출력하세요.

select DAYOFYEAR(writeday) as year from member where midx=3;

-- 월을 추출 함수 month()
select month(writeday) as year from member where midx=3;

-- 날짜 date 함수
select date(writeday) as year from member where midx=3;

-- 기타 시간 hour() 함수 minute() 함수 second () 초함수

-- 요일함수 weekday() 함수
select weekday(now()) as '요일' from dual; (0월요일 1 화요일........6 일요일)

-- last_day() : 해당 날짜의 달에 마지막 날짜정보

select last_day(NOW()) from dual;

-- 현재 날짜와 시간

select now() from dual; -- 오늘 현재 시간
select CURRENT_TIMESTAMP() from dual;

-- 현재 날짜
select curdate() from dual;
select current_date() from dual;

-- 현재 시각
select curtime() from dual;
select current_time() from dual;

-- 날짜 표현을 형식화 시키는 함수 date_format(date,format)
select DATE_FORMAT(writeday,'%Y-%m-%d') from member;
select DATE_FORMAT(writeday,'%Y-%m-%d %T') from member; -- 이것만 해도 시간은 다 나옴.
select DATE_FORMAT(writeday,'%Y-%m-%d %H:%i:%s') from member;

-- 날짜 계산함수 date_add()
select date_add(now(),INTERVAL 1 DAY) from dual; -- 오늘 날짜에 하루를 더 추가해서 계산.

-- 문자를 날짜로 변환하는 함수 str_to_date()
select STR_TO_DATE('20300505','%Y%m%d') from dual;
select STR_TO_DATE('2030-05-05','%Y-%m-%d') from dual;

-- 2024년 10월 9일의 요일을 출력해주세요.
select WEEKDAY(STR_TO_DATE('20241009','%Y%m%d')) as '요일' from dual;

-- union 사용하기
-- 회원번호 1번인 사람의 이름과 대전에 사는 사람들의 명단을 모두 출력하세요.

select membername from member where midx='1'
UNION
select membername from member where memberaddr = '대전';

-- 서울 대전 부산에 사는 사람들의 나이와 명단과 여성인 사람의 나이와 명단을 모두 출력하세요.
select membername, 2024 - SUBSTR(memberbirth,1,4) as age from member where memberaddr in ('서울','대전','부산')
union
select membername, 2024 - SUBSTR(memberbirth,1,4) as age from member where membergender = 'F';

-- 임시테이블 사용하기
-- 필요한 데이터를 추출후 임시형태로 보관후 필요한 조건에 따라 다시 추출하는 방법

with temptables as (
select * from member where membergender='M'
)

select * from temptables;

-- 가상테이블 생성하기
create view virtualtable
AS
select * from member where memberaddr='대전';

select * from virtualtable;

-- rownum 행의 순서

-- 회원정보를 회원번호 내림차순으로 순서를 두고 정렬하시오.
set @rownum:=0;
select @rownum:=@rownum+1 as nm, A.* from member A order by A.midx desc;

-- 프로시저 만들기

create procedure proctest (
param_name varchar(20) -- 파라미터(매개) 변수 선언
)
BEGIN
	declare i int; -- 변수선언 타입과 같이
	set i=1; -- 변수의 초기값 담기
	while i<=1000 do -- 반복문 사용하기

	insert into member(memberid,memberpwd,membername,membergender,memberbirth,memberaddr,memberphone,memberemail,memberhobby)
	values(concat(param_name,i),'1234', '홍길동', 'M', 19990101, '대전', '01047478585', 'hong@naver.com', '축구');
	set i = i+1;
	END while; -- 반복문 끝
END

drop PROCEDURE proctest;

call proctest('test')

select count(*) from member;

-- 데이터 삭제하기
delete from member;
select * from member;

-- AUTO_INCREMENT 초기화
ALTER TABLE member AUTO_INCREMENT=1;

-- 인덱스 생성하기
--// 데이터를 조회할때 검색속도를 빨리하기 위해서 목차(색인)이라고 하는 index 를 사용해서 데이터 검색을 빨리한다.\

-- 형식
create index 인덱스이름 on 테이블이름(인덱스를 건 컬럼)

select count(*) from member;

create index memberid_idx on member(memberid);

select * from member where memberid='test555';

select A.* from (select * from member) A where A.memberid='test555';

-- 게시판 테이블 생성하기(BOARD)

create table BOARD (
bidx int not null AUTO_INCREMENT PRIMARY KEY, -- 글 번호
subject varchar(100) not null, -- 글 제목
contents TEXT not null, -- 글 내용
writer varchar(100) not null, -- 작성자
recom int null, -- 추천수
viewcnt int null, -- 조회수
filename varchar(100) null, -- 파일이름
writeday DATETIME default NOW(), -- 등록일
delyn char(1) default 'N', -- 삭제여부
ip varchar(30) null, -- ip
midx int not null -- 회원번호
);

-- 외래키(foreign key 제약조건 추가)
alter table board
add CONSTRAINT bidx_midx_fk FOREIGN KEY(midx) REFERENCES MEMBER(midx);
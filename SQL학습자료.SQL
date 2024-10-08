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
add CONSTRAINT member_board_midx_FK FOREIGN KEY(midx) REFERENCES MEMBER(midx);

insert into BOARD(subject,contents,writer,recom,viewcnt,filename,ip,midx)
values('글제목','글내용','작성자',0,0,null,'211.111.222.330',10012)

select * from member;

select * from board;

-- 추천수 기본값 초기화
alter table board
modify recom int default 0;

-- 조회수 기본값 초기화
alter table board
modify viewcnt int default 0;

insert into BOARD(subject,contents,writer,recom,viewcnt,filename,ip,midx)
values('글제목2','글내용2','작성자2',0,0,null,'211.111.222.310',10013)

-- join 학습
-- 공통된 컬럼으로 묶어서 하나의 테이블로 합치는 방법
-- 형식:
select * from 테이블1 inner join 테이블2 on 테이블1.pk컬럼 = 테이블2.fk컬럼

select A.subject from board A inner join member B on B.midx = A.midx where B. memberid='test2';

-- member 테이블 데이터 수정하기 update (DML)
-- 형식 update 테이블이름 set 컬럼1='값', 컬럼2='값' where midx=값; (where 조건을 사용하지 않으면 전체가 업데이트 될수 있으니 주의 요망)
-- 회원번호가 홀수인 사람들은 사는 지역을 모두 서울로 변경하세요.

select 3 mod 2 from dual; -- mod 나머지 연산자

update member set memberaddr='대전' where midx mod 2 =1;

select * from member;

-- 회원번호가 3의 배수인 사람들은 성별을 여성으로 하고 취미는 야구라고 변경하세요.
update member set membergender='F',memberhobby='야구' where midx mod 3 =0;
update member SET membername='이순신',memberhobby='검도' where midx mod 2=0;
update member SET memberaddr='부산' where midx mod 4=0;
update member SET memberaddr='대구' where midx mod 5=0;
update member set memberbirth= '20000505'+midx;


1. 이름을 변경해보자..memberid 하고 이름이라는 글자를 붙여서 고유하게 만들자
2. 두글자를 붙이기 함수 concat() 사용해봐야지
3. 확인해보자

select concat('이름',memberid) from member;
4. update 를 하자
update member SET memberid = 'test123' where midx BETWEEN 10010 and 10020;
5. 전체를 대상으로 할거니 where 조건은 필요없음.
6. 확인
select * from member;

select * from board;

-- board 샘플 데이터 입력하기
insert into BOARD(subject,contents,writer,recom,viewcnt,filename,ip,midx)
values('안녕하세요','자바 질문입니다','김마마',0,0,null,null,10015);
insert into BOARD(subject,contents,writer,recom,viewcnt,filename,ip,midx)
values('자바 공부중입니다','자바에 관해서 물어보고 싶어요','이순신',0,0,null,null,10016);
insert into BOARD(subject,contents,writer,recom,viewcnt,filename,ip,midx)
values('정처기 질문좀 할게요','정처기','손인욱',0,0,null,null,10115);
insert into BOARD(subject,contents,writer,recom,viewcnt,filename,ip,midx)
values('정처기 따야되나요?','정처기','김찬호',0,0,null,null,10215);
insert into BOARD(subject,contents,writer,recom,viewcnt,filename,ip,midx)
values('요즘 너무 힘드네요','자바 질문입니다','장지환',0,0,null,null,10315);
insert into BOARD(subject,contents,writer,recom,viewcnt,filename,ip,midx)
values('궁금한게 있습니다','자바 질문입니다','정상길',0,0,null,null,10415);
insert into BOARD(subject,contents,writer,recom,viewcnt,filename,ip,midx)
values('공휴일 계산','자바 질문입니다','김태연',0,0,null,null,10055);
insert into BOARD(subject,contents,writer,recom,viewcnt,filename,ip,midx)
values('휴일이 징검다리','자바 질문입니다','임윤아',0,0,null,null,10075);
insert into BOARD(subject,contents,writer,recom,viewcnt,filename,ip,midx)
values('가을산악','자바 질문입니다','김마마',0,0,null,null,10015);
insert into BOARD(subject,contents,writer,recom,viewcnt,filename,ip,midx)
values('곧 크리스마스','자바 질문입니다','김마마',0,0,null,null,10015);
select * from board;

-- 게시글을 최근 등록된 순서대로 나열하세요.
select * from board order by bidx desc;

-- 3번째 게시글을 쓴 사람의 이름을 출력하세요. (midx로 합치기)
select B.membername from board A inner join member B on B.midx = A.midx where A.bidx=3;

-- 아이디가 test123인 사람이 쓴 게시글을 모두 출력해주세요.
select A.* from board A inner join member B on B.midx = A.midx where B.memberid='test123';

-- 대전에서 사는 사람들이 쓴 글의 게시물의 수를 출력해주세요.
select A.bidx from board A inner join member B on B.midx = A.midx where B.memberaddr='대전';
select count(*) from board A inner join member B on B.midx = A.midx where B.memberaddr='대전';

-- 8번 게시물의 조회수를 +1업데이트 해주세요.
update board set viewcnt=viewcnt + 1 where bidx=8;

-- outer join 학습하기
	: 기준점이 되는 모든 데이터(테이블)들은 나타내주고 다른 테이블의 데이터는 공통적인 컬럼으로 묶어져 있는 데이터만 추출한다.

	left outer join 형식

	-- select * from 테이블A left outer join 테이블B on A.pk=B.pk
	-- 회원들 중에 게시글을 쓴 게시물 수를 모두 출력하세요.(게시글을 쓰지 않았으면 0)



SELECT   A.midx,
         COUNT(B.bidx)
FROM     member A
         LEFT OUTER JOIN board B
         ON       A.midx=B.midx
GROUP BY A.midx
ORDER BY midx;

-- left join 학습 예제
-- 회원들 중에 사는 지역별로 게시물을 쓴 사람들의 인원수를 출력하세요.

select A.memberaddr,count(B.bidx) from member A left outer join board B on A.midx=B.midx group by A.memberaddr,B.bidx order by memberaddr;
-- 게시글을 등록하지 않은 사람들의 정보까지도 출력한다. inner join을 쓰면 게시글을 등록하지 않은 사람의 글은 출력하지 않는다.


-- 홍길동3인 사람이 쓴 글이 ip가 있으면 ip있음이라고 출력하고 아이피가 없으면 ip없음이라고 출력하세요.
select if(B.ip, 'ip있음', 'ip없음') as ip from member A inner join board B on A.midx=B.midx where membername = 'test123';





SELECT   A.membername,
         CASE
                  WHEN B.ip IS NOT NULL
                  THEN 'ip있음'
                  ELSE 'ip없음'
         END AS ip_status
FROM     member A
         LEFT OUTER JOIN board B
         ON       A.midx=B.bidx
where A.membername = '홍길동3'
GROUP BY A.membername;

-- 제목이 '공휴일계산' 라고 쓰여진 글의 회원 이름을 출력하세요.

select B.membername from board A join member B on B.midx = A.midx where A.subject = '공휴일계산';


-- 게시글의 추천수가 제일 많은 사람의 아이디를 출력하세요.
select B.memberid from board A left outer join member B on B.midx = A.midx where A.recom = (select max(recom) from board);

1. 합쳐진 데이터를 살펴본다
select * from member A join board B on A.midx=B.midx
2. 어떤 조인을 써야될지 고민
3. where 조건 사용 (서브쿼리)

select A.memberid from member A join board B on A.midx=B.midx where recom = (select max(recom) from board);


update board set recom=3 where bidx=3;
select * from board;

-- 4 검수 검증
해당 되는 아이디가 실제로 추천수 3 아이디인지 확인해본다.


-- reply(댓글) create 테이블 만들어보기 실습
create table REPLY (
ridx int not null primary key auto_increment,
rsubject varchar(100) null,
rcontents varchar(4000) not null,
rwriter varchar(100) null,
writeday datetime default now(),
delyn char(1) default 'N',
rip varchar(20),
midx int not null,
bidx int not null
);

-- midx FK 설정
alter table REPLY
add constraint member_reply_midx_FK foreign key(midx) references member(midx);

-- bidx FK 설정
alter table REPLY
add constraint board_reply_bidx_FK foreign key(bidx) references board(bidx);

insert into REPLY(rsubject,rcontents,rwriter,rip,midx,bidx)
values('궁금','알려주세요','삼삼','111.222.333.444',10013,3);


select * from board
-- 게시판용 컬럼 추가
alter table board
add originbidx int null;
alter table board
add depth int null;
alter table board
add level_ int null;

-- 컬럼 순서 바꾸기

alter table board
modify COLUMN originbidx int after bidx;
alter table board
modify COLUMN depth int after originbidx;
alter table board
modify COLUMN level_ int after depth;

select * from board

update board set originbidx=bidx, depth=0, level_=0;


-- 게시판 조회목록쿼리;
SELECT * from board order by originbidx desc, depth asc;

-- 답변달기 쿼리;
-- update board set
insert into board (originbidx, depth, level_, subject, contents, writer, midx)
values(9,1,1,'9번글 답변','9번글 답변내용','답변자',10037);

-- 또다른 답변 달기 (원글번호의 순서보다 큰 것들은 순서를 업데이트하고 그 사이에 답변글을 입력한다)
update board set depth = depth+1 where originbidx = 9 and depth > 0;
insert into board (originbidx, depth, level_, subject, contents, writer, midx)
values(9,1,1,'9번글 두번째답변','9번글 두번째 답변내용','답변자2',10038);

-- 답변하기 쿼리
set autocommit = 0;  -- 수동 커밋으로 전환
update board set depth = depth+1 where originbidx = 답변하려는 원글 번호 and depth > 원글의 순서;
insert into board (originbidx, depth, level_, subject, contents, writer, midx)
values(원글번호,원글순서+1,원글답변단계+1,'답변제목','답변내용','닉네임',회원번호);
commit; // update insert 일괄실행
set autocommit = 1;  -- 자동 커밋으로 전환

-- level_ 과 depth가 증가하는 식을 쓰게 되는 개발자의 관점에서 보게 되면
-- 첫번째 답변이 달렸을때 첫번째 답글이 첫번째 게시글에 대한 댓글(리플)이여도
-- 그 리플에 대댓글(리플에 대한 리플)이 달리게 되면 그 리플을 결국 원글이라는 개념으로 봐야된다.
-- 따라서 originbidx 는 변하지 않지만 첫 게시글에 대한 답변이 depth가 1, level_이 1이라는 값을 무조건 가져가게 됨으로
-- 첫번째 게시글의 답변은 원글로 인식을 하고 대댓글이 달리게 되면 depth와 level_을 1씩 증가시켜서 번호를 부여해줘야 된다.
-- 그리고 그 첫번째 게시글의 답변의 답변에 대한 답변은 depth와 level_이 또 1씩 증가함으로 둘다 3이라는 번호가 부여가 된다.

-- 수정하기 쿼리(게시글을 수정할때)
update board set subject='수정할 제목내용', contents='수정할 내용', writer='작성자'
modifyday=now() where bidx=수정하려는 글번호;

-- 수정날짜 입력 컬럼 생성하기
alter table board
add modifyday datetime null;

-- 삭제하기 쿼리
update board set delyn='Y', modifyday=NOW() where bidx=삭제하려는 글번호;

-- 내용보기 쿼리
select * from board where bidx=내용을 보려고 하는 글번호;

-- 목록보기 쿼리
SELECT * from board where delyn='N' order by originbidx desc, depth asc;

-- 새글 입력쿼리
set autocommit = 0;  -- 수동설정
insert into board (originbidx, depth, level_, subject, contents, writer, midx)
values(null,0,0,'제목','내용','작성자',회원번호);

update board set originbidx=(select max(bidx) from board)
where bidx=(select max(bidx) from board) -- 방금입력한 최고bidx값
commit;
set autocommit=1; -- 자동설정

-- 페이징 목록쿼리
SELECT * from board where delyn='N' order by originbidx desc, depth asc limit 0,15; 첫번째 0번 행부터 15개까지 가지고 온다.
																		limit (페이지 번호-1) * 15,15


-- board 더미데이터 만들어보기

create procedure boardproc (
param_name varchar(20) -- 파라미터(매개) 변수 선언
)
BEGIN
	declare i int; -- 변수선언 타입과 같이
	set i=1; -- 변수의 초기값 담기
	while i<=1000 do -- 반복문 사용하기

	insert into board(originbidx,depth,level_,subject,contents,writer,midx)
	values(null,0,0,concat(param_name,i),concat(param_name,i),concat(param_name,i), 10055);
	set i = i+1;
	END while; -- 반복문 끝
END

call boardproc('게시판');

select * from board;
update board set originbidx=bidx;
SELECT * from board where delyn='N' order by originbidx desc, depth asc limit 30,15;

select * from reply;

-- 댓글 테이블 샘플데이터 입력
insert into reply(rsubject,rcontents,rwriter,midx,bidx)
values('궁금','궁금한 내용','댓글작성자1',10067,3);
insert into reply(rsubject,rcontents,rwriter,midx,bidx)
values('알려주세요','알고싶음','댓글작성자2',10068,9);
insert into reply(rsubject,rcontents,rwriter,midx,bidx)
values('댓글제목1','댓글내용1','댓글작성자3',10069,5);
insert into reply(rsubject,rcontents,rwriter,midx,bidx)
values('댓글제목2','댓글내용2','댓글작성자4',10070,6);
insert into reply(rsubject,rcontents,rwriter,midx,bidx)
values('댓글제목3','댓글내용3','댓글작성자5',10071,9);
insert into reply(rsubject,rcontents,rwriter,midx,bidx)
values('댓글제목4','댓글내용4','댓글작성자6',10072,8);
insert into reply(rsubject,rcontents,rwriter,midx,bidx)
values('댓글제목5','댓글내용5','댓글작성자7',10073,13);
insert into reply(rsubject,rcontents,rwriter,midx,bidx)
values('댓글제목6','댓글내용6','댓글작성자8',10074,14);
insert into reply(rsubject,rcontents,rwriter,midx,bidx)
values('댓글제목7','댓글내용7','댓글작성자9',10075,11);
insert into reply(rsubject,rcontents,rwriter,midx,bidx)
values('댓글제목8','댓글내용8','댓글작성자10',10076,10);

select * from member
select * from board
select * from reply

--  특정아이디를 가진 사람이 작성한 댓글을 쓴 사람들의 아이디를 출력해주세요.

1. board 테이블과 reply 테이블을 조인해서 합친다.



SELECT C.memberid
FROM   board A
       JOIN reply B
       ON     A.bidx=B.bidx
       JOIN member C
       ON     C.midx=B.midx
where A.writer ='이순신'
;

4. 검증 - 샘플검사 or 전수검사.

update reply set rsubject ='악플'where ridx=8;

-- 댓글중에 악플이라고 써있는 게시글을 모두 찾아서 게시글 번호와 그 댓글을 쓴 사람의 이름과 연락처를 출력해주세요.

select B.membername,B.memberphone,A.ridx from reply A join member B on A.midx=B.midx where A.rsubject ='악플';

SELECT A.bidx,C.membername,C.memberphone
FROM   board A
       JOIN reply B
       ON     A.bidx=B.bidx
       JOIN member C
       ON     C.midx=B.midx
where B.rsubject ='악플'
;

select * from member order by midx desc;
select * from member where memberid='' and memberpwd='1234';
입력값을 아이디 'or 1='1 -- sql injection 쿼리공격.

-- 컬럼이름 변경
alter table member
change column memberpw memberpwd varchar(100);

-- 3개 조인 연습
-- 회원들이 9번 게시글에 대해서 댓글을 각각 몇개씩 작성했는지 출력해주세요.
select * from member A left join board B on A.midx=B.midx join reply C on B.bidx=C.bidx where B.bidx = 9

1. 조인
2. 데이터 확인
3. 그룹짓기
4. 집계함수 사용

1.

SELECT   A.midx,
         COUNT(ridx)
FROM     member A
         LEFT JOIN
                  (SELECT C.midx,
                          C.ridx,
                          B.bidx
                  FROM    board B
                          JOIN reply C
                          ON      B.bidx=C.bidx
                  WHERE   B.bidx        =9
                  )
                  D
         ON       A.midx=D.midx
GROUP BY A.midx


2.

SELECT   A.midx,
         COUNT(B.ridx)
FROM     member A
         LEFT JOIN
                  (SELECT *
                  FROM    reply
                  WHERE   bidx=9
                  )
                  B
         ON       A.midx=B.midx
GROUP BY A.midx

-- 주의해야 될점 내가 짠 쿼리가 잘못된 정보를 표시해줄수 있기 때문에 본인이 스스로 검증이 필요.

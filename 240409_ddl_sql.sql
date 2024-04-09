create table new_table(
    no  number(3),
    name varchar2(10),
    birth date
    );
    
desc new_table;


create table tt02(
    no  number(3, 1) default 0,
    name varchar2(10) default 'No Name',
    hiredate date   default SYSDATE
);

insert into tt02(NO) Values(1);

select * from tt02;

create table 한글테이블(
    컬럼1 number,
    컬럼2 varchar2(10),
    컬럼3 date
);
desc 한글테이블;


//임시 테이블 생성, 임시 테이블은 하나의 세선에만 생성된다. commit 수행하면 데이터가 삭제 됨.
create global temporary table temp01 (
    no  number,
    name varchar2(10));
    
insert into temp01 values(1, 'AAAAA');
select * from temp01;
commit;


//Temporary Table 조회
select temporary, duration
from user_tables
where table_name='TEMP01';

create table dept3
as
select * from dept2;

select * from dept2;

create table dept4
as
select dcode, dname
from dept2;

select * from dept4;

create table dept5
as
select * from dept2
where 1=2;

select * from dept5;

create table dept6
as
select dcode, dname
from dept2
where dcode in(1000,1001, 1002);

select * from dept6;

alter table dept6
add(location2 varchar2(10) default 'seoul');

alter table dept6 rename column location2 to loc;

rename dept6 to dept7;

select * from dept7;

alter table dept7
modify(loc varchar2(20));

alter table dept7 drop column loc;

select * from dept7;
//드랍 컬럼
alter table dept7 drop column location cascade constraints;
//안에 데이터 삭제
truncate table dept7;

drop table dept7;

select * from dept7;

create table t_readonly(
    no number,
    name varchar2(10));
    
select * from t_readonly;

insert into t_readonly values(1, 'AAA');
//테이블을 읽기 전용으로 변경
alter table t_readonly read only;

insert into t_readonly values(2, 'BBB');

alter table t_readonly
add(tel number default 111);

alter table t_readonly read write;

create table vt1(
    col1 number,
    col2 number,
    col3 number generated always as (col1 + col2));
    
insert into vt1(col1, col2) values(3, 4);

update vt1 set col1=5;

select * from vt1;


alter table vt1
add(col4 number generated always as ((col1*col2)+col2));

select column_name, data_type, data_default
from user_tab_columns
where table_name = 'V11'
order by column_id;

desc vt1;


//when을 통해 substr한 pdate 값이 01 02 03 일 경우 1 을 담고, 04 05 06 일 경우 2를 담는다 
//(봄 여름 가을 겨울로 나눠도 좋을 듯 하다)
create table sales10(
    no  number,
    pcode   char(4),
    pdate   char(8),
    pqty    number,
    pbungi  number(1)
    generated always as(
        case   
            when substr(pdate, 5, 2) in ('01','02','03') then 1
            when substr(pdate, 5, 2) in ('04','05','06') then 2
            when substr(pdate, 5, 2) in ('07','08','09') then 3
            else 4
        end ) virtual );

insert into sales10(no, pcode, pdate, pqty)
values(1, '100', '20110112', 10);

select * from sales10;


//1번
create table new_emp(
    no          number(5),
    name        varchar2(20),
    hiredate    date,
    bonus       number(6,2)
    );
select * from new_emp;
desc new_emp;

// 2번 emp2 테이블 생성
create table new_emp2
as
select no, name, hiredate 
from new_emp;

desc new_emp2;

//3번 emp3을 만드는데 데이터는 가져오지 않는
create table new_emp3
as
select *
from new_emp2
where 1 = 2;

select * from new_emp3;

//4번 생일 컬럼을 넣고 디폴트값을 오늘 날짜로
alter table new_emp2
add(birthday date default sysdate);

desc new_emp2;
select * from new_emp2;


//5번 emp2 테이블의 생일(birthday) 컬럼이름을 birth로 변경
alter table new_emp2
modify(birthday, birth);

//6번 emp2 테이블의 NO컬럼의 길이를 NUMBER(7)로 변경하는 쿼리 작성
alter table new_emp2
modify(no number(7));

desc new_emp2;

//7번 new_emp2 컬럼에서 birth 컬럼을 삭제하는 쿼리 작성
alter table new_emp2
delete(birthday);

//8번 emp2 테이블의 컬럼은 남겨 놓고 데이터만 지우는 쿼리 작성
delete from new_emp2;

//9번 테이블을 완전히 삭제하는 쿼리 작성
drop table new_emp2;

//10번 데이터 딕셔너리 종류와 특징을 간단하게 쓰세요.
//데이터 딕셔너리의 종류로는 

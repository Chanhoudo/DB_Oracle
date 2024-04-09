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

create table �ѱ����̺�(
    �÷�1 number,
    �÷�2 varchar2(10),
    �÷�3 date
);
desc �ѱ����̺�;


//�ӽ� ���̺� ����, �ӽ� ���̺��� �ϳ��� �������� �����ȴ�. commit �����ϸ� �����Ͱ� ���� ��.
create global temporary table temp01 (
    no  number,
    name varchar2(10));
    
insert into temp01 values(1, 'AAAAA');
select * from temp01;
commit;


//Temporary Table ��ȸ
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
//��� �÷�
alter table dept7 drop column location cascade constraints;
//�ȿ� ������ ����
truncate table dept7;

drop table dept7;

select * from dept7;

create table t_readonly(
    no number,
    name varchar2(10));
    
select * from t_readonly;

insert into t_readonly values(1, 'AAA');
//���̺��� �б� �������� ����
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


//when�� ���� substr�� pdate ���� 01 02 03 �� ��� 1 �� ���, 04 05 06 �� ��� 2�� ��´� 
//(�� ���� ���� �ܿ�� ������ ���� �� �ϴ�)
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


//1��
create table new_emp(
    no          number(5),
    name        varchar2(20),
    hiredate    date,
    bonus       number(6,2)
    );
select * from new_emp;
desc new_emp;

// 2�� emp2 ���̺� ����
create table new_emp2
as
select no, name, hiredate 
from new_emp;

desc new_emp2;

//3�� emp3�� ����µ� �����ʹ� �������� �ʴ�
create table new_emp3
as
select *
from new_emp2
where 1 = 2;

select * from new_emp3;

//4�� ���� �÷��� �ְ� ����Ʈ���� ���� ��¥��
alter table new_emp2
add(birthday date default sysdate);

desc new_emp2;
select * from new_emp2;


//5�� emp2 ���̺��� ����(birthday) �÷��̸��� birth�� ����
alter table new_emp2
modify(birthday, birth);

//6�� emp2 ���̺��� NO�÷��� ���̸� NUMBER(7)�� �����ϴ� ���� �ۼ�
alter table new_emp2
modify(no number(7));

desc new_emp2;

//7�� new_emp2 �÷����� birth �÷��� �����ϴ� ���� �ۼ�
alter table new_emp2
delete(birthday);

//8�� emp2 ���̺��� �÷��� ���� ���� �����͸� ����� ���� �ۼ�
delete from new_emp2;

//9�� ���̺��� ������ �����ϴ� ���� �ۼ�
drop table new_emp2;

//10�� ������ ��ųʸ� ������ Ư¡�� �����ϰ� ������.
//������ ��ųʸ��� �����δ� 

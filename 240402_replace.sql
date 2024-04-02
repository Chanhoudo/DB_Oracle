select * from emp;

//1번
select ename, replace(ename, substr(ename,2,2), '--') as "REPLACE" from emp where deptno = 20;
select * from student;
//2번
select name, jumin, replace(jumin, substr(jumin, 7, 7), '-/-/-/-') as "REPLACE" from student where deptno1 = 101;
select name, jumin, replace(jumin, substr(jumin, 7, 7), '-/-/-/-') as "REPLACE" from student where deptno1 = 101;
//3번
select name, tel, replace(tel, substr(tel, 5, 3), '***') as "REPLACE" from student where deptno1 = 102;
//4번
select name, tel, replace(tel, substr(tel, 9,4), '****') as "REPLACE" from student where deptno1 = 101;
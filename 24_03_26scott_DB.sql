select * from emp;
select * from student;
//1��
select name || '''s ID : ' || ID || ', ' || 'WEIGHT is ' || weight || 'kg' "ID AND WEIGHT"
from student;

//2��
select ename || '(' || job || ') , ' || ename || '''' || job || '''' as "NAME AND JOB"
from emp;

//3��
select ename || '''s sal is $' || sal as "Name and Sal" from emp;


select empno , ename from emp where empno between 5000 and 7500;

select * from emp;

select ename, hiredate from emp where hiredate = '80/12/17';

select ename , sal , sal * 1.1 from emp where deptno = 10;

select * from emp;
select * from emp where ename like 'C';

select empno, ename, sal 
from emp 
where ename >= 'W' ;

select ename, hiredate
from emp
where hiredate >= '81/10/20';

select *
from emp
where sal between 2000
and 3000;

select *
from emp
where sal >= 2000
AND sal <= 3000;

select ename from emp order by ename;

select * from emp;

select empno, ename, sal
from emp
where empno = &empno;

select *
from &table
where empno = &empno;


select deptno, ename, job
from emp
order by deptno asc, sal desc;


select ename, sal, hiredate
from emp
where sal > 1000
order by 2, 1;
//studno ������� ���ĵż� ���� (������ �ߺ�����)
select studno, name, deptno1, 1
from student
where deptno1 = 101
union
select profno, name, deptno, 2
from professor
where deptno = 101;

//���ĵ��� �ʰ� �� sql�� ��� ��� �� �ؿ� sql�� ��� ��� (������ �ߺ�����)
select studno, name, deptno1, 1
from student
where deptno1 = 101
union all
select profno, name, deptno, 2
from professor
where deptno = 101;

//������
select studno, name
from student
where deptno1 = 101
intersect
select studno, name
from student
where deptno2 = 201;


//������
select empno, ename, sal
from emp
minus
select empno, ename, sal
from dept;

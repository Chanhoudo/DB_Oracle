select * from emp;


select ename || '(' || job || ') , ' || ename || '''' || job || '''' as "NAME AND JOB"
from emp;


select ename || '''s sal is $' || sal as "Name and Sal" from emp;


select empno , ename from emp where empno between 5000 and 7500;

select * from emp;

select ename, hiredate from emp where hiredate = '80/12/17';

select ename , sal , sal * 1.1 from emp where deptno = 10;
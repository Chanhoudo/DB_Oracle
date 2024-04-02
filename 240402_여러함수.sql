select * from emp;

//1번
select ename, replace(ename, substr(ename,2,2), '--') as "REPLACE" from emp where deptno = 20;
select * from student;
//2번
select name, jumin, replace(jumin, substr(jumin, 7, 7), '-/-/-/-') as "REPLACE" from student where deptno1 = 101;
//select name, jumin, replace(jumin, substr(jumin, instr, 7), '-/-/-/-') as "REPLACE" from student where deptno1 = 101;
//3번
select name, tel, replace(tel, substr(tel, instr(tel,')')+1, instr(tel,'-') - (instr(tel,')')+1)), '***') as "REPLACE" from student where deptno1 = 102;
//4번
select name, tel, replace(tel, substr(tel, instr(tel,'-')+1, length(tel) - instr(tel, '-')), '****') as "REPLACE" from student where deptno1 = 101;

select * from student;
select * from emp;

select studno, name, birthday from student where To_char(birthday,'MM') between 1 and 3;

select empno, ename, hiredate from emp where To_char(hiredate, 'MM') between 1 and 3;


select * from emp;

select empno, ename, sal, comn, to_char((pay * 12) + bonus, '999,999') "salary" from emp;

select empno, ename, to_char(hiredate,'YYYY-MM-DD' ) "HIREDATE", to_char((sal * 12) + comm, '99,900') "SAL", to_char((sal * 12) * 1.15, '$99,900')"15% UP"from emp where comm is not null;

select * from professor;

select profno, name, pay, NVL(bonus, 0) "BONUS" , to_char(pay * 12 + NVL(bonus,0), '99,999') "TOTAL" from professor where deptno = 201;

select empno, ename, comm, NVL2(comm, 'Exist', 'NULL') "NVL2" from emp where deptno = 30;


select * from student;

select name, jumin, decode(substr(jumin, 7, 1), 1, 'MAN', 'WOMAN') "gender" from student where deptno1 = 101;

select name, tel, decode(substr(tel, 0, instr(tel,')')-1), '02', 'SEOUL'
                                                         , '031', 'GYEONGGI'
                                                         , '051', 'BUSAN'
                                                         , '052', 'ULSAN'
                                                         , '055', 'GYEONGNAM') "LOC" 
                                                                from student where deptno1 = 101;



select empno, ename, sal, case(TRUNC(sal / 1000,0)) when 0 then 'LEVEL 1'
                                          when 1 then 'LEVEL 2'
                                          when 2 then 'LEVEL 3'
                                          when 3 then 'LEVEL 4'
                                                 ELSE 'LEVEL 5'
                                    END "LEVEL"
from emp
order by sal desc;
                                    




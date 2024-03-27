select name, tel, instr(tel, '3')
from student
where deptno1 = 101;

//¹®Á¦1¹ø
select * from student;

select name, tel, substr(tel, 0, instr(tel, ')', 1, 1) - 1) as "AREA CODE" 
from student 
where deptno1 = 201;

select instr(tel, '-', 1, 1) from student;

select name, tel, substr(tel, 1, instr(tel, ')',1, 1)-1) || substr(tel, instr(tel,')',1, 1)+1, instr(tel, '-', 1, 1)- (instr(tel,')',1, 1)+1)) || substr(tel, instr(tel, '-', 1, 1)+1, length(tel) - (instr(tel, '-', 1, 1))) 
from student
where deptno1 = 201;


select name, id, LPAD(id, 10, '*')
from student
where deptno1 = 201;


select * from emp;

select lpad(ename, 9, 1234567) from emp where deptno = 10;

select * from emp;


select rpad(ename, 9, substr('123456789', length(ename)+1, 10)) as "RPAD" from emp where deptno = 10;

select * from emp;


select max(sal+NVL(comm,0)) MAX, 
       min(sal+NVL(comm,0)) MIN, 
       round(avg(sal+NVL(comm,0)), 1) AVG 
       from emp; //group by COMM having;


select * from student;

select substr(birthday, 4, 2) from student;

select concat(count(birthday), 'EA') AS "TOTAL", 
       concat(count(decode(substr(birthday, 4, 2),'01',1,null)), 'EA') as "JAN",
       concat(count(decode(substr(birthday, 4, 2),'02',1,null)), 'EA') as "FEB",
       concat(count(decode(substr(birthday, 4, 2),'03',1,null)), 'EA') as "MAR",
       concat(count(decode(substr(birthday, 4, 2),'04',1,null)), 'EA') as "APR",
       concat(count(decode(substr(birthday, 4, 2),'05',1,null)), 'EA') as "MAY",
       concat(count(decode(substr(birthday, 4, 2),'06',1,null)), 'EA') as "JUN",
       concat(count(decode(substr(birthday, 4, 2),'07',1,null)), 'EA') as "JUL",
       concat(count(decode(substr(birthday, 4, 2),'08',1,null)), 'EA') as "AUG",
       concat(count(decode(substr(birthday, 4, 2),'09',1,null)), 'EA') as "SEP",
       concat(count(decode(substr(birthday, 4, 2),'10',1,null)), 'EA') as "OCT",
       concat(count(decode(substr(birthday, 4, 2),'11',1,null)), 'EA') as "NOV",
       concat(count(decode(substr(birthday, 4, 2),'12',1,null)), 'EA') as "DEC"
from student;




select * from student;

select count(tel) as TOTAL,
       count(decode(substr(tel, 1, instr(tel,')')-1), '02', 1, null)) as "SEOUL",
       count(decode(substr(tel, 1, instr(tel,')')-1), '031', 1, null)) as "GYEONGGI",
       count(decode(substr(tel, 1, instr(tel,')')-1), '051', 1, null)) as "BUSAN",
       count(decode(substr(tel, 1, instr(tel,')')-1), '063', 1, null)) as "ULSAN",
       count(decode(substr(tel, 1, instr(tel,')')-1), '053', 1, null)) as "DAEGU",
       count(decode(substr(tel, 1, instr(tel,')')-1), '055', 1, null)) as "GYEONGNAM"
from student;



insert into emp (empno, deptno, ename, sal)
 values (1000, 10, 'Tiger', 3600);

insert into emp (empno, deptno, ename, sal)
 values (2000, 30, 'Cat', 3000);

commit;

select * from emp;

//4번
select deptno,
    sum(decode(job, 'CLERK', sal, 0)) as "CLERK",
    sum(nvl2(job, sal, 0)) as "TOTAL"
from emp
group by rollup (deptno);

select * from student;

select concat(concat(count(tel), 'EA'), concat('(', (count(tel) - count(tel)) / count(tel))) as "TOTAL",
       concat(concat(count(decode(substr(tel,1,substr(tel,1, instr(tel,')')-1)), '02', 1, null)), 'EA'), 'dfd') as "SEOUL"
from student;
       

//count(안에 들어있는 요소값들을 decode로 가져옴) / count(name) * 100


select * from emp;

select deptno, 
        ename, 
        sal, 
        sum(sal) over(partition by deptno order by sal) as "total"
from emp 
order by deptno desc;

select deptno, ename, sal,
    sum(sal) as "Total_Sal",
    round(sal / sum(sal) * 100, 2)
from emp;

select l_code as "대출종목코드", l_store as "대출지점", l_qty as "대출건수",
    l_total as "대출총액", sum(l_total) over (partition by l_code, l_store order by l_total) as "누적대출금액"
from loan
where l_store = 100;

select deptno, name, pay,
    sum(pay) over() as "Total pay",
    round(sum(pay) / sum(pay) over() * 100, 2) as "Ratio %"
from professor
group by deptno, name, pay
order by 5 desc;



//(sal / sum(sal)) * 100 as "%"
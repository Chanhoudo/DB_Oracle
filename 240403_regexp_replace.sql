select * from student;

select text, regexp_replace(text, '[[:digit:]]', '*') "NO -> CHAR"
from t_reg;

select no, ip, regexp_replace(ip, '\.', '') "Dot Remove"
from t_reg2;

select regexp_replace('aaa  bbb', '( ) {1,}', '') as "Regexp"
from dual;

select regexp_replace('aaa bbb', '() {2,}', '') as "one"
from dual;

select regexp_replace('aaa  bbb', '() {2,}', '') as "two"
from dual;



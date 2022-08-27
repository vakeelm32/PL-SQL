Declaring & Initializing & Using Variables (Code Samples)
-----------------------DECLARING VARIABLES-----------------------
SET SERVEROUTPUT ON;
DECLARE 
    v varchar2(20) := 2 + 25 * 3;
BEGIN
    dbms_output.put_line(v);
END;
-----------------------===================-----------------------
DECLARE 
    v_text varchar2(50) NOT NULL DEFAULT 'Hello';
    v_number1 number := 50;
    v_number2 number(2) := 50.42;
    v_number3 number(10,2) := 50.42;
    v_number4 PLS_INTEGER := 50;
    v_number5 BINARY_float := 50.42;
    v_DATE1 DATE := '22-NOV-18 12:01:32';
    v_DATE2 timestamp := systimestamp;
    v_DATE3 timestamp(9) WITH TIME ZONE := systimestamp;
    v_DATE4 interval day(4) to second (3) := '124 02:05:21.012 ';
    v_DATE5 interval year to month := '12-3';
BEGIN
    V_TEXT := 'PL/SQL' || 'Course';
    DBMS_OUTPUT.PUT_LINE(V_TEXT);
    DBMS_OUTPUT.PUT_LINE(v_number1);
    DBMS_OUTPUT.PUT_LINE(v_number2);
    DBMS_OUTPUT.PUT_LINE(v_number3);
    DBMS_OUTPUT.PUT_LINE(v_number4);
    DBMS_OUTPUT.PUT_LINE(v_number5);
    DBMS_OUTPUT.PUT_LINE(v_DATE1);
    DBMS_OUTPUT.PUT_LINE(v_DATE2);
    DBMS_OUTPUT.PUT_LINE(v_DATE3);
    DBMS_OUTPUT.PUT_LINE(v_DATE4);
    DBMS_OUTPUT.PUT_LINE(v_DATE5);
    END;
----------------==================================---------------
----------------USING BOOLEAN DATA TYPE in PL/SQL----------------
----------------==================================---------------
DECLARE
    v_boolean boolean := true;
BEGIN
    dbms_output.put_line(sys.diutil.bool_to_int(v_boolean));
END;
----------------==================================---------------
Using %Type Attribute (Code Samples)
---------------------%TYPE ATTRIBUTE---------------------
desc employees;
declare
V_TYPE employees.JOB_ID%TYPE;
V_TYPE2 V_TYPE%TYPE;
V_TYPE3 employees.JOB_ID%TYPE ;
begin
v_type := 'IT_PROG';
v_type2 := 'SA_MAN';
v_type3 := NULL;
dbms_output.put_line(v_type);
dbms_output.put_line(v_type2);
dbms_output.put_line('HELLO' || v_type3);
end;
---------------------------------------------------------
PL/SQL Delimiters and Commenting (Code Samples)
------------------DELIMITERS AND COMMENTING------------------
DECLARE
V_TEXT VARCHAR2(10):= 'PL/SQL';
BEGIN
--This is a single line comment
/* This is a 
    multi line
    comment */
--DBMS_OUTPUT.PUT_LINE(V_TEXT || ' is a good language');
null;
END;
-------------------------------------------------------------
PL SQL Variable Scope (Code Samples)
------------------------VARIABLE SCOPE--------------------------
begin <<outer>>
DECLARE
  --v_outer VARCHAR2(50) := 'Outer Variable!';
  v_text  VARCHAR2(20) := 'Out-text';
BEGIN 
  DECLARE
    v_text  VARCHAR2(20) := 'In-text';
    v_inner VARCHAR2(30) := 'Inner Variable';
  BEGIN
    --dbms_output.put_line('inside -> ' || v_outer);
    --dbms_output.put_line('inside -> ' || v_inner);
      dbms_output.put_line('inner -> ' || v_text);
      dbms_output.put_line('outer -> ' || outer.v_text);
  END;
  --dbms_output.put_line('inside -> ' || v_inner);
  --dbms_output.put_line(v_outer);
  dbms_output.put_line(v_text);
END;
END outer;
----------------------------------------------------------------
Using Bind Variables (Code Samples)
--------------------------BIND VARIABLES--------------------------
set serveroutput on;
set autoprint on;
/
variable var_text varchar2(30);
/
variable var_number NUMBER;
/
variable var_date DATE;
/
declare
v_text varchar2(30);
begin
:var_text := 'Hello SQL';
:var_number := 20;
v_text := :var_text;
--dbms_output.put_line(v_text);
--dbms_output.put_line(:var_text);
end;
/
print var_text;
/
variable var_sql number;
/
begin 
  :var_sql := 100;
end;
/
select * from employees where employee_id = :var_sql;
 
--NOTE: When you run a bind variable creation and select statement together,SQL Developer may return an error.But when you execute them separately, there will be no problem

What are Control Structures & IF Statements (Code Samples)
------------------------------IF STATEMENTS--------------------------------
set serveroutput on;
declare
v_number number := 30;
begin
  if v_number < 10 then
    dbms_output.put_line('I am smaller than 10');
  elsif v_number < 20 then
    dbms_output.put_line('I am smaller than 20');
  elsif v_number < 30 then
    dbms_output.put_line('I am smaller than 30');
  else
    dbms_output.put_line('I am equal or greater than 30');
  end if;
end;
---------------------------------------------------------------------------
declare
v_number number := 5;
v_name varchar2(30) := 'Adam';
begin
  if v_number < 10 or v_name = 'Carol' then
    dbms_output.put_line('HI');
    dbms_output.put_line('I am smaller than 10');
  elsif v_number < 20 then
    dbms_output.put_line('I am smaller than 20');
  elsif v_number < 30 then
    dbms_output.put_line('I am smaller than 30');
  else
    if v_number is null then 
      dbms_output.put_line('The number is null..');
    else
      dbms_output.put_line('I am equal or greater than 30');
    end if;
  end if;
end;
---------------------------------------------------------------------------
Case Expressions (Code Samples)
----------------------------CASE EXPRESSIONS--------------------------------
declare
  v_job_code varchar2(10) := 'SA_MAN';
  v_salary_increase number;
begin
  v_salary_increase := case v_job_code 
    when 'SA_MAN' then 0.2
    when 'SA_REP' then 0.3
    else 0
  end;
  dbms_output.put_line('Your salary increase is : '|| v_salary_increase);
end;
-------------------------SEARCHED CASE EXPRESSION----------------------------
declare
  v_job_code varchar2(10) := 'IT_PROG';
  v_department varchar2(10) := 'IT';
  v_salary_increase number;
begin
  v_salary_increase := case  
    when v_job_code = 'SA_MAN' then 0.2
    when v_department = 'IT' and v_job_code = 'IT_PROG' then 0.3
    else 0
  end;
  dbms_output.put_line('Your salary increase is : '|| v_salary_increase);
end;
---------------------------CASE STATEMENTS------------------------------------
declare
  v_job_code varchar2(10) := 'IT_PROG';
  v_department varchar2(10) := 'IT';
  v_salary_increase number;
begin
  case  
    when v_job_code = 'SA_MAN' then 
      v_salary_increase := 0.2;
      dbms_output.put_line('The salary increase for a Sales Manager is : '|| v_salary_increase);
    when v_department = 'IT' and v_job_code = 'IT_PROG' then 
      v_salary_increase := 0.2;
      dbms_output.put_line('The salary increase for a Sales Manager is : '|| v_salary_increase);
    else 
      v_salary_increase := 0;
      dbms_output.put_line('The salary increase for this job code is : '|| v_salary_increase);
  end CASE;
end;
-------------------------------------------------------------------------------
Basic Loops (Code Samples)
-------------------------BASIC LOOPS--------------------------
declare
v_counter number(2) := 1;
begin
  loop
    dbms_output.put_line('My counter is : '|| v_counter);
    v_counter := v_counter + 1;
    --if v_counter = 10 then
    --  dbms_output.put_line('Now I reached : '|| v_counter);
    --  exit;
    --end if;
    exit when v_counter > 10;
  end loop;
end;
--------------------------------------------------------------
While Loops (Code Samples)
------------------------------WHILE LOOPS-------------------------------
declare
v_counter number(2) := 1;
begin
  while v_counter <= 10 loop
    dbms_output.put_line('My counter is : '|| v_counter);
    v_counter := v_counter + 1;
   -- exit when v_counter > 3;
  end loop;
end;
-------------------------------------------------------------------------
For Loops (Code Samples)
-----------------------------FOR LOOPS-----------------------------
begin
  for i in REVERSE 1..3 loop
    dbms_output.put_line('My counter is : '|| i);
  end loop;
end;
-------------------------------------------------------------------
Nested Loops & Loop Labeling (Code Samples)
-------------------------------NESTED LOOPS-----------------------------------
declare
 v_inner number := 1;
begin
 for v_outer in 1..5 loop
  dbms_output.put_line('My outer value is : ' || v_outer );
    v_inner := 1;
    loop
      v_inner := v_inner+1;
      dbms_output.put_line('  My inner value is : ' || v_inner );
      exit when v_inner*v_outer >= 15;
    end loop;
 end loop;
end;
-------------------------NESTED LOOPS WITH LABELS------------------------------
declare
 v_inner number := 1;
begin
<<outer_loop>>
 for v_outer in 1..5 loop
  dbms_output.put_line('My outer value is : ' || v_outer );
    v_inner := 1;
    <<inner_loop>>
    loop
      v_inner := v_inner+1;
      dbms_output.put_line('  My inner value is : ' || v_inner );
      exit outer_loop when v_inner*v_outer >= 16;
      exit when v_inner*v_outer >= 15;
    end loop inner_loop;
 end loop outer_loop;
end;
--------------------------------------------------------------------------------
Continue Statement (Code Samples)
----------------------------CONTINUE STATEMENT----------------------------------
declare
 v_inner number := 1;
begin
 for v_outer in 1..10 loop
  dbms_output.put_line('My outer value is : ' || v_outer );
    v_inner := 1;
    while v_inner*v_outer < 15 loop
      v_inner := v_inner+1;
      continue when mod(v_inner*v_outer,3) = 0;
      dbms_output.put_line('  My inner value is : ' || v_inner );
    end loop;
 end loop;
end;
---------------------------------------------------------------------------------
declare
 v_inner number := 1;
begin
<<outer_loop>>
 for v_outer in 1..10 loop
  dbms_output.put_line('My outer value is : ' || v_outer );
    v_inner := 1;
    <<inner_loop>>
    loop
      v_inner := v_inner+1;
      continue outer_loop when v_inner = 10;
      dbms_output.put_line('  My inner value is : ' || v_inner );
    end loop inner_loop;
 end loop outer_loop;
end;
----------------------------------------------------------------------------------
GOTO Statement (Code Samples)
------------------------------GOTO STATEMENT----------------------------------
DECLARE
  v_searched_number NUMBER := 22;
  v_is_prime boolean := true;
BEGIN
  FOR x in 2..v_searched_number-1 LOOP
    IF v_searched_number MOD x = 0 THEN
      dbms_output.put_line(v_searched_number|| ' is not a prime number..');
      v_is_prime := false;
      GOTO end_point;
    END IF;
  END LOOP;
  if v_is_prime then
    dbms_output.put_line(v_searched_number|| ' is a prime number..');
  end if;
<<end_point>>
  dbms_output.put_line('Check complete..');
END;
-------------------------------------------------------------------------------
DECLARE
  v_searched_number NUMBER := 32457;
  v_is_prime boolean := true;
  x number := 2;
BEGIN
  <<start_point>>
    IF v_searched_number MOD x = 0 THEN
      dbms_output.put_line(v_searched_number|| ' is not a prime number..');
      v_is_prime := false;
      GOTO end_point;
    END IF;
  x := x+1;
  if x = v_searched_number then
   goto prime_point;
  end if;
  goto start_point;
  <<prime_point>>
  if v_is_prime then
    dbms_output.put_line(v_searched_number|| ' is a prime number..');
  end if;
<<end_point>>
  dbms_output.put_line('Check complete..');
END;
---------------------------------------------------------------------------------

Using Explicit Cursors (Code Samples)
declare
  cursor c_emps is select first_name,last_name from employees;
  v_first_name employees.first_name%type;
  v_last_name employees.last_name%type;
begin
  open c_emps;
  fetch c_emps into v_first_name,v_last_name;
  fetch c_emps into v_first_name,v_last_name;
  fetch c_emps into v_first_name,v_last_name;
  dbms_output.put_line(v_first_name|| ' ' || v_last_name);
  fetch c_emps into v_first_name,v_last_name;
  dbms_output.put_line(v_first_name|| ' ' || v_last_name);
  close c_emps;
end;
--------------- cursor with join example
declare
  cursor c_emps is select first_name,last_name, department_name from employees
                      join departments using (department_id)
                      where department_id between 30 and 60;
  v_first_name employees.first_name%type;
  v_last_name employees.last_name%type;
  v_department_name departments.department_name%type;
begin
  open c_emps;
  fetch c_emps into v_first_name, v_last_name,v_department_name;
  dbms_output.put_line(v_first_name|| ' ' || v_last_name|| ' in the department of '|| v_department_name);
  close c_emps;
end;

-----------------------------------------------
Cursors with Records (Code Samples)
declare
  type r_emp is record (  v_first_name employees.first_name%type,
                           v_last_name employees.last_name%type);
  v_emp r_emp;
  cursor c_emps is select first_name,last_name from employees;
begin
  open c_emps;
  fetch c_emps into v_emp;
  dbms_output.put_line(v_emp.v_first_name|| ' ' || v_emp.v_last_name);
  close c_emps;
end;
--------------- An example for using cursors table rowtype
declare
  v_emp employees%rowtype;
  cursor c_emps is select first_name,last_name from employees;
begin
  open c_emps;
  fetch c_emps into v_emp.first_name,v_emp.last_name;
  dbms_output.put_line(v_emp.first_name|| ' ' || v_emp.last_name);
  close c_emps;
end;
--------------- An example for using cursors with cursor%rowtype.
declare
  cursor c_emps is select first_name,last_name from employees;
  v_emp c_emps%rowtype;
begin
  open c_emps;
  fetch c_emps into v_emp.first_name,v_emp.last_name;
  dbms_output.put_line(v_emp.first_name|| ' ' || v_emp.last_name);
  close c_emps;
end;
-----------------------------------------------------------------
Looping with Cursors (Code Samples)
declare
  cursor c_emps is select * from employees where department_id = 30;
  v_emps c_emps%rowtype;
begin
  open c_emps;
	  loop
		fetch c_emps into v_emps;
		dbms_output.put_line(v_emps.employee_id|| ' ' ||v_emps.first_name|| ' ' ||v_emps.last_name);
	  end loop;
  close c_emps;
end; 
---------------%notfound example
declare
  cursor c_emps is select * from employees where department_id = 30;
  v_emps c_emps%rowtype;
begin
  open c_emps;
	  loop
		fetch c_emps into v_emps;
		exit when c_emps%notfound;
		dbms_output.put_line(v_emps.employee_id|| ' ' ||v_emps.first_name|| ' ' ||v_emps.last_name);
	  end loop;
  close c_emps;
end;
---------------while loop example
declare
  cursor c_emps is select * from employees where department_id = 30;
  v_emps c_emps%rowtype;
begin
  open c_emps;
  fetch c_emps into v_emps;
	  while c_emps%found loop
		dbms_output.put_line(v_emps.employee_id|| ' ' ||v_emps.first_name|| ' ' ||v_emps.last_name);
		fetch c_emps into v_emps;
		--exit when c_emps%notfound;
	  end loop;
  close c_emps;
end;
---------------for loop with cursor example
declare
  cursor c_emps is select * from employees where department_id = 30;
  v_emps c_emps%rowtype;
begin
  open c_emps;
	  for i in 1..6 loop
		fetch c_emps into v_emps;
		dbms_output.put_line(v_emps.employee_id|| ' ' ||v_emps.first_name|| ' ' ||v_emps.last_name);
	  end loop;
  close c_emps;
end;
---------------FOR..IN clause example
declare
  cursor c_emps is select * from employees where department_id = 30;
begin
  for i in c_emps loop
    dbms_output.put_line(i.employee_id|| ' ' ||i.first_name|| ' ' ||i.last_name);
  end loop;
end;
---------------FOR..IN with select example
begin
  for i in (select * from employees where department_id = 30) loop
    dbms_output.put_line(i.employee_id|| ' ' ||i.first_name|| ' ' ||i.last_name);
  end loop;
end;

-----------------------------Parameters--------------------------------------------------
PL SQL Cursors with Parameters (Code Samples)
declare
  cursor c_emps (p_dept_id number) is select first_name,last_name,department_name 
                    from employees join departments using (department_id)
                    where department_id = p_dept_id;
  v_emps c_emps%rowtype;
begin
  open c_emps(20);
  fetch c_emps into v_emps;
    dbms_output.put_line('The employees in department of '|| v_emps.department_name|| ' are :');
    close c_emps;
  open c_emps(20);
    loop
      fetch c_emps into v_emps;
      exit when c_emps%notfound;
      dbms_output.put_line(v_emps.first_name|| ' ' ||v_emps.last_name);
    end loop;
  close c_emps;
end;
--------------- bind variables as parameters
declare
  cursor c_emps (p_dept_id number) is select first_name,last_name,department_name 
                    from employees join departments using (department_id)
                    where department_id = p_dept_id;
  v_emps c_emps%rowtype;
begin
  open c_emps(:b_emp);
  fetch c_emps into v_emps;
    dbms_output.put_line('The employees in department of '|| v_emps.department_name|| ' are :');
    close c_emps;
  open c_emps(:b_emp);
    loop
      fetch c_emps into v_emps;
      exit when c_emps%notfound;
      dbms_output.put_line(v_emps.first_name|| ' ' ||v_emps.last_name);
    end loop;
  close c_emps;
end;
---------------cursors with two different parameters
declare
  cursor c_emps (p_dept_id number) is select first_name,last_name,department_name 
                    from employees join departments using (department_id)
                    where department_id = p_dept_id;
  v_emps c_emps%rowtype;
begin
  open c_emps(:b_dept_id);
  fetch c_emps into v_emps;
    dbms_output.put_line('The employees in department of '|| v_emps.department_name|| ' are :');
    close c_emps;
  open c_emps(:b_dept_id);
    loop
      fetch c_emps into v_emps;
      exit when c_emps%notfound;
      dbms_output.put_line(v_emps.first_name|| ' ' ||v_emps.last_name);
    end loop;
  close c_emps;
  
  open c_emps(:b_dept_id2);
  fetch c_emps into v_emps;
    dbms_output.put_line('The employees in department of '|| v_emps.department_name|| ' are :');
    close c_emps;
  open c_emps(:b_dept_id2);
    loop
      fetch c_emps into v_emps;
      exit when c_emps%notfound;
      dbms_output.put_line(v_emps.first_name|| ' ' ||v_emps.last_name);
    end loop;
  close c_emps;
end;
--------------- cursor with parameters - for in loops
declare
  cursor c_emps (p_dept_id number) is select first_name,last_name,department_name 
                    from employees join departments using (department_id)
                    where department_id = p_dept_id;
  v_emps c_emps%rowtype;
begin
  open c_emps(:b_dept_id);
  fetch c_emps into v_emps;
    dbms_output.put_line('The employees in department of '|| v_emps.department_name|| ' are :');
    close c_emps;
  open c_emps(:b_dept_id);
    loop
      fetch c_emps into v_emps;
      exit when c_emps%notfound;
      dbms_output.put_line(v_emps.first_name|| ' ' ||v_emps.last_name);
    end loop;
  close c_emps;
  
  open c_emps(:b_dept_id2);
  fetch c_emps into v_emps;
    dbms_output.put_line('The employees in department of '|| v_emps.department_name|| ' are :');
  close c_emps;
    
    for i in c_emps(:b_dept_id2) loop
      dbms_output.put_line(i.first_name|| ' ' ||i.last_name);
    end loop;
end;
---------------cursors with multiple parameters
declare
  cursor c_emps (p_dept_id number , p_job_id varchar2) is select first_name,last_name,job_id,department_name 
                    from employees join departments using (department_id)
                    where department_id = p_dept_id
                    and job_id = p_job_id;
  v_emps c_emps%rowtype;
begin
    for i in c_emps(50,'ST_MAN') loop
      dbms_output.put_line(i.first_name|| ' ' ||i.last_name|| ' - ' || i.job_id);
    end loop;
    dbms_output.put_line(' - ');
    for i in c_emps(80,'SA_MAN') loop
      dbms_output.put_line(i.first_name|| ' ' ||i.last_name|| ' - ' || i.job_id);
    end loop;
end;
--------------- An error example of using parameter name with the column name
declare
  cursor c_emps (p_dept_id number , job_id varchar2) is select first_name,last_name,job_id,department_name 
                    from employees join departments using (department_id)
                    where department_id = p_dept_id
                    and job_id = job_id;
  v_emps c_emps%rowtype;
begin
    for i in c_emps(50,'ST_MAN') loop
      dbms_output.put_line(i.first_name|| ' ' ||i.last_name|| ' - ' || i.job_id);
    end loop;
    dbms_output.put_line(' - ');
    for i in c_emps(80,'SA_MAN') loop
      dbms_output.put_line(i.first_name|| ' ' ||i.last_name|| ' - ' || i.job_id);
    end loop;
end;
---------------------------Cursor Attributes-------------------------------------------
PL SQL Cursor Attributes (Code Samples)
declare
  cursor c_emps is select * from employees where department_id = 50;
  v_emps c_emps%rowtype;
begin
  if not c_emps%isopen then
    open c_emps;
    dbms_output.put_line('hello');
  end if;
  dbms_output.put_line(c_emps%rowcount);
  fetch c_emps into v_emps;
  dbms_output.put_line(c_emps%rowcount);
  dbms_output.put_line(c_emps%rowcount);
  fetch c_emps into v_emps;
  dbms_output.put_line(c_emps%rowcount);
  close c_emps;
  
  open c_emps;
    loop
      fetch c_emps into v_emps;
      exit when c_emps%notfound or c_emps%rowcount>5;
      dbms_output.put_line(c_emps%rowcount|| ' ' ||v_emps.first_name|| ' ' ||v_emps.last_name);
    end loop;
  close c_emps;
end;
-------------------------------Update clasue---------------------------------------------
For Update Clause (Code Samples)
grant create session to my_user;
grant select any table to my_user;
grant update on hr.employees_copy to my_user;
grant update on hr.departments to my_user;
UPDATE EMPLOYEES_COPY SET PHONE_NUMBER = '1' WHERE EMPLOYEE_ID = 100;
declare
  cursor c_emps is select employee_id,first_name,last_name,department_name
      from employees_copy join departments using (department_id)
      where employee_id in (100,101,102)
      for update;
begin
  /* for r_emps in c_emps loop
    update employees_copy set phone_number = 3
      where employee_id = r_emps.employee_id; 
  end loop; */
  open c_emps;
end;
--------------- example of wait with second
declare
  cursor c_emps is select employee_id,first_name,last_name,department_name
      from employees_copy join departments using (department_id)
      where employee_id in (100,101,102)
      for update of employees_copy.phone_number, 
      departments.location_id wait 5;
begin
  /* for r_emps in c_emps loop
    update employees_copy set phone_number = 3
      where employee_id = r_emps.employee_id; 
  end loop; */
  open c_emps;
end;
---------------example of nowait
declare
  cursor c_emps is select employee_id,first_name,last_name,department_name
      from employees_copy join departments using (department_id)
      where employee_id in (100,101,102)
      for update of employees_copy.phone_number, 
      departments.location_id nowait;
begin
  /* for r_emps in c_emps loop
    update employees_copy set phone_number = 3
      where employee_id = r_emps.employee_id; 
  end loop; */
  open c_emps;
end;
------------------------Where Current Of Clause-----------------------------------------------------

Where Current Of Clause (Code Samples)
declare
  cursor c_emps is select * from employees 
                    where department_id = 30 for update;
begin
  for r_emps in c_emps loop
    update employees set salary = salary + 60
          where current of c_emps;
  end loop;  
end;
---------------Wrong example of using where current of clause
declare
  cursor c_emps is select e.* from employees e, departments d
                    where 
                    e.department_id = d.department_id
                    and e.department_id = 30 for update;
begin
  for r_emps in c_emps loop
    update employees set salary = salary + 60
          where current of c_emps;
  end loop;  
end;
---------------An example of using rowid like where current of clause
declare
  cursor c_emps is select e.rowid,e.salary from employees e, departments d
                    where 
                    e.department_id = d.department_id
                    and e.department_id = 30 for update;
begin
  for r_emps in c_emps loop
    update employees set salary = salary + 60
          where rowid = r_emps.rowid;
  end loop;  
end;
-----------------------------Reference-------------------------------------------
Reference Cursors - (Code Samples)
declare
 type t_emps is ref cursor return employees%rowtype;
 rc_emps t_emps;
 r_emps employees%rowtype;
begin
  open rc_emps for select * from employees;
    loop
      fetch rc_emps into r_emps;
      exit when rc_emps%notfound;
      dbms_output.put_line(r_emps.first_name|| ' ' || r_emps.last_name);
    end loop;
  close rc_emps;
end;
--------------- in two different queries
declare
 type t_emps is ref cursor return employees%rowtype;
 rc_emps t_emps;
 r_emps employees%rowtype;
begin
  open rc_emps for select * from retired_employees;
    loop
      fetch rc_emps into r_emps;
      exit when rc_emps%notfound;
      dbms_output.put_line(r_emps.first_name|| ' ' || r_emps.last_name);
    end loop;
  close rc_emps;
  
  dbms_output.put_line('--------------');
  
  open rc_emps for select * from employees where job_id = 'IT_PROG';
    loop
      fetch rc_emps into r_emps;
      exit when rc_emps%notfound;
      dbms_output.put_line(r_emps.first_name|| ' ' || r_emps.last_name);
    end loop;
  close rc_emps;
end;
---------------Example of using with %type when declaring records first
declare
  r_emps employees%rowtype;
 type t_emps is ref cursor return r_emps%type;
 rc_emps t_emps;
 --type t_emps2 is ref cursor return rc_emps%rowtype;
begin
  open rc_emps for select * from retired_employees;
    loop
      fetch rc_emps into r_emps;
      exit when rc_emps%notfound;
      dbms_output.put_line(r_emps.first_name|| ' ' || r_emps.last_name);
    end loop;
  close rc_emps;
  
  dbms_output.put_line('--------------');
  
  open rc_emps for select * from employees where job_id = 'IT_PROG';
    loop
      fetch rc_emps into r_emps;
      exit when rc_emps%notfound;
      dbms_output.put_line(r_emps.first_name|| ' ' || r_emps.last_name);
    end loop;
  close rc_emps;
end;
---------------manually declared record type with cursors example
declare
  type ty_emps is record (e_id number, 
                         first_name employees.last_name%type, 
                         last_name employees.last_name%type,
                         department_name departments.department_name%type);
 r_emps ty_emps;
 type t_emps is ref cursor return ty_emps;
 rc_emps t_emps;
begin
  open rc_emps for select employee_id,first_name,last_name,department_name 
                      from employees join departments using (department_id);
    loop
      fetch rc_emps into r_emps;
      exit when rc_emps%notfound;
      dbms_output.put_line(r_emps.first_name|| ' ' || r_emps.last_name|| 
            ' is at the department of : '|| r_emps.department_name );
    end loop;
  close rc_emps;
end;
---------------first example of weak ref cursors
declare
  type ty_emps is record (e_id number, 
                         first_name employees.last_name%type, 
                         last_name employees.last_name%type,
                         department_name departments.department_name%type);
 r_emps ty_emps;
 type t_emps is ref cursor;
 rc_emps t_emps;
 q varchar2(200);
begin
  q := 'select employee_id,first_name,last_name,department_name 
                      from employees join departments using (department_id)';
  open rc_emps for q;
    loop
      fetch rc_emps into r_emps;
      exit when rc_emps%notfound;
      dbms_output.put_line(r_emps.first_name|| ' ' || r_emps.last_name|| 
            ' is at the department of : '|| r_emps.department_name );
    end loop;
  close rc_emps;
end;
--------------- bind variables with cursors example
declare
  type ty_emps is record (e_id number, 
                         first_name employees.last_name%type, 
                         last_name employees.last_name%type,
                         department_name departments.department_name%type);
 r_emps ty_emps;
 type t_emps is ref cursor;
 rc_emps t_emps;
 r_depts departments%rowtype;
 --r t_emps%rowtype;
 q varchar2(200);
begin
  q := 'select employee_id,first_name,last_name,department_name 
                      from employees join departments using (department_id)
                      where department_id = :t';
  open rc_emps for q using '50';
    loop
      fetch rc_emps into r_emps;
      exit when rc_emps%notfound;
      dbms_output.put_line(r_emps.first_name|| ' ' || r_emps.last_name|| 
            ' is at the department of : '|| r_emps.department_name );
    end loop;
  close rc_emps;
  
  open rc_emps for select * from departments;
    loop
      fetch rc_emps into r_depts;
      exit when rc_emps%notfound;
      dbms_output.put_line(r_depts.department_id|| ' ' || r_depts.department_name);
    end loop;
  close rc_emps;
end;
---------------sys_refcursor example
declare
  type ty_emps is record (e_id number, 
                         first_name employees.last_name%type, 
                         last_name employees.last_name%type,
                         department_name departments.department_name%type);
 r_emps ty_emps;
-- type t_emps is ref cursor;
 rc_emps sys_refcursor;
 r_depts departments%rowtype;
 --r t_emps%rowtype;
 q varchar2(200);
begin
  q := 'select employee_id,first_name,last_name,department_name 
                      from employees join departments using (department_id)
                      where department_id = :t';
  open rc_emps for q using '50';
    loop
      fetch rc_emps into r_emps;
      exit when rc_emps%notfound;
      dbms_output.put_line(r_emps.first_name|| ' ' || r_emps.last_name|| 
            ' is at the department of : '|| r_emps.department_name );
    end loop;
  close rc_emps;
  
  open rc_emps for select * from departments;
    loop
      fetch rc_emps into r_depts;
      exit when rc_emps%notfound;
      dbms_output.put_line(r_depts.department_id|| ' ' || r_depts.department_name);
    end loop;
  close rc_emps;
end;
---------------------------------------------------------------------------

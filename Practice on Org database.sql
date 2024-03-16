/*create database org;
use org;
CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME VARCHAR(25),
	LAST_NAME VARCHAR(25),
	SALARY INT,
	JOINING_DATE DATETIME,
	DEPARTMENT VARCHAR(25)
);
INSERT INTO Worker 
  (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
   (001, 'Monika', 'Arora', 100000, '21-02-20 09:00:00', 'HR'),
   (002, 'Niharika', 'Verma', 80000, '21-06-11 09:00:00', 'Admin'),
   (003, 'Vishal', 'Singhal', 300000, '21-02-20 09:00:00', 'HR'),
   (004, 'Amitabh', 'Singh', 500000, '21-02-20 09:00:00', 'Admin'),
   (005, 'Vivek', 'Bhati', 500000, '21-06-11 09:00:00', 'Admin'),
   (006, 'Vipul', 'Diwan', 200000, '21-06-11 09:00:00', 'Account'),
   (007, 'Satish', 'Kumar', 75000, '21-01-20 09:00:00', 'Account'),
   (008, 'Geetika', 'Chauhan', 90000, '21-04-11 09:00:00', 'Admin');
select * from worker;
CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT,
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);
INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '23-02-20'),
		(002, 3000, '23-06-11'),
		(003, 4000, '23-02-20'),
		(001, 4500, '23-02-20'),
		(002, 3500, '23-06-11');
select * from bonus;
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2023-02-20 00:00:00'),
 (002, 'Executive', '2023-06-11 00:00:00'),
 (008, 'Executive', '2023-06-11 00:00:00'),
 (005, 'Manager', '2023-06-11 00:00:00'),
 (004, 'Asst. Manager', '2023-06-11 00:00:00'),
 (007, 'Executive', '2023-06-11 00:00:00'),
 (006, 'Lead', '2023-06-11 00:00:00'),
 (003, 'Lead', '2023-06-11 00:00:00');
 select * from bonus,title,worker;*/
 -- 1
 select first_name as WORKER_NAME from worker;
 -- 2
 select upper(First_name) from worker;
 -- 3
 select distinct(department) from worker;
 -- 4 to print first 3 characters of first_name
 select substring(first_name,1,3) from worker;
 -- 5
 select instr(first_name,binary'b') from worker where first_name='amitabh';
 -- 6 to remove white spaces after the name
 select rtrim(first_name) from worker;
 -- 7
 select distinct length(department) from worker;
 -- 8
 select replace(first_name,'a','a') from worker;
 -- 9
 select concat(first_name,' ',last_name) as complete_name from worker;
 -- 10
 select * from worker order by first_name asc;
 -- 11
 select * from worker order by first_name asc, department desc;
 -- 12
 select * from worker where first_name in("vipul","satish");
 -- 13
 select * from worker where first_name not in ("vipul","satish");
 -- 14
 select * from worker where department="admin";
 -- 15
 select * from worker where first_name like'%h%';
 -- 16
  select * from worker where first_name like'%a';
  -- 17
   select * from worker where first_name like'%a_';
-- 18
 select * from worker where first_name like'_____h';
 -- 19
  select * from worker where salary between 100000 and 500000;
  -- 20
   select * from worker where joining_date between "2021-02-01" and "2021-02-28 23:59:59";
-- 21
select department,count(*) from worker where department="admin" group by department;
-- 22
select concat(first_name, ' ',last_name) as worker_name from worker 
where worker_id in
(select worker_id from worker where salary between 50000 and 100000);

 -- Q-23. Write an SQL query to fetch the number of workers for each department in descending order.
select department,count(*) as no_of_workers from worker
 group by department order by no_of_workers desc;
 
-- Q-24. Write an SQL query to print details of the Workers who are also Managers.
select w.* from worker as w inner join title as t 
on w.worker_id=t.worker_ref_id where worker_title="manager";

-- Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
select worker_title,affected_from,count(*)  from title group by worker_title,affected_from having count(*)>1;

-- Q-26. Write an SQL query to show only odd rows from a table.
select * from worker where worker_id%2 !=0;

-- Q-28. Write an SQL query to clone a new table from another table.
CREATE TABLE worker_clone LIKE worker;

-- to insert data into cloned table
insert into worker_clone select * from worker_clone ;

-- Q-29. Write an SQL query to fetch intersecting records of two tables.
select w.*,t.* from worker as w join title as t on w.worker_id=t.worker_ref_id;

-- Q-30. Write an SQL query to show records from one table that another table does not have
select worker_ref_id from title where worker_ref_id not in (select worker_ref_id from bonus);

-- Q-31. Write an SQL query to show the current date and time.
select curtime();
select current_timestamp();
select now();
select sysdate() from dual;

-- Q-32. Write an SQL query to show the top n (say 10) records of a table.
select * from worker order by salary desc limit 5;
 
 -- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
select * from (select *,dense_rank() over(order by salary desc) as top_sal from worker) as high_sal where top_sal=2;
select *,dense_rank() over(order by salary desc) as top_sal from worker;

-- Q-35. Write an SQL query to fetch the list of employees with the same salary.
select  w.worker_id,w.first_name,w.salary from worker as w, worker as w1 where w.salary=w1.salary and w.worker_id!=w1.worker_id;

-- Q-36. Write an SQL query to show the second-highest salary from a table.
select min(salary) from (select * from worker order by salary desc limit 2) as w;
select max(salary) from worker where salary not in (select max(salary) from worker);

-- 

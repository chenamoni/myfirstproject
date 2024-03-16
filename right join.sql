/*select * from employee;
select * from 2023_hike;
select * from department;


create table orders (
order_id int,
name varchar(255),
location varchar(255));

desc orders;

insert into orders (order_id,name,location)
 values (4, 'achyuth', 'kagaznagar');
 update orders set location='adilabad' where name='vamshi';
 alter table employee change column id eid int(120); 
  update  employee set department='eee' where id=105;
 -- group by clause
 select department,sum(salary) as salary from employee group by department having salary>20000;*/
 use chandu;
 show tables;
insert into employee values (105,'Vamshi','Mech',25000);

 -- cross  join
 select * from department cross join employee;
 
 -- left join
select * from employee as t1
 left join department as t2 
 on t1.department=t2.dept_name;
 
 -- full outer join
 select * from employee as t1
left join department as t2
on t1.department=t2.dept_name
union 
select * from employee as t1
right join department as t2
on t1.department=t2.dept_name;
 
 -- self join
 select * from 
 
select * from 2023_hike;
select * from department;
select * from employee; 

select t1.*,t2.location,t3.bonus,t3.hike_amount from employee as t1
inner join department as t2 on t1.id=t2.id
inner join 2023_hike as t3 on t2.id=t3.id;



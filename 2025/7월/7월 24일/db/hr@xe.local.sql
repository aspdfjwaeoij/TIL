-- 01. 전체 사원수
select count(*) from employees; -- count: 행의 갯수

-- 02. 전체 사원수 - 부서번호: 10
select count(*)
from employees
where department_id = 50;

-- 03. 전체 사원
select *
from employees;

-- 04. 사원번호로 사원정보 출력
select *
from employees
where employee_id = 200;

-- 05 사원 신규 등록
select sysdate from dual;

insert into employees
(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values
(1000, 'first_name', 'last_name', 'email', 'phone_number', sysdate, 'SA_REP', 90000, 0.1, 100, 30);

-- 06. 사원 정보 수정
update employees
set first_name = 'fn', last_name = 'ln', email='em'
where employee_id=1000;

select * from employees;

-- 07. 사원 정보 삭제
delete from employees
where employee_id=1000 and email='em';

-- 08. job history 삭제
delete from job_history
where employee_id=1000;

-- 09. 부서 정보 출력
select department_id as departmentId, department_name as departmentName
from departments;

-- 10. 직책 정보 출력
select job_id as jobId, job_title as jobTitle
from jobs;

-- 11. 매니저 출력
-- 부쿼리(sub query)
select employee_id, first_name, manager_id,
(select first_name from employees e2 where e2.employee_id = e1.manager_id) as manager_name,
department_id,
(select department_name from departments d where d.department_id = e1.department_id) as department_name
from employees e1;

-- join
select e1.employee_id, e1.first_name, e1.manager_id, e2.first_name as manager_name, d.department_name
from employees e1
join employees e2 on e2.employee_id = e1.manager_id
join departments d on d.department_id = e1.department_id;

-- 각 사원의 매니저 사원번호와 매니저 퍼스트이름을 출력하세요
-- sub query와 join

-- sub query
select employee_id, first_name, manager_id,
(select first_name from employees e2 where e2.employee_id = e1.manager_id) as manager_name
from employees e1;

select e1.employee_id, e1.first_name, e1.manager_id, e2.first_name as manager_name
from employees e1
join employees e2 on e2.employee_id = e1.manager_id;

-- distinct: 중복제거
-- order by: 정렬
select distinct e1.manager_id, e2.first_name as manager_name
from employees e1
join employees e2 on e2.employee_id = e1.manager_id
order by e1.manager_id;


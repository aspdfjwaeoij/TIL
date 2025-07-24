-- 01. ��ü �����
select count(*) from employees; -- count: ���� ����

-- 02. ��ü ����� - �μ���ȣ: 10
select count(*)
from employees
where department_id = 50;

-- 03. ��ü ���
select *
from employees;

-- 04. �����ȣ�� ������� ���
select *
from employees
where employee_id = 200;

-- 05 ��� �ű� ���
select sysdate from dual;

insert into employees
(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values
(1000, 'first_name', 'last_name', 'email', 'phone_number', sysdate, 'SA_REP', 90000, 0.1, 100, 30);

-- 06. ��� ���� ����
update employees
set first_name = 'fn', last_name = 'ln', email='em'
where employee_id=1000;

select * from employees;

-- 07. ��� ���� ����
delete from employees
where employee_id=1000 and email='em';

-- 08. job history ����
delete from job_history
where employee_id=1000;

-- 09. �μ� ���� ���
select department_id as departmentId, department_name as departmentName
from departments;

-- 10. ��å ���� ���
select job_id as jobId, job_title as jobTitle
from jobs;

-- 11. �Ŵ��� ���
-- ������(sub query)
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

-- �� ����� �Ŵ��� �����ȣ�� �Ŵ��� �۽�Ʈ�̸��� ����ϼ���
-- sub query�� join

-- sub query
select employee_id, first_name, manager_id,
(select first_name from employees e2 where e2.employee_id = e1.manager_id) as manager_name
from employees e1;

select e1.employee_id, e1.first_name, e1.manager_id, e2.first_name as manager_name
from employees e1
join employees e2 on e2.employee_id = e1.manager_id;

-- distinct: �ߺ�����
-- order by: ����
select distinct e1.manager_id, e2.first_name as manager_name
from employees e1
join employees e2 on e2.employee_id = e1.manager_id
order by e1.manager_id;


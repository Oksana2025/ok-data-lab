--Завдання 1.3.
SELECT COUNT(*) AS employees_total FROM employees;

--Завдання 2.1. Виведіть first_name, last_name працівників, у яких manager_id = 101. Відсортуйте за employee_id за зростанням.
SELECT first_name, last_name
FROM hr.employees
WHERE manager_id = 101
order by employee_id;

--Завдання 2.2. Виведіть first_name, last_name, salary працівників із зарплатою строго меншою за 4000. Відсортуйте за salary за зростанням.
SELECT first_name, last_name, salary
FROM hr.employees
WHERE salary < 4000
ORDER BY salary;

/*Завдання 2.3. Виведіть employee_id, first_name, last_name, hire_date працівників, найнятих у 1996 році (з 1996-01-01 по 1996-12-31 включно).
  Відсортуйте за hire_date за зростанням. */ 
SELECT employee_id, first_name, last_name, hire_date
FROM hr.employees
WHERE EXTRACT(YEAR FROM hire_date) = 1996
ORDER BY hire_date;

--Завдання 2.4. Виведіть employee_id, first_name, last_name, email працівників, у яких email закінчується на example.com.
--Відсортуйте за email за зростанням. Використайте LIKE '%example.com'.*/
SELECT employee_id, first_name, last_name, email
FROM hr.employees
WHERE email LIKE '%example.com'
ORDER BY email;

--Завдання 2.5. Виведіть employee_id, first_name, last_name, department_id працівників із відділів 20 і 30, використавши оператор IN.
--Відсортуйте за department_id, потім за employee_id за зростанням.*/
SELECT employee_id, first_name, last_name, department_id
FROM hr.employees
WHERE department_id IN (20, 30)
ORDER BY 4, 1;

--Завдання 2.6. Виведіть employee_id, first_name працівників, чиє ім'я закінчується на літеру «a» незалежно від регістру.
--Відсортуйте за first_name за зростанням. Використайте LOWER(first_name) LIKE '%a'.*/
SELECT employee_id, first_name
FROM hr.employees
WHERE LOWER(first_name) LIKE '%a'
ORDER BY first_name;

--Завдання 2.7. Виведіть employee_id, first_name, last_name, salary, commission_pct працівників, у яких зарплата більша за 6000 і комісія дорівнює 0.15.
--Відсортуйте за salary за спаданням.*/
SELECT employee_id, first_name, last_name, salary, commission_pct
FROM hr.employees
WHERE salary > 6000 AND commission_pct = 0.15
ORDER BY 4 DESC;

--Завдання 2.8. Виведіть employee_id, first_name, last_name, phone_number працівників, чий номер телефону починається на 515. Відсортуйте за phone_number за зростанням.
SELECT employee_id, first_name, last_name, phone_number
FROM hr.employees
WHERE phone_number lIKE '515%'
ORDER BY 4;

--Завдання 2.9. Виведіть employee_id, first_name, last_name, salary працівників відділу 20, відсортувавши за salary за спаданням.
SELECT employee_id, first_name, last_name, salary
FROM hr.employees
WHERE department_id = 20
ORDER BY 4 DESC;

--Завдання 2.10. Виведіть employee_id, first_name, last_name, hire_date перших 7 працівників за датою найму (від найранішої). Використайте ORDER BY hire_date, employee_id та LIMIT 7.
SELECT employee_id, first_name, last_name, hire_date
FROM hr.employees
ORDER BY hire_date, employee_id
LIMIT 7;

--Завдання 2.11. Виведіть employee_id, first_name, last_name, salary працівників із зарплатою більшою за 4000, відсортувавши за employee_id за зростанням і обмеживши результат 5 рядками.
SELECT employee_id, first_name, last_name, salary
FROM hr.employees
WHERE salary > 4000
ORDER BY 1
LIMIT 5;

--Завдання 2.12. Виведіть employee_id, first_name, last_name та обчислену текстову колонку salary_eur у форматі '24000 EUR' (значення зарплати, пробіл, літери EUR). 
--Відсортуйте за employee_id за зростанням.*/
SELECT employee_id, first_name, last_name, CAST(salary AS TEXT) || ' EUR' AS salary_eur 
FROM hr.employees
ORDER BY 1;

--Завдання 2.13. Виведіть employee_id, first_name, last_name працівників із manager_id = 101, відсортувавши за last_name за зростанням.
SELECT employee_id, first_name, last_name
FROM hr.employees
WHERE manager_id = 101
ORDER BY 3;

--Завдання 2.14. Виведіть employee_id, first_name, last_name, salary працівників, відсортувавши за salary за спаданням, пропустивши перші 3 рядки та вивівши наступні 10 (OFFSET 3 LIMIT 10).
SELECT employee_id, first_name, last_name, salary
FROM hr.employees
ORDER BY salary DESC
OFFSET 3 LIMIT 10;

--Завдання 2.15. Виведіть employee_id, first_name, last_name, hire_date працівників, найнятих після 2000-01-01, відсортувавши за hire_date за спаданням.
SELECT employee_id, first_name, last_name, hire_date
FROM hr.employees
WHERE hire_date > '2000-01-01'
ORDER BY 4 DESC;

--Завдання 3.1. Порахуйте середню зарплату працівників, у яких job_id починається з літери «S». Округліть результат до двох знаків після коми.
 SELECT ROUND(AVG(salary), 2) AS avg_salary
 FROM hr.employees
 WHERE job_id LIKE 'S%';

--Завдання 3.2. Для кожного department_id порахуйте мінімальну та максимальну зарплату.
--ℹ️ Отримати на виході: department_id, min_salary, max_salary; сортування за department_id за зростанням.*/
SELECT department_id, MIN(salary) AS min_salary, MAX(salary) AS max_salary
FROM hr.employees
GROUP BY 1
ORDER BY 1;

--Завдання 3.3. Порахуйте кількість працівників із зарплатою більшою за 3000. Виведіть одну колонку employees_count.
SELECT COUNT(employee_id) AS employees_count
FROM hr.employees
WHERE salary > 3000;

--Завдання 3.4. Порахуйте суму зарплат у кожному department_id і залиште лише ті відділи, де сума перевищує 10000. Фільтрацію груп виконайте через HAVING.
--ℹ️ Отримати на виході: department_id, total_salary; сортування за total_salary за спаданням.*/
SELECT department_id, SUM(salary) AS total_salary
FROM hr.employees
GROUP BY department_id
HAVING SUM(salary) > 10000
ORDER BY total_salary DESC;

--Завдання 3.5. Виведіть employee_id, first_name, last_name та колонку commission, у якій значення NULL замінені на 0 за допомогою COALESCE. Відсортуйте за employee_id за зростанням.
SELECT employee_id, first_name, last_name, COALESCE(commission_pct, 0) AS commission
FROM hr.employees
ORDER BY 1;

--Завдання 3.6. Виведіть employee_id, last_name та колонку total_income, обчислену як salary + salary * COALESCE(commission_pct, 0), для працівників, у яких це значення більше за 5000.
--Відсортуйте за total_income за спаданням.*/
SELECT employee_id, last_name, (salary + salary * COALESCE(commission_pct, 0)) AS total_income
FROM hr.employees
WHERE (salary + salary * COALESCE(commission_pct, 0)) > 5000
ORDER BY 3 DESC;

--Завдання 4.1. Виведіть first_name, last_name працівників і job_title їхньої посади, з'єднавши employees та jobs через INNER JOIN. Відсортуйте за last_name за зростанням.
SELECT first_name, last_name, job_title
FROM hr.employees as e
JOIN hr.jobs j ON e.job_id = j.job_id 
ORDER BY last_name;

--Завдання 4.2. Виведіть first_name, last_name, salary, job_title працівників із зарплатою більшою за 5000. Відсортуйте за salary за спаданням.
SELECT first_name, last_name, e.salary, job_title
FROM hr.employees as e
JOIN hr.jobs j ON e.job_id = j.job_id
WHERE e.salary  > 5000
ORDER BY e.salary DESC;

--Завдання 4.3. Виведіть first_name, last_name усіх працівників разом із department_name, включно з тими, у кого department_id порожній. 
--Використайте LEFT JOIN і відсортуйте за last_name за зростанням.*/
SELECT e.first_name, e.last_name, d.department_name
FROM hr.employees e
LEFT JOIN hr.departments d ON e.department_id = d.department_id
ORDER BY e.last_name;

--Завдання 4.4. Виведіть department_name усіх відділів разом із first_name, last_name працівників, включно з відділами без жодного працівника. 
--Використайте RIGHT JOIN і відсортуйте за department_name за зростанням.*/
SELECT d.department_name, e.first_name, e.last_name 
FROM hr.employees e 
RIGHT JOIN hr.departments d  ON d.department_id = e.department_id 
ORDER BY d.department_name;

--Завдання 4.5. Виведіть first_name, last_name і department_name так, щоб у результат потрапили і працівники без відділу, і відділи без працівників. 
--Використайте FULL OUTER JOIN і відсортуйте за department_name, потім за last_name за зростанням.*/
SELECT e.first_name ,e.last_name ,d.department_name 
FROM hr.employees e 
FULL JOIN hr.departments d ON d.department_id = e.department_id 
ORDER BY d.department_name ,e.last_name ;

--Завдання 4.6. Виведіть first_name, last_name, job_title і department_name, з'єднавши три таблиці: employees, jobs, departments. 
--Відсортуйте за department_name, потім за last_name за зростанням.*/
SELECT e.first_name ,e.last_name ,j.job_title ,d.department_name 
FROM hr.employees e 
JOIN hr.jobs j ON e.job_id = j.job_id 
JOIN hr.departments d ON e.department_id = d.department_id 
ORDER BY 4, 2;

--Завдання 4.7. Порахуйте кількість працівників у кожному відділі.
--Отримати на виході: department_name, employees_count; сортування за employees_count за спаданням.*/
SELECT d.department_name ,COUNT(e.employee_id) AS employees_count
FROM hr.employees e 
RIGHT JOIN hr.departments d ON e.department_id = d.department_id 
GROUP BY d.department_name
ORDER BY employees_count DESC;

--Завдання 4.8. Виведіть department_name і employees_count лише тих відділів, де працює більше 3 працівників. 
--Використайте COUNT(employee_id) та HAVING. Відсортуйте за employees_count за спаданням.*/
SELECT d.department_name ,COUNT(e.employee_id) AS employees_count
FROM hr.departments d 
LEFT JOIN hr.employees e ON d.department_id = e.department_id 
GROUP BY d.department_name
HAVING COUNT(e.employee_id) > 3
ORDER BY employees_count DESC;

--Завдання 4.9. Виведіть department_name і country_name країни, у якій розташовано відділ. Ланцюг з'єднання: departments → locations → countries. 
--Відсортуйте за country_name, потім за department_name за зростанням.*/
SELECT d.department_name ,c.country_name 
FROM hr.departments d 
LEFT JOIN hr.locations l ON d.location_id = l.location_id 
LEFT JOIN hr.countries c ON l.country_id  = c.country_id 
ORDER BY 2, 1;

--Завдання 4.10. Виведіть first_name, last_name, department_name працівників, які працюють у відділах, розташованих у регіоні 'Europe'. 
--Ланцюг з'єднання: employees → departments → locations → countries → regions. Відсортуйте за last_name за зростанням.*/
SELECT e.first_name ,e.last_name ,d.department_name 
FROM hr.employees e 
JOIN hr.departments d ON e.department_id = d.department_id 
JOIN hr.locations l ON d.location_id = l.location_id 
JOIN hr.countries c ON l.country_id = c.country_id 
JOIN hr.regions r ON c.region_id = r.region_id 
WHERE r.region_name = 'Europe'
ORDER BY e.last_name ;

--Завдання 5.1. Виведіть employee_id, first_name, last_name, salary працівників, чия зарплата вища за середню зарплату по всій таблиці. Відсортуйте за salary за спаданням.
SELECT e.employee_id ,e.first_name ,e.last_name ,e.salary 
FROM hr.employees e 
WHERE e.salary > (SELECT AVG(e2.salary ) FROM hr.employees e2 )
ORDER BY e.salary DESC;

--Завдання 5.2. Виведіть department_id і department_name відділів, у яких сумарна зарплата працівників перевищує 100000.
--Список department_id отримайте підзапитом із GROUP BY і HAVING. Відсортуйте за department_id за зростанням.*/
SELECT d.department_id ,d.department_name 
FROM hr.departments d 
WHERE d.department_id IN (
	SELECT e.department_id
	FROM hr.employees e
	GROUP BY e.department_id
	HAVING SUM(e.salary ) > 100000
	)
ORDER BY 1;

--Завдання 5.3. Виведіть employee_id, first_name, last_name працівників, які працюють у відділах, розташованих у містах, назва яких починається на літеру «S». Відсортуйте за employee_id за зростанням.
SELECT e.employee_id ,e.first_name ,e.last_name 
FROM hr.employees e 
WHERE e.employee_id IN (
	SELECT e2.employee_id 
	FROM hr.employees e2 
	JOIN hr.departments d ON e2.department_id = d.department_id 
	JOIN hr.locations l ON d.location_id = l.location_id 
	WHERE l.city LIKE 'S%'
	)
ORDER BY 1;

--Завдання 5.4. Виведіть employee_id, last_name, salary, job_id працівників, чия зарплата перевищує max_salary, встановлену в таблиці jobs для їхньої посади. 
--Використайте корельований підзапит. Відсортуйте за salary за спаданням.
SELECT e.employee_id ,e.last_name ,e.salary ,e.job_id 
FROM hr.employees e 
WHERE e.salary > 
	(SELECT j.max_salary 
	FROM hr.jobs j 
	WHERE e.job_id = j.job_id 
	)
ORDER BY e.salary DESC;

--Завдання 5.5. Виведіть department_id, department_name відділів, у яких немає жодного працівника. Використайте NOT EXISTS або NOT IN. Відсортуйте за department_id за зростанням.
SELECT d.department_id ,d.department_name 
FROM hr.departments d 
WHERE NOT EXISTS 
	(SELECT 1
	FROM hr.employees e 
	WHERE e.department_id = d.department_id 
	)
ORDER BY d.department_id; 

--Завдання 5.6. Порахуйте кількість працівників у відділах, де середня зарплата перевищує 15000.
--ℹ️ Отримати на виході: department_id, employees_count; сортування за department_id за зростанням. Перелік відділів із середньою зарплатою вище 15000 отримайте окремим підзапитом.
SELECT e.department_id ,COUNT(e.employee_id ) AS employees_count
FROM hr.employees e 
WHERE e.department_id IN 
	(SELECT e2.department_id  
	FROM hr.employees e2 
	GROUP BY e2.department_id 
	HAVING AVG(e2.salary) > 15000
	)
GROUP BY e.department_id
ORDER BY e.department_id;
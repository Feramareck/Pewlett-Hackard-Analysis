--all the titles of employees who were born between January 1, 1952 and December 31, 1955
SELECT em.emp_no,
	em.first_name,
	em.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_title
FROM employees AS em
JOIN titles AS ti
ON (em.emp_no = ti.emp_no)
WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY em.emp_no;

SELECT * FROM retirement_title;

-- number of retirement-age employees by most recent job title
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_title
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;

-- number of employees by their most recent job title who are about to retire
SELECT COUNT(emp_no),
title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(emp_no) DESC;

SELECT * FROM retiring_titles;

-- employees who are eligible to participate in a mentorship program
SELECT DISTINCT ON (em.emp_no) em.emp_no,
	em.first_name,
	em.last_name,
	em.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibilty
FROM employees AS em
JOIN dept_emp AS de
ON (em.emp_no = de.emp_no)
JOIN titles AS ti
ON (em.emp_no = ti.emp_no)
WHERE (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31') AND
	(ti.to_date = '9999-01-01')
ORDER BY emp_no;

SELECT * FROM mentorship_eligibilty;

-- total of current employees
SELECT COUNT(*) as total_employees
FROM (SELECT DISTINCT ON (em.emp_no) em.emp_no
	FROM employees AS em
	JOIN titles AS ti
	ON (em.emp_no = ti.emp_no)
	WHERE (ti.to_date = '9999-01-01')
	ORDER BY emp_no) 
AS co;

-- total of retiring
SELECT COUNT(emp_no) AS total_retiring
FROM unique_titles;

-- number of employees by their most recent job title who are qualified to mentorship program
SELECT COUNT(emp_no) as title_mentorship,
title
INTO mentorship_title
FROM mentorship_eligibilty
GROUP BY title
ORDER BY COUNT(emp_no) DESC;

-- number of employees eligible to retire versus employees eligible for the mentorship program
SELECT rt.count as title_retiring,
mt.title_mentorship,
rt.title,
(rt.count - mt.title_mentorship) as dif_retiring_mentor
INTO retiring_vs_mentorship
FROM retiring_titles as rt
LEFT JOIN mentorship_title AS mt
ON (rt.title = mt.title);

SELECT * FROM retiring_vs_mentorship;
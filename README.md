# Pewlett-Hackard-Analysis

# Overview of the analysis:
This analysis was carried out to determine the number of retiring employees per title and to 
identify employees eligible to participate in a mentorship program to help the company prepare for what they call 
the “silver tsunami” as many current employees reach retirement age. 

# Results:
- First, we created the table retirement_titles based on the full list of employees and selected only those employees of retirement age. This new table with 133776 records has the columns detailed in the figure below.
colar figura 1
- Then, we use the previous table to filter only the last title of these employees and we call this table unique_titles. This new table generated 72458 rows.
- Using the unique_titles table, we performed the count of employees by title able to retire. The result found is shown in the figure below and saved in the retiring_titles table.
- Finally, we create the mentorship_eligibilty table based on the list of all employees to check the number of employees who are eligible to participate in a mentorship program. 
The columns of this table can be seen in the figure below. 
In this same image, we can see that this query generated only 1549 employees suitable for this program.

# Summary:
 - Analyzing that the total number of active employees is 240,124, we can say that the total of 72,458 employees able to retire is a really significant number that will need to be filled as the "silver tsunami" begins.
 - Although the company has qualified employees ready to guide the next generation of employees, we can see from the figure below that the difference by title between employees able to retire and those able to be mentors is very high. 
Overall, we have a gap of 70,907 employees and probably the Pewlett Hackard will need another initiative besides the mentorship program.

All queries generated for this analysis are detailed and commented in the Employee_Database_challenge.sql file, as well as the generated tables saved in the Data folder.
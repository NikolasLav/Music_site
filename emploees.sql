CREATE TABLE IF NOT EXISTS Departments (
	id SERIAL PRIMARY KEY,
	department_name VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Employees (
	id SERIAL PRIMARY KEY,
	employee_name VARCHAR(255) NOT NULL,
	department_id INTEGER REFERENCES Departments(id)
);

ALTER TABLE Employees ADD boss_id INTEGER REFERENCES Employees(id);

/* 
1. Таблица Departments - вспомогательная, можно справиться без неё. С ней 
пример больше походит на реальную сущность. В противном случае будет 
возможность допущения человеческого фактора, а именно задублирования отделов 
или ошибок в написании одного и того же отдела, со всеми вытекающими...
2. поле boss_id имеет свойство Allow null, что подразумевает 
необязательность его заполнения при добавления нового сотрудника. Но не 
противоречит условиям задачи. Все условия выполнены.
*/
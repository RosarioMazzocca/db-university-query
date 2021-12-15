-- Selezionare tutti gli studenti nati nel 1990 
select * from `students`
where YEAR(date_of_birth) = '1990';

-- Selezionare tutti i corsi che valgono più di 10 crediti
select * from `courses`
where cfu > '10';

-- Selezionare tutti gli studenti che hanno più di 30 anni
select * from `students`
where TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) > 30;

-- Selezionare tutti i corsi di laurea magistrale
select * from `degrees`
where level = 'magistrale';

-- Da quanti dipartimenti è composta l’università?
select count(id)
from departments;

-- Quanti sono gli insegnanti che non hanno un numero di telefono?
select * from `teachers`
where phone is not null;

-- Contare quanti iscritti ci sono stati ogni anno
select year(enrolment_date) , count(id)
from `students`
group by year(enrolment_date);

-- Calcolare la media dei voti di ogni appello d’esame
select *, AVG(vote) 
from exam_student
group by exam_id;

-- Contare quanti corsi di laurea ci sono per ogni dipartimento
select dep.name, count(department_id)
from `degrees`d, departments dep
where d.department_id = dep.id
group by department_id;

-- Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT *
FROM `students`
WHERE degree_id = '53';

-- Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
select id, department_id, name, level 
from degrees d 
where department_id = '7'
and level = 'magistrale';

-- Selezionare tutti i corsi in cui insegna Fulvio Amato
select *
from course_teacher ct 
where teacher_id = 44;

-- Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
select s.name, s.surname, d.name, dep.name
from departments dep
inner join degrees d
on dep.id = d.department_id
inner join students s 
on d.id = s.degree_id
order by s.surname, s.name asc;


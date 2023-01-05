# ADMIN ---------

START TRANSACTION;
# As a Task Leader, I can manage tasks, task status, and task label
-- Updating the deadline of the task under the BE label tag from the status table to March 1, 2023
-- Assume the group leader that executed this query has a student number of 2020-07861
update status s
	inner join task_status ts on s.id = ts.status_id
    inner join task_label tl on tl.task_id = ts.task_id
    set s.deadline = '2023-03-01'
    where tl.label_id = 'BE';
    
-- Update the task status state to ‘passed’ assigned that are assigned to students with ids 2020-07863, 2020-07864
-- Assume the group leader that executed this query has a student number of 2020-07858
update status s
	inner join task_status ts on s.id = ts.status_id
    inner join assign_task at on ts.task_id = at.task_id
    set s.state = 'passed'
    where at.student_id = '2020-07863' or at.student_id = '2020-07864';
    

# As a Task Leader, I can assign role and task to student, and as well assign student to a label
-- Suppose the Group Leader wants to see who the students that aren't yet assigned to a role and task
-- Query list of students and tasks that are unassigned
select id from student where id not in (select student_id from assign_task);
select id from student where id not in (select student_id from assign_role);
select id from task where id not in (select task_id from assign_task);

-- Assign to unassigned
-- Assume the group leader that executed this query has a student number of 2020-07861 and 2020-07868, respectively
insert into assign_role(student_id, role_id) values ("2020-07869", "3");
insert into assign_task values ("2020-07869", "CD03");

insert into assign_role(student_id, role_id) values ("2020-07870", "3");
insert into assign_task values ("2020-07870", "TE04");


# As a Task Leader, I can comment on tasks
insert into comment values ("CFE04", "Lacks Footer links");
insert into task_comment values ("FE04", "CFE04", "2020-07867");

insert into comment values ("CCD03", "Include redirection");
insert into task_comment values ("CD03", "CCD03", "2020-07861");

insert into comment values ("CBE04", "Check Inflection Points");
insert into task_comment values ("BE04", "CBE04", "2020-07858");

COMMIT;

-- confirming if the above set of queries worked (expect no values returned)
select id from student where id not in (select student_id from assign_task);
select id from student where id not in (select student_id from assign_role);
select id from task where id not in (select task_id from assign_task);

-- see  the comments of each task (expect three more comments added and title of the updated task with checkmark)
select t.id, t.title, t.description, c.note as 'comment', tc.student_id as 'commenter' from comment c
	inner join task_comment tc on c.id = tc.comment_id
    right join task t on t.id = tc.task_id;

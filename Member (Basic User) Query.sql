# BASIC USER ---------
START TRANSACTION;
# As a Member, I can work on task assigned to me by updating task state to 'in-progress'
-- Assume Cersei Lanister (2020-07862) wants to see the tasks assigned to her
select at.task_id, t.title, t.description from student s
	inner join assign_task at on s.id = at.student_id
    inner join task t on t.id = at.task_id
    where s.id = '2020-07862';

-- Then she decides to update the task status of the task_id FE03 to 'in progress', marking that she'll start working on it
update status s
	inner join task_status ts on s.id = ts.status_id
    set s.state = 'in progress'
    where ts.task_id = 'FE03';
    
# As a Member, I can update task status of my task to 'for review' when I'm done 
 -- Then Cersei finishes the task then decided to update the task status of the task_id to 'for review', marking that she's done working and the task leader can now review it.
update status s
	inner join task_status ts on s.id = ts.status_id
    set s.state = 'for review'
    where ts.task_id = 'FE03';

COMMIT;
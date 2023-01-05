/* Triggers */
drop trigger if exists validate_email;
drop trigger if exists insert_task_status_and_label;
drop trigger if exists update_task_name_to_done;
drop trigger if exists insert_task_label;
drop trigger if exists monitor_task_overdue_before_update;
drop event if exists monitor_deadline_overdue;

-- Trigger 1: Validate student email format input
delimiter //
create trigger validate_email
	before insert on student
	for each row
begin
	if New.email not like '%_@%_.__%' then
		signal SQLSTATE VALUE '45000'
        set message_text = 'Email is not valid';
	end if;
end;//
delimiter ;

-- Trigger 2: After task insertion, insert status and task_status with default and provided values
delimiter //
create trigger insert_task_status_and_label
	after insert on task
	for each row
begin
	insert into status(id, deadline, state) 
		values(concat('S', New.id), adddate(now(), 7), 'to-do');
	insert into task_status(task_id, status_id)
		values(New.id, concat('S', New.id));
end;//
delimiter ;

-- Trigger 3: After task insertion, assign to a label accordingly with its id
delimiter //
create trigger insert_task_label
	after insert on task
	for each row
begin
	insert into task_label(label_id, task_id)
	values((select id 
				from label 
				where id 
				like concat('%', left(New.id, 2), '%')),
			New.id);
	
end;//
delimiter ;


-- Trigger 4: After status is updated to passed, append task name with ✓
delimiter //
create trigger update_task_name_to_done
	after update on status
    for each row
begin
	if (New.state = 'passed') then
		update task as t
		inner join task_status as ts on t.id = ts.task_id
		set t.title = concat('✓', t.title)
		where ts.status_id = New.id;
	end if;
end;//
delimiter ;


-- Trigger 5: Monitor deadline before update and change status overdue to "Y" once deadline has passed, else “N”
delimiter //
create trigger monitor_task_overdue_before_update
	before update on status
    for each row
begin
	if New.deadline < curdate() and New.state != 'passed' then
		set New.overdue = 'Y';
	else
		set New.overdue = 'N';
	end if;
end;//
delimiter ;

-- Event 1: Monitor deadline and update status overdue to "Y" once deadline has passed, else “N”
create event monitor_deadline_overdue
	on schedule every 1 minute
    on completion preserve
    do
		update status
        set overdue = 'Y'
        where state != 'passed' and deadline <= now()
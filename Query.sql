drop database collab;

show events from collab;
use collab;
select * from student;
select * from role;
select * from label;
select * from task;
select * from comment;
select * from status;
select * from assign_label;
select * from assign_role;
select * from assign_task;
select * from task_status;
select * from task_label;
select * from task_comment;
show tables;

create database collab;

# create roles
-- create role group_leader, task_leader, member;

-- drop user group_leader, task_leader, member;
# database users
create user 'group_leader' identified by '1am-Lockedgl';
create user 'task_leader' identified by '1am-Lockedtl';
create user 'member' identified by '1am-Lockedm';

# constraints
grant all on collab.* to 'group_leader';
grant update on collab.task to 'task_leader';
grant update on collab.status to 'task_leader';
grant update on collab.task_status to 'task_leader';
grant update on collab.task_label to 'task_leader';
grant update on collab.assign_role to 'task_leader';
grant update on collab.assign_label to 'task_leader';
grant insert on collab.task to 'task_leader';
grant insert on collab.status to 'task_leader';
grant insert on collab.task_status to 'task_leader';
grant insert on collab.task_label to 'task_leader';
grant insert on collab.assign_role to 'task_leader';
grant insert on collab.assign_label to 'task_leader';
grant select on collab.task to 'member';
grant select on collab.student to 'member';
grant select on collab.assign_task to 'member';
grant select on collab.task_comment to 'member';
grant select on collab.comment to 'member';
grant update on collab.status to 'member';

flush privileges;

-- # granting roles to users
-- grant group_leader to 'daenerys';
-- grant 'task_leader' to 'jon';
-- grant member to 'cersei'


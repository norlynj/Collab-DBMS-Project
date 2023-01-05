# database user types
create user 'group_leader' identified by '1am-Lockedgl';
create user 'task_leader' identified by '1am-Lockedtl';
create user 'member' identified by '1am-Lockedm';

# constraints
grant all on collab.* to 'group_leader';

grant select on collab.* to 'task_leader';
grant update on collab.task to 'task_leader';
grant update on collab.status to 'task_leader';
grant update on collab.task_status to 'task_leader';
grant update on collab.assign_role to 'task_leader';
grant update on collab.assign_task to 'task_leader';
grant insert on collab.status to 'task_leader';
grant insert on collab.task_status to 'task_leader';
grant insert on collab.assign_role to 'task_leader';
grant insert on collab.assign_task to 'task_leader';
grant insert on collab.comment to 'task_leader';
grant insert on collab.task_comment to 'task_leader';

grant select on collab.status to 'member';
grant select on collab.task_status to 'member';
grant select on collab.task to 'member';
grant select on collab.student to 'member';
grant select on collab.assign_task to 'member';
grant select on collab.task_comment to 'member';
grant select on collab.comment to 'member';
grant update on collab.status to 'member';


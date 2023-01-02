use collab;

delete from assign_task;
delete from assign_role;
delete from assign_label;
delete from task_label;
delete from task_status;
delete from task_comment;
delete from student;
delete from role;
delete from task;
delete from status;
delete from comment;
delete from label;


insert into student values
("2020-07858", "Jon Snow", "js@got.com"),
("2020-07859", "Daenerys Targaryen", "dtarg@got.com"),
("2020-07860", "Robert Baratheon", "rob.bar@got.com"),
("2020-07861", "Tyrion Lannister", "tyrion@got.com"),
("2020-07862", "Cersei Lannister", "cersei@got.com"),
("2020-07863", "Catelyn Stark", "cats@got.com"),
("2020-07864", "Jaime Lanister", "jaime@got.com"),
("2020-07865", "Robb Stark", "robs@got.com"),
("2020-07866", "Arya Stark", "arya@got.com"),
("2020-07867", "Sansa Stark", "sansa@got.com"),
("2020-07868", "Samwell Tarly", "sam@got.com"),
("2020-07869", "Jorah Mormont", "jorah@got.com"),
("2020-07870", "Theon Greyjoy", "theon@got.com");

insert into role(id, name, description) values
(1, "Group Leader", "Evaluates ideas and contributions of participants as a whole"),
(2, "Task Leader", "Leads a set of members to performa specific task. Focus on the primary goal of tasks in a label"),
(3, "Member", "Works with the leaders and coordinates with the other members to deliver an output");

insert into assign_role(student_id, role_id) values
("2020-07858", "2"),
("2020-07859", "1"),
("2020-07860", "3"),
("2020-07861", "2"),
("2020-07862", "3"),
("2020-07863", "3"),
("2020-07864", "3"),
("2020-07865", "3"),
("2020-07866", "3"),
("2020-07867", "2"),
("2020-07868", "2"),
("2020-07869", "3"),
("2020-07870", "3");


insert into label values
("FE", "Front End"),
("BE", "Back End"),
("TE", "Testing"),
("CD", "Conceptual Design");

insert into assign_label values
("2020-07867", "FE"),
("2020-07858", "BE"),
("2020-07868", "TE"),
("2020-07861", "CD");

insert into task values
("FE01", "Homepage", "Design and Code Homepage view"),
("FE02", "Admin page", "Design and Code Admin view"),
("FE03", "Accounts Page", "Design and Code Account view"),
("FE04", "About Us Page", "Design and Code About view"),
("BE01", "Sign in", "Implement User sign in"),
("BE02", "New-Task Feature", "Implement New Task Feature"),
("BE03", "Implement Sync", "Synchronise across Gcalendar"),
("BE04", "Blocked Dates", "Add Blocked Dates for Busy Days"),
("TE01", "Test FE 01-02", "Test Front End 01 & 02"),
("TE02", "Test FE 03-04", "Test Front End 03 & 04"),
("TE03", "Test BE 01-02", "Test Back End 01 & 02"),
("TE04", "Test BE 03-04", "Test Back End 03 & 04"),
("CD01", "Formulate Workflow", "Create User Story"),
("CD02", "Design MVC", "Plan out business logic"),
("CD03", "Gather References", "Find relevant project references");

# Already generated in triggers
-- insert into status(status_id, deadline, state) values
-- ("SFE01", "2022-11-14", "to-do"),
-- ("SFE02", "2022-11-13", "to-do"),
-- ("SFE03", "2022-11-13", "to-do"),
-- ("SFE04", "2022-11-13", "to-do"),
-- ("SBE01", "2022-11-27", "to-do"),
-- ("SBE02", "2022-12-01", "to-do"),
-- ("SBE03", "2022-12-05", "to-do"),
-- ("SBE04", "2022-12-05", "to-do"),
-- ("STE01", "2022-12-14", "to-do"),
-- ("STE02", "2022-12-14", "to-do"),
-- ("STE03", "2022-12-15", "to-do"),
-- ("STE04", "2022-12-15", "to-do"),
-- ("SCD01", "2022-11-05", "to-do"),
-- ("SCD02", "2022-11-05", "to-do"),
-- ("SCD03", "2022-11-03", "to-do");

insert into comment values
("CFE03", "Lacks Footer links"),
("CBE04", "Check Inflection Points"),
("CD01", "Include redirection");

insert into assign_task values
("2020-07867", "FE01"),
("2020-07860", "FE02"),
("2020-07862", "FE03"),
("2020-07862", "FE04"),
("2020-07858", "BE01"),
("2020-07863", "BE02"),
("2020-07864", "BE03"),
("2020-07865", "BE04"),
("2020-07868", "TE01"),
("2020-07868", "TE02"),
("2020-07866", "TE03"),
("2020-07866", "TE04"),
("2020-07861", "CD01"),
("2020-07861", "CD02"),
("2020-07869", "CD03");

# Already generated in triggers
-- insert into task_label values
-- ("FE01", "FE"),
-- ("FE02", "FE"),
-- ("FE03", "FE"),
-- ("FE04", "FE"),
-- ("BE01", "BE"),
-- ("BE02", "BE"),
-- ("BE03", "BE"),
-- ("BE04", "BE"),
-- ("TE01", "TE"),
-- ("TE02", "TE"),
-- ("TE03", "TE"),
-- ("TE04", "TE"),
-- ("CD01", "CD"),
-- ("CD02", "CD"),
-- ("CD03", "CD");

-- insert into task_status values
-- ("FE01", "SFE01"),
-- ("FE02", "SFE02"),
-- ("FE03", "SFE03"),
-- ("FE04", "SFE04"),
-- ("BE01", "SBE01"),
-- ("BE02", "SBE02"),
-- ("BE03", "SBE03"),
-- ("BE04", "SBE04"),
-- ("TE01", "STE01"),
-- ("TE02", "STE02"),
-- ("TE03", "STE03"),
-- ("TE04", "STE04"),
-- ("CD01", "SCD01"),
-- ("CD02", "SCD02"),
-- ("CD03", "SCD03");

insert into task_comment values
("FE03", "CFE03", "2020-07861"),
("BE04", "CBE04", "2020-07858"),
("CD01", "CD01", "2020-07861");

update status set deadline = '2022-12-01' where id = 'SBE01';
update status set deadline = '2022-12-01' where id = 'SBE02';
update status set deadline = '2022-12-01' where id = 'SBE03';
update status set deadline = '2022-12-01' where id = 'SBE04';
update status set state = 'passed' where id = 'SBE01';
update status set state = 'passed' where id = 'SBE02';
update status set state = 'testing' where id = 'SBE03';
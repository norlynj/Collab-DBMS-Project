# Collab: CMSC 127 DBMS Project

Collab is a task management system that logs and divides the tasks into chunks so that each individual member can focus on the task assigned. It represents real-world entities of a typical group workflow, these are: task, label, status, comment, and users that can be categorized into Group Leader, Task Leader, and Member. A task can have a status of to-do, in progress, for review, and passed. This DBMS caters the need to organize task division and updates for the group to be able to efficiently work and produce results. Moreover, it allows the handling of multiple users that gives them the abilities to perform functions dependent on their roles and privileges. There are several use cases for this project, one case that I’d like to show is in the _web development_ setting like in our CS121 course. 


## ↪️ ER Diagram
![erd](https://user-images.githubusercontent.com/80614435/215471113-5c9a7701-3117-476c-9bea-40397a0c1922.png)


## 🔨 Schema
- student(id, name, email)
- role(id, name, description)
- label(id, tag)
- task(id, title, description)
- status(id, deadline, state, overdue)
- comment(id, note)

- assign_role(student_id, role_id)
- assign_label(student_id, label_id)
- assign_task(student_id, task_id)
- task_label(task_id, label_id)
- task_status(task_id, status_id)
- task_comment(task_id, comment_id, student_id)

## 🔐 Triggers and Constraints

1. The relationship entities use “on delete cascade” constraint
2. Before student insertion or update, validate email format
3. Before role insertion, check role name, it should only be “Group Leader”, “Task Leader”, “Member”
4. After task insertion, add status and task_status with a default status state of “to-do” and deadline of +7 days from today’s date. status_id on task_status should correspond to the its entry number in the status table. Also, add task_id to task_label if the first two characters of the id exist in the label_id. For instance, a task_id with “FE01” should be under label “FE”
5. Check status state that it should only be “to-do”, “in progress”, “for review”, “testing”, “passed” 
6. After status is updated to “passed”, prepend task name with ✓
7. To monitor deadlines, create a scheduled event that updates status overdue from “N” to “Y” once the deadline has passed. Those that aren’t in  “passed” state should be the only ones updated.

## 👀 Demo Video

![image](https://user-images.githubusercontent.com/80614435/215472803-1abf538c-377b-432c-9036-c0b62f03c75a.png)

[Gdrive link(request for access)](https://drive.google.com/file/d/1NPEo4Ni1txXOBlHTovh1EQrDTV4DEIxG/view?usp=sharing)

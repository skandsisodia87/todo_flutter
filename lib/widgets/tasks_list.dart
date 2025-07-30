import 'package:flutter/material.dart';
import 'package:todo_flutter/models/task.dart';
import 'package:todo_flutter/widgets/tasks_tile.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<Task> tasks = [
    Task(name: 'Bring milk'),
    Task(name: 'Bring egg'),
    Task(name: 'Bring bread'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: tasks[index].name,
          isChecked: tasks[index].isDone,
          toggleCheckbox: (newValue) {
            setState(() {
              tasks[index].toggleDone();
            });
          },
        );
      },
      itemCount: tasks.length,
    );
  }
}

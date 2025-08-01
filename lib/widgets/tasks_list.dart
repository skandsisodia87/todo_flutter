import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task_data.dart';
import 'package:todo_flutter/widgets/tasks_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final taskItem = taskData.tasks[index];
            return TaskTile(
              taskTitle: taskItem.name,
              isChecked: taskItem.isDone,
              toggleCheckbox: (newValue) {
                taskData.updateTask(taskItem);
              },
              longPressCallBack: () {
                taskData.deleteTask(taskItem);
              },
            );
          },
          itemCount: taskData.itemCount,
        );
      },
    );
  }
}

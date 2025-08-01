import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.taskTitle,
    required this.isChecked,
    required this.toggleCheckbox,
    required this.longPressCallBack,
  });

  final String taskTitle;
  final bool isChecked;
  final ValueChanged<bool?> toggleCheckbox;
  final GestureLongPressCallback longPressCallBack;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallBack,
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: toggleCheckbox,
        activeColor: Colors.lightBlueAccent,
      ),
    );
  }
}

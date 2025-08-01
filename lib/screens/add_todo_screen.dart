import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:todo_flutter/models/task_data.dart";

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Task',
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.0),
              TextField(
                controller: textEditingController,
                autofocus: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.lightBlueAccent,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.lightBlueAccent,
                      width: 3.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Material(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.lightBlueAccent,
                child: MaterialButton(
                  onPressed: () {
                    Provider.of<TaskData>(
                      context,
                      listen: false,
                    ).addTask(textEditingController.text);
                    textEditingController.clear();
                    Navigator.pop(context);
                  },
                  child: Text('Add', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

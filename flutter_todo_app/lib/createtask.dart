import 'package:flutter/material.dart';

import 'Task.dart';

class CreateTask extends StatefulWidget {
  // Callback function that gets called when user submits a new task
  // final onCreate;
  final List<Task> tasks = [];

  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create a task')),
      body: Center(
          child: Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                  // Opens the keyboard automatically
                  autofocus: true,
                  controller: controller,
                  decoration:
                      InputDecoration(labelText: 'Enter name for your task')))),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        onPressed: () {
          // Call the callback with the new task name
          // widget.onCreate(controller.text);
          // Go back to list screen
          Navigator.pop(context);
        },
      ),
    );
  }
}

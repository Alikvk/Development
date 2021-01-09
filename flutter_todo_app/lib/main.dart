import 'package:flutter/material.dart';
import 'package:flutter_todo_app/task.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(TODOApp());

class TODOApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TODO();
  }
}

class TODO extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TODOState();
  }
}

class TODOState extends State<TODO> {
  final List<Task> tasks = [];

  void onTaskCreated(String name) {
    setState(() {
      tasks.add(Task(name, false));
    });
  }

  // A new callback function to toggle task's completion
  void onTaskToggled(Task task) {
    setState(() {
      task.setCompleted(!task.isCompleted());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO app',
      initialRoute: '/',
      routes: {
        // Passing the function as a callback
        '/': (context) => TODOList(tasks: tasks, onToggle: onTaskToggled),
        '/create': (context) => TODOCreate(
              onCreate: onTaskCreated,
            ),
      },
    );
  }
}

class TODOList extends StatelessWidget {
  final List<Task> tasks;
  final onToggle;

  TODOList({@required this.tasks, @required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO app'),
      ),
      body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            // Changed ListTile to CheckboxListTile to have
            // the checkbox capability
            return CheckboxListTile(
              contentPadding: EdgeInsets.all(0),
              value: tasks[index].isCompleted(),
              onChanged: (_) => onToggle(tasks[index]),
              key: Key(tasks[index].getName()),
              title: Card(
                key: ValueKey(index),
                child: ListTile(
                  title: Text(
                    tasks[index].getName(),
                    key: Key(tasks[index].getName()),
                    style: GoogleFonts.roboto(fontSize: 22),
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, '/create'),
          child: Icon(Icons.add)),
    );
  }
}

// Since we are handling user input, state is used
class TODOCreate extends StatefulWidget {
  // Callback function that gets called when user submits a new task
  final onCreate;

  TODOCreate({@required this.onCreate});

  @override
  State<StatefulWidget> createState() {
    return TODOCreateState();
  }
}

class TODOCreateState extends State<TODOCreate> {
  // Controller that handles the TextField
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
          widget.onCreate(controller.text);
          // Go back to list screen
          Navigator.pop(context);
        },
      ),
    );
  }
}

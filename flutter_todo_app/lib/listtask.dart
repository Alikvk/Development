import 'package:flutter/material.dart';
import 'package:flutter_todo_app/createtask.dart';
import 'package:google_fonts/google_fonts.dart';

import 'task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => AppState(),
        '/create': (context) => CreateTask(),
      },
    );
  }
}

class AppState extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<AppState> {
  List<Task> tasks = [
    Task('Do homework', false),
    Task('Laundry', false),
    Task('Finish this tutorial', false)
  ];

  void _onReorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      // removing the item at oldIndex will shorten the list by 1.
      newIndex -= 1;
    }
    setState(() {
      final Task element = tasks.removeAt(oldIndex);
      tasks.insert(newIndex, element);
    });
  }

  void sorting() {
    setState(() {
      tasks.sort();
    });
  }

  void sortingreverse() {
    setState(() {
      tasks = tasks.reversed.toList();
    });
  }

  void searchTask() {
    setState(() {
      return Scaffold(
          // body: TextBox(),
          );
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        automaticallyImplyLeading: false,
        title: Text(
          "Task",
          style: TextStyle(color: Colors.cyanAccent[100]),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.sort_by_alpha),
              tooltip: "Sort",
              onPressed: sorting),
          IconButton(
              icon: Icon(Icons.sort),
              tooltip: "Sort",
              onPressed: sortingreverse),
          IconButton(
            icon: Icon(Icons.search),
            tooltip: "Sort",
            onPressed: searchTask,
          ),
        ],
      ),
      body: ReorderableListView(
        // onReorder: _onReorder,
        onReorder: _onReorder,
        padding: EdgeInsets.all(1),
        children: <Widget>[
          for (final value in tasks)
            CheckboxListTile(
              value: false,
              onChanged: null,
              key: Key(value.getName()),
              title: Card(
                color: Colors.amberAccent,
                key: ValueKey(value),
                child: ListTile(
                  title: Text(
                    value.getName(),
                    key: Key(value.getName()),
                    style: GoogleFonts.roboto(fontSize: 22),
                  ),
                ),
              ),
            )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/create'),
        child: Icon(Icons.add),
      ),
    );
  }
}

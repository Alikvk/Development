import 'package:flutter/material.dart';
import 'package:flutterexample/randomwords.dart'; // Add this line.

void main() => runApp(FirstExample());

class FirstExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Add the 3 lines from here...
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        body: Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}

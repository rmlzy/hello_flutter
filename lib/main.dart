import 'package:flutter/material.dart';
import 'todo/app.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(primarySwatch: Colors.green),
      home: new TodoApp(),
    );
  }
}

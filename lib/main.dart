import 'package:flutter/material.dart';

import 'home/home.dart';
import 'todo/todo.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(primarySwatch: Colors.blueGrey),
      home: new HomePage(),
      routes: <String, WidgetBuilder>{
        '/todo': (BuildContext ctx) => new TodoPage()
      },
    );
  }
}

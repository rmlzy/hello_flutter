import 'package:flutter/material.dart';
// demos
import 'package:hello_flutter/demos/IndexDemo.dart';
import 'package:hello_flutter/demos/LifecycleDemo.dart';
import 'package:hello_flutter/demos/GridDemo.dart';

import 'pages/HomePage.dart';
import 'pages/LoginPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Hello Flutter',
      theme: new ThemeData(primarySwatch: Colors.teal),
      home: new LoginPage(),
      routes: <String, WidgetBuilder>{
        '/demo/index': (BuildContext ctx) => new IndexDemo(),
        '/demo/lifecycle': (BuildContext ctx) => new LifecycleDemo(),
        '/demo/grid': (BuildContext ctx) => new GridDemo(),
        '/login': (BuildContext ctx) => new LoginPage(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'side_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('HOME'),
      ),
      body: new Padding(
        padding: new EdgeInsets.all(10.0),
        child: new Column(),
      ),
      drawer: new Padding(
        padding: EdgeInsets.only(right: 80.0),
        child: new SideDrawer(),
      ),
    );
  }
}

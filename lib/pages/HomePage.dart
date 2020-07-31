import 'package:flutter/material.dart';
import 'package:hello_flutter/widgets/SideDrawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> papers = <String>['A', "B", 'C'];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('首页'),
      ),
      body: ListView.builder(
          itemCount: papers.length,
          itemBuilder: (context, index) {
            return Container(
              height: 50,
              color: Color.fromRGBO(0, 0, 0, 0.1),
              child: Center(
                child: Text('Hello ${papers[index]}'),
              ),
            );
          }),
      drawer: new Padding(
        padding: EdgeInsets.only(right: 80.0),
        child: new SideDrawer(),
      ),
    );
  }
}

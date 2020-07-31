import 'package:flutter/material.dart';

class GridDemo extends StatefulWidget {
  @override
  _GridDemoState createState() => new _GridDemoState();
}

class _GridDemoState extends State<GridDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('布局'),
        ),
        body: ListView(
          children: <Widget>[
            ButtonBar(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    RaisedButton(
                      child: Text("顶部居中"),
                      onPressed: () {},
                    ),
                    RaisedButton(
                      child: Text("顶部居中"),
                      onPressed: () {},
                    ),
                    RaisedButton(
                      child: Text("顶部居中"),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            Container(
              // 宽度和高度
              constraints: BoxConstraints.expand(
                width: 300,
                height: 100,
              ),

              alignment: Alignment.topCenter,

              // 背景色
              color: Colors.red,

              // 子控件
              child: Text("顶部居中"),
            ),
            Container(
              // 宽度和高度
              constraints: BoxConstraints.expand(
                width: 300,
                height: 100,
              ),

              alignment: Alignment.topRight,

              // 背景色
              color: Colors.green,

              // 子控件
              child: Text("顶部居中"),
            ),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'button_demo.dart';
import 'icon_demo.dart';
import 'list_demo.dart';
import 'dialog_demo.dart';

class UiPage extends StatefulWidget {
  @override
  _UiPageState createState() => _UiPageState();
}

class _UiPageState extends State<UiPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('UI Components'),
      ),
      body: new Padding(
        padding: new EdgeInsets.all(0.0),
        child: new ListView(
          children: <Widget>[
            new ButtonDemo(),
            new IconDemo(),
            new ListDemo(),
            new DialogDemo()
          ],
        ),
      ),
    );
  }
}

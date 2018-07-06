import 'package:flutter/material.dart';

class ListDemo extends StatefulWidget {
  @override
  _ListDemoState createState() => new _ListDemoState();
}

class _ListDemoState extends State<ListDemo> {
  List<String> listData = <String>[
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
  ];

  @override
  Widget build(BuildContext context) {
    Iterable<Widget> list = listData.map((String item) => new Text(item));

    return new Card(
      child: new Column(
        children: <Widget>[
          new ListTile(
            title: new Text('List'),
          ),
          new Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
            child: new Row(
              children: list.toList(),
            ),
          )
        ],
      ),
    );
  }
}

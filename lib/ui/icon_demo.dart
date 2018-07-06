import 'package:flutter/material.dart';

class IconDemo extends StatefulWidget {
  @override
  _IconDemoState createState() => new _IconDemoState();
}

class _IconDemoState extends State<IconDemo> {
  static final List<IconData> icons = <IconData>[
    Icons.accessibility_new,
    Icons.threesixty,
    Icons.threed_rotation,
    Icons.four_k,
    Icons.ac_unit,
    Icons.access_alarm,
    Icons.access_alarms,
    Icons.access_time,
    Icons.accessibility,
    Icons.accessible,
    Icons.border_right,
  ];

  Iterable<Widget> iconList = icons.map((IconData item) => new Icon(item));

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Column(
        children: <Widget>[
          new ListTile(
            title: new Text('Icon'),
          ),
          new Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
            child: new Row(
              children: iconList.toList(),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ButtonDemo extends StatefulWidget {
  @override
  _ButtonDemoState createState() => new _ButtonDemoState();
}

class _ButtonDemoState extends State<ButtonDemo> {
  @override
  Widget build(BuildContext context) {
    return new Card(
        child: new Padding(
      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new ListTile(
            title: new Text('Button'),
            subtitle: new Text('Some Buttons Examples.'),
          ),
          new SizedBox(
            width: double.infinity,
            child: new FlatButton(
              onPressed: () => {},
              color: Colors.blue[400],
              textColor: Colors.white,
              child: new Text('FlatButton'),
            ),
          ),
          new RaisedButton(
            onPressed: () => {},
            color: Colors.redAccent,
            textColor: Colors.white,
            child: new Text('RaisedButton'),
          ),
          new FloatingActionButton(
            onPressed: null,
            child: new Icon(Icons.hearing),
          ),
          new IconButton(
            icon: Icon(Icons.help),
            onPressed: null,
          ),
          new ButtonBar(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new RaisedButton(
                onPressed: () => {},
                textColor: Colors.white,
                color: Colors.blue,
                child: new Text('LEFT'),
              ),
              new RaisedButton(
                onPressed: () => {},
                textColor: Colors.white,
                color: Colors.red,
                child: new Text('Right'),
              ),
            ],
          )
        ],
      ),
    ));
  }
}

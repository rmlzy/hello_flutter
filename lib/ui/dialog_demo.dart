import 'package:flutter/material.dart';

class DialogDemo extends StatefulWidget {
  @override
  _DialogDemo createState() => new _DialogDemo();
}

class _DialogDemo extends State<DialogDemo> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void showDemoDialog<T>({BuildContext context, Widget child}) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((T value) {
      if (value != null) {
        _scaffoldKey.currentState.showSnackBar(
            new SnackBar(content: new Text('You selected: $value')));
      }
    });
  }

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
              children: <Widget>[
                new FlatButton(
                  color: Colors.orange,
                  textColor: Colors.white,
                  child: new Text('Show Dialog'),
                  onPressed: () {
                    showDemoDialog(
                      context: context,
                      child: new AlertDialog(
                        content: new Text('Are you OK?'),
                        actions: <Widget>[
                          new FlatButton(
                            textColor: Colors.grey,
                            child: new Text('No'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          new FlatButton(
                            textColor: Colors.blue,
                            child: const Text('Yes'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

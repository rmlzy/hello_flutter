import 'package:flutter/material.dart';
import 'package:hello_flutter/todo/todo.dart';
import 'package:hello_flutter/ui/ui.dart';

class SideDrawer extends StatefulWidget {
  @override
  _SideDrawerState createState() => new _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  void toHomePage() {
    Navigator.pop(context);
  }

  void toUiPage() {
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => new UiPage()));
  }

  void toTodoPage() {
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => new TodoPage()));
  }

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new Column(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text("liuzhiyuan2018"),
            accountEmail: new Text("liuzhiyuan2018@gmail.com"),
            otherAccountsPictures: <Widget>[
              new IconButton(
                  icon: new Icon(
                    Icons.info,
                    color: Colors.white,
                    size: 36.0,
                  ),
                  onPressed: null)
            ],
            currentAccountPicture: new CircleAvatar(
              backgroundColor: Theme.of(context).accentColor,
              backgroundImage: new AssetImage("assets/eiheihei.jpeg"),
            ),
          ),
          new Expanded(
            child: new ListView(
              children: <Widget>[
                new ListTile(
                  title: new Text('Home'),
                  onTap: toHomePage,
                ),
                new Divider(
                  height: 1.0,
                  color: Colors.grey,
                ),
                new ListTile(
                  title: new Text('UI Components'),
                  onTap: toUiPage,
                ),
                new Divider(
                  height: 1.0,
                  color: Colors.grey,
                ),
                new ListTile(
                  title: new Text('TODO List'),
                  onTap: toTodoPage,
                ),
                new Divider(
                  height: 1.0,
                  color: Colors.grey,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

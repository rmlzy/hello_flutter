import 'package:flutter/material.dart';

import 'package:hello_flutter/widgets/Request.dart';
import 'package:hello_flutter/widgets/Toast.dart';

class SideDrawer extends StatefulWidget {
  @override
  _SideDrawerState createState() => new _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  String nickname = '';
  String avatar = '';
  String phone = '';
  String signature = '';
  String level = '';

  _fetchUserInfo() async {
    try {
      final token = await Request.getCookie('token');
      final r = await Request.get("/api/user/info",
          queryParameters: {'token': token});
      final res = r.json();
      if (!res['success']) {
        Toast.show(context, "提示", res['message']);
        return;
      }
      setState(() {
        nickname = res['data']['nickname'];
        avatar = Request.host + res['data']['avatar'];
        phone = res['data']['phone'];
        signature = res['data']['signature'];
        level = res['data']['level'];
      });
    } catch (e) {
      Toast.show(context, "提示", "获取用户信息失败");
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(nickname),
            accountEmail: Text(signature),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).accentColor,
              backgroundImage: avatar == '' ? null : NetworkImage(avatar),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.label),
                  title: Text('Home'),
                  trailing: Text('Metadata'),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('UI Components'),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('TODO List'),
                  onTap: () {},
                ),
                Divider(
                  height: 1.0,
                  color: Colors.grey,
                ),
                ListTile(
                  title: Text('设置'),
                  onTap: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

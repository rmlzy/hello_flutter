import 'package:flutter/material.dart';

class IndexDemo extends StatefulWidget {
  @override
  _IndexDemoState createState() => new _IndexDemoState();
}

class _IndexDemoState extends State<IndexDemo> {
  List demos = [];

  void _setDemos() {
    setState(() {
      demos = [
        {"path": "/demo/lifecycle", "title": "生命周期", "subTitle": ""},
        {"path": "/demo/grid", "title": "布局", "subTitle": ""},
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    // build 里的方法会在每次页面更新时触发, 相当于 react 的 render 方法
    print("build 触发!");
    return Scaffold(
        appBar: AppBar(
          title: InkWell(
            onTap: () {
              _setDemos();
            },
            child: Text('示例'),
          ),
        ),
        body: Container(
          child: ListView.builder(
            itemCount: demos.length,
            itemBuilder: (ctx, index) {
              return Card(
                child: ListTile(
                  title: Text("${index + 1}. ${demos[index]['title']}"),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, demos[index]['path']);
                  },
                ),
              );
            },
          ),
        ));
  }
}

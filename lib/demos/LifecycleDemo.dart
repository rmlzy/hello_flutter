import 'package:flutter/material.dart';

class LifecycleDemo extends StatefulWidget {
  @override
  _LifecycleDemoState createState() => new _LifecycleDemoState();
}

class _LifecycleDemoState extends State<LifecycleDemo> {
  int count = 0;

  @override
  void initState() {
    print("initState 触发!");
    super.initState();
    this.count = 1;
  }

  @override
  void didChangeDependencies() {
    print("didChangeDependencies 触发!");
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    print("dispose 触发!");
    super.dispose();
    count = 0;
  }

  @override
  Widget build(BuildContext context) {
    print("build 触发!");
    return Container(
      child: Text("请查看控制台"),
    );
  }
}

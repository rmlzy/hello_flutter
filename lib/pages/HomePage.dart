import 'package:flutter/material.dart';
import 'package:hello_flutter/widgets/SideDrawer.dart';
import 'package:hello_flutter/widgets/Request.dart';
import 'package:hello_flutter/widgets/Toast.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List papers = [];

  _fetchPapers() async {
    try {
      final r = await Request.get("/api/paper");
      final res = r.json();
      if (!res['message']) {
        Toast.show(context, "提示", res['message']);
        return;
      }
      setState(() {
        papers = res['data']['list'];
        print(papers);
      });
    } catch (e) {
      print(e);
      Toast.show(context, "提示", "抱歉, 服务器开小差了");
    } finally {}
  }

  _renderPaper(context, index) {
    return Card(
      child: ListTile(
        title: Text("${papers[index]['name']}"),
        trailing: Icon(Icons.arrow_right),
        onTap: () {},
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchPapers();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('首页'),
      ),
      body: ListView.builder(
          itemCount: papers.length,
          itemBuilder: (context, index) {
            return _renderPaper(context, index);
          }),
      drawer: new Padding(
        padding: EdgeInsets.only(right: 80.0),
        child: new SideDrawer(),
      ),
    );
  }
}

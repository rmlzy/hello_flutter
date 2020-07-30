import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneCtrl = new TextEditingController();
  TextEditingController pwdCtrl = new TextEditingController();
  TextEditingController captchaCtrl = new TextEditingController();
  
  _getCaptcha() async {
    try {
      final r = await http.get("http://qa.util.city/api/captcha");
      print(r);
    } catch (e) {
      print(e);
    }
  }

  loginScaffold() => Scaffold(
    appBar: AppBar(title: Text("登录"),),
    body: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          TextField(
            controller: phoneCtrl,
            decoration: InputDecoration(
              labelText: "手机号",
              hintText: "请输入国内手机号",
              prefixIcon: Icon(Icons.phone)
            ),
          ),

          TextField(
            controller: pwdCtrl,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "密码",
              hintText: "请输入密码",
              prefixIcon: Icon(Icons.lock)
            ),
          ),

          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: TextField(
                  controller: captchaCtrl,
                  decoration: InputDecoration(
                      labelText: "验证码",
                      hintText: "请输入验证码",
                      prefixIcon: Icon(Icons.phone)
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text("CAPTCHA"),
              )
            ],
          ),

          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            child: RaisedButton(
              child: Text("登录"),
              color: Colors.blue,
              colorBrightness: Brightness.dark,
              onPressed: () {
                print(phoneCtrl.text);
                print(pwdCtrl.text);
              },
            ),
          )
        ],
      ),
    ),
  );

  @override
  void initState() {
    super.initState();
    _getCaptcha();
  }

  @override
  Widget build(BuildContext context) {
    return loginScaffold();
  }
}

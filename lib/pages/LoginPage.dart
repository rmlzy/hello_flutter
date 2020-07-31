import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:hello_flutter/pages/HomePage.dart';
import 'package:hello_flutter/widgets/Request.dart';
import 'package:hello_flutter/widgets/Toast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneCtrl = new TextEditingController();
  TextEditingController pwdCtrl = new TextEditingController();
  TextEditingController captchaCtrl = new TextEditingController();

  var _submitting = false;
  var _captchaSvg;

  void _toHomePage() {
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => new HomePage()));
  }

  _fetchCaptcha() async {
    try {
      final r = await Request.get("/api/captcha");
      final res = r.json();
      if (!res['success']) {
        Toast.show(context, "提示", res['message']);
        return;
      }
      setState(() {
        _captchaSvg = SvgPicture.string(res['data']);
      });
    } catch (e) {
      Toast.show(context, "提示", e['message']);
    }
  }

  _login() async {
    if (phoneCtrl.text.length != 11) {
      Toast.show(context, "提示", "请输入手机号");
      return;
    }
    setState(() {
      _submitting = true;
    });
    await Future.delayed(Duration(seconds: 2));
    try {
      final headers = {"content-type": "application/json"};
      final body = {
        'phone': phoneCtrl.text,
        'password': pwdCtrl.text,
        'captcha': captchaCtrl.text
      };
      final r = await Request.post("/api/login", headers: headers, body: body);
      final res = r.json();
      if (!res['success']) {
        Toast.show(context, "提示", res['message']);
        return;
      }
      await Request.setCookie("token", res['data']['token']);
      _toHomePage();
    } catch (e) {
      Toast.show(context, "提示", "登录失败");
    } finally {
      setState(() {
        _submitting = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchCaptcha();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text("登录"),
            TextField(
              controller: phoneCtrl,
              decoration: InputDecoration(
                  labelText: "手机号",
                  hintText: "请输入手机号",
                  prefixIcon: Icon(Icons.phone)),
            ),
            TextField(
              controller: pwdCtrl,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "请输入密码",
                  prefixIcon: Icon(Icons.lock)),
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
                        prefixIcon: Icon(Icons.phone)),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () async {
                        _fetchCaptcha();
                      },
                      child: Container(
                        child: _captchaSvg,
                      ),
                    ))
              ],
            ),
            Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 40),
                child: ButtonTheme(
                  height: 50.0,
                  child: _submitting
                      ? RaisedButton(
                          child: Text("登录中..."),
                          color: Colors.teal,
                          colorBrightness: Brightness.dark,
                          onPressed: null,
                        )
                      : RaisedButton(
                          child: Text("登录"),
                          color: Colors.teal,
                          colorBrightness: Brightness.dark,
                          onPressed: () async {
                            _login();
                          },
                        ),
                ))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogRouter extends PageRouteBuilder {
  final Widget page;

  DialogRouter(this.page)
      : super(
          opaque: false,
          barrierColor: Color(0x00000001),
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              child,
        );
}

class Loading {
  static void show(BuildContext context, {bool mateStyle}) {
    Navigator.of(context).push(DialogRouter(LoadingDialog()));
  }

  static void hide(BuildContext context) {
    Navigator.of(context).pop();
  }
}

class LoadingDialog extends Dialog {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Material(
          //创建透明层
          type: MaterialType.transparency, //透明类型
          child: Center(
            //保证控件居中效果
            child: CupertinoActivityIndicator(
              radius: 18,
            ),
          ),
        ),
        onWillPop: () async {
          return Future.value(false);
        });
  }
}

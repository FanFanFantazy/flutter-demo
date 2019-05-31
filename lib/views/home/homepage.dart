import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../../routers/routes.dart';
import '../../component/sideMenu.dart';
import 'dart:convert';

///第一个界面
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Page1State();
}

class Page1State extends State<HomePage> {
  String message = 'hello world';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('FanFanFantazy'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.chevron_right),
              onPressed: () => _intentTo(context)
            )
          ],
        ),
        drawer: MyDrawer(),
        body: Center(
            child: Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage('images/homeBG.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ))
        // child: _myImage())),
        );
  }

  _intentTo(BuildContext context) {
    ///字符串编码
    var json = jsonEncode(Utf8Encoder().convert('from home page'));
    Routes.router
        .navigateTo(context, '/author?message=$json', //跳转路径
            transition: TransitionType.inFromRight //过场效果
            )
        .then((result) {
      //回传值
      if (result != null) {
        message = result;
      }
    });
  }
}

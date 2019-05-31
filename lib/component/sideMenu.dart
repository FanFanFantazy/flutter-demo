import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../routers/routes.dart';
import 'dart:convert';

class MyDrawer extends StatefulWidget {
  @override
  createState() => new MyDrawerState();
}

class MyDrawerState extends State<MyDrawer> {
  bool _hidDetail = true;
  @override
  Widget build(BuildContext context) {
    return new Drawer(
        child: ListView(
      children: <Widget>[
        new UserAccountsDrawerHeader(
          accountName: new Text('Fan'),
          accountEmail: Text('316042496@qq.com'),
          currentAccountPicture: new CircleAvatar(
            backgroundImage: new AssetImage('images/camel.jpg'),
          ),
          onDetailsPressed: () {
            setState(() {
              _hidDetail = !_hidDetail;
            });
          },
          margin: EdgeInsets.all(0.0),
        ),
        _hidDetail
            ? Container(height: 0.0, width: 0.0)
            : Card(
                color: const Color(0xFF111111),
                margin: EdgeInsets.all(0.0),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                  child: Text(
                      '''A camel is an even-toed ungulate in the genus Camelus that bears distinctive fatty deposits known as humps on its back. Camels have long been domesticated and, as livestock, they provide food (milk and meat) and textiles (fiber and felt from hair).''',
                      softWrap: true),
                )),
        _NodeLabel(),
      ],
    ));
  }
}

class _NodeLabel extends StatefulWidget {
  @override
  createState() => new NodeLabelState();
}

class NodeLabelState extends State<_NodeLabel> {
  bool _expand = true;
  @override
  Widget build(BuildContext context) {
    // 
    return new GestureDetector(
      child: new InkWell(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(_expand
                        ? Icons.keyboard_arrow_right
                        : Icons.keyboard_arrow_down),
                    Text('About'),
                  ],
                ),
                _expand ? Container(height: 0.0, width: 0.0) : _ChildLabel()
              ],
            )
          ),
          onTap: () {
            setState(() {
              _expand = !_expand;
            });
          }),
    );
  }
}

class _ChildLabel extends StatefulWidget {
  @override
  createState() => new ChildLabelState();
}

class ChildLabelState extends State<_ChildLabel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
      new ListTile(
        title: new Text('Author Page'),
        onTap: () => _intentTo(context, 'author'),
      ),
      new ListTile(
        title: new Text('Info Page'),
        onTap: () => _intentTo(context, 'info'),
      ),
    ]);
  }
}

_intentTo(BuildContext context, String route) {
  ///字符串编码
  Navigator.of(context).pop();
  var json = jsonEncode(Utf8Encoder().convert('from home page'));
  Routes.router
      .navigateTo(context, '/$route?message=$json', //跳转路径
          transition: TransitionType.inFromRight //过场效果
          )
      .then((result) {});
}

// new GestureDetector(
//     child: new InkWell(
//         child: new RaisedButton(
//           materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//           child: Text('double click'),
//           onPressed: null,
//         ),
//         onDoubleTap: () {
//           _intentTo(context, 'author');
//         })),

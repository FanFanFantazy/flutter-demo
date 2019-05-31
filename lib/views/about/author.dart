import 'package:flutter/material.dart';
import 'dart:convert';

class Author extends StatelessWidget {
  final String message;
  const Author(this.message);
  @override
  Widget build(BuildContext context) {
    var list = List<int>();
    ///字符串解码
    jsonDecode(message).forEach(list.add);
    final String value = Utf8Decoder().convert(list);
    return Scaffold(
        appBar: AppBar(
          title: Text('Author Info'),
        ),
        body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(value),
            RaisedButton(
                onPressed: () => Navigator.pop(context, 'from author!!'),
                child: Text('back to home'))
          ],
        )));
  }
}
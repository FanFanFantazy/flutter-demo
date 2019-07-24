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
      body: ListView(
        children: <Widget>[
          new Card(
            color: const Color(0xFF1F1F1F),
            margin: EdgeInsets.all(10.0),
            child: new Column(
              children: <Widget>[
                // new Image.asset('images/camel.jpg'),
                _BasicInfo(),
              ],
            )
          ),
          new Card(
            color: const Color(0xFF1F1F1F),
            margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: _Education()
          ),
        ],
      )
      // body: Center(
      //   child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: <Widget>[
      //     Text(value),
      //     RaisedButton(
      //         onPressed: () => Navigator.pop(context, 'from author!!'),
      //         child: Text('back to home'))
      //   ],
      // ))
    );
  }
}
class _BasicInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(10.0),
      child: new Column(
        children: <Widget>[
          new Text('FanFanDantazy', style: new TextStyle(
              color: const Color(0xFFCCCCCC),
              fontSize: 20.0,
            )),
          new Text('Fan Wang', style: new TextStyle(
              color: const Color(0xFF555555),
              fontSize: 25.0,
            )),
        ],
      ),
    );
  }
}

class _Education extends StatelessWidget {
  final _h1Style = const TextStyle(fontSize: 16.0);
  final _h2Style = const TextStyle(fontSize: 15.0);
  final _h3Style = const TextStyle(fontSize: 14.0);
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      padding: EdgeInsets.all(10.0),
      child: new Column(
        children: <Widget>[
          new Text('EDUCATION', style: new TextStyle(
              color: const Color(0xFFCCCCCC),
              fontSize: 18.0,
            )),
          new Container(
            padding: EdgeInsets.all(5.0),
            child: new Row(
              children: <Widget>[
                Expanded(
                  child: new Text('Warwick Business School', style: _h1Style),
                ),
                new Text('Coventry, UK', textAlign: TextAlign.right, style: _h2Style)
              ],
            )
          ),
          new Container(
            padding: EdgeInsets.all(5.0),
            child: new Row(
              children: <Widget>[
                Expanded(
                  child: new Text('MSc Information Systems Management and Innovation', style: _h3Style),
                ),
                new Text('2016.10 – 2018.02', textAlign: TextAlign.right, style: _h3Style),
              ],
            )
          ),
          new Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.person_pin, size: 18),
                  Text('Degree: Merit Master’s Degree')
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
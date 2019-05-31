import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Author Info'),
        ),
        body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('info page'),
            RaisedButton(
              onPressed: () => Navigator.pop(context, 'from info!'),
              child: Text('back to home')
            )
          ],
        )));
  }
}
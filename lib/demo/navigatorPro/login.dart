
import 'package:flutter/material.dart';

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        title: new Text('Login'),
      ),
      body: Center (
        child: new RaisedButton(
          child: new Text('Log In'),
          onPressed: () {
            Navigator.of(context).pushNamed('/');
          },
        )
      )
    );
  }
}

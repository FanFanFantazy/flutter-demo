import 'package:flutter/material.dart';
import './home.dart';
import './profile.dart';
import './login.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MainFrame(),
      theme: new ThemeData(
        primaryColor: Colors.teal,
      ),
      initialRoute: '/',
      routes: {
        '/login': (BuildContext context) => new LoginWidget()
      },
    );
  }
}

class MainFrame extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomeState();
  }
}

class _HomeState extends State<MainFrame> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    new PlaceholderWidget('Home'),
    new PlaceholderWidget('Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: new BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            title: new Text('Profile'),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class PlaceholderWidget extends StatelessWidget {
  final String text;

  PlaceholderWidget(this.text);

  @override
  Widget build(BuildContext context) {
    if (text == 'Home') {
      return HomeNavigator();
    } else if (text == 'Profile') {
      return Profile();
    }
  }
}
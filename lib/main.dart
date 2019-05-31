import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './routers/routes.dart';
import './uitils/theme.dart';

///启动
void main() {
  ///初始化并配置路由
  final router = new Router();
  Routes.configureRoutes(router);
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      onGenerateRoute: Routes.router.generator,
      theme: myTheme()
    );
  }
}

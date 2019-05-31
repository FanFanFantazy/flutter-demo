import 'package:fluro/fluro.dart';
import '../views/home/homepage.dart';
import '../views/about/author.dart';
import '../views/about/info.dart';

class Routes {
  static Router router;
  static void configureRoutes(Router router) {
    router.define('/', handler: Handler(handlerFunc: (context, params) => HomePage()));
    router.define('/author', handler: Handler(handlerFunc: (context, params) {
      var message = params['message']?.first; //取出传参
      return Author(message);
    }));
    router.define('/info', handler: Handler(handlerFunc: (context, params) => InfoPage()));
    Routes.router = router;
  }
}

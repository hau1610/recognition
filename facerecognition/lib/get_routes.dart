import 'package:aplusphoto/page/HomePage/index.dart';
import 'package:aplusphoto/page/Introduction/index.dart';
import 'package:get/get.dart';

mixin AppRoutes {
  static final routes = [
    GetPage(name: '/introduction', page: () => Introduction()),
    GetPage(name: '/home', page: () => HomePage()),
  ];
}

class Routes {
  static const String home = '/home';
  static const String introduction = '/introduction';
}

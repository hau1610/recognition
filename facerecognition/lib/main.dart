import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'get_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        enableLog: true,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: Routes.introduction,
        getPages: AppRoutes.routes);
  }
}

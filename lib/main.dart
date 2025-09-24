import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:todo_list_app/bindings/dashboard_bindings.dart';
import 'package:todo_list_app/routes/pages.dart';
import 'package:todo_list_app/routes/routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
      ),
      initialRoute: AppRoute.splashscreenPage,
      getPages: AppPages.pages,
      initialBinding: DashboardBinding(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/bindings/login_bindings.dart';
import 'package:todo_list_app/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: LoginBinding(),
      home: const LoginPage(),
    );
  }
}

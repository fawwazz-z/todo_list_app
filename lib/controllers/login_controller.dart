import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_app/routes/routes.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoggedIn = false.obs;

  login() async {
    if (usernameController.text.toString() == "admin" &&
        passwordController.text.toString() == "admin") {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("username", usernameController.text.toString());
      Get.offAllNamed(AppRoute.todoListPage);
      Get.snackbar("Login", "Login Successful");
    } else {
      Get.snackbar("Error", "invalid username or password");
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

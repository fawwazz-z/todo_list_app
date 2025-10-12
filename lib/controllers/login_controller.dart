import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_app/routes/routes.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoggedIn = false.obs;
  var isMobile = true
      .obs; 

  void updateLayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }

  login() async {
    if (usernameController.text == "admin" &&
        passwordController.text == "admin") {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("username", usernameController.text);
      Get.offAllNamed(AppRoute.todoListPage);
      Get.snackbar("Login", "Login Successful");
    } else {
      Get.snackbar("Error", "Invalid username or password");
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void logout() {}    
}

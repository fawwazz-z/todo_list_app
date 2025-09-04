import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/bindings/dashboard_bindings.dart';
import '../bindings/dashboard_bindings.dart';
import '../pages/dashboard_page.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoggedIn = false.obs;

  void login() {
    if (usernameController.text == "admin" &&
        passwordController.text == "1234") {
      isLoggedIn.value = true;
      Get.snackbar("Success", "Login berhasil");

      // Redirect ke Dashboard
      Get.off(() => const DashboardPage(), binding: DashboardBinding());
    } else {
      Get.snackbar("Error", "Username / Password salah");
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/routes/routes.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoggedIn = false.obs;

    void login() {
          if (usernameController.text == "admin" && passwordController.text == "11") {
        isLoggedIn.value = true;
        Get.snackbar(
          "Success",
          "Login berhasil",
          backgroundColor: Colors.green.withOpacity(0.8),
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 8,
          margin: const EdgeInsets.all(10),
          duration: const Duration(seconds: 2),
        );

        // Redirect ke Dashboard
        Get.offAllNamed(AppRoute.dashboardPage);
      } else {
        Get.snackbar(
          "Error",
          "Username / Password salah",
          backgroundColor: Colors.red.withOpacity(0.8),
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 8,
          margin: const EdgeInsets.all(10),
          duration: const Duration(seconds: 2),
        );
      }
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

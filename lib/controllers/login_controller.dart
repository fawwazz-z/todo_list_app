import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../routes/routes.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoggedIn = false.obs;
  var isMobile = true.obs;

  void updateLayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }

  Future<void> login() async {
    if (usernameController.text == "admin" &&
        passwordController.text == "admin") {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("username", usernameController.text);
      Get.offAllNamed(AppRoute.dashboardPage);
      Get.snackbar(
        "Login",
        "Login Successful",
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        "Error",
        "Invalid username or password",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAllNamed(AppRoute.splashscreenPage);
    Get.snackbar(
      "Logout",
      "Berhasil keluar",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_app/routes/routes.dart';

class ProfileController extends GetxController{
    var isMobile = true.obs; // status layar
    var currentIndex = 0.obs; 

    void updateLayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
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
}
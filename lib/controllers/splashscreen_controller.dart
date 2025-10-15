import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController {
  var isMobile = true
      .obs; // ✅ Tambahan: status apakah tampilan mobile atau widescreen

  // Fungsi untuk mendeteksi ukuran layar
  void updateLayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }

  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }

  // ✅ Cek apakah user sudah login
  Future<void> checkLogin() async {
    // kasih delay biar splashscreen sempat tampil
    await Future.delayed(const Duration(seconds: 3));

    final prefs = await SharedPreferences.getInstance();

    if (prefs.getString("username") != null) {
      // ✅ kalau ada username berarti sudah login → ke dashboard
      Get.offAllNamed(AppRoute.dashboardPage);
    } else {
      // ❌ kalau belum login → ke login page
      Get.offAllNamed(AppRoute.loginPage);
    }
  }
}

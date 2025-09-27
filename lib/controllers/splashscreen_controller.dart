import 'package:get/get.dart';
import '../routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }

  checkLogin() async {
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

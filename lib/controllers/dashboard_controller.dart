import 'package:get/get.dart';

class DashboardController extends GetxController {
  // Index tab aktif
  var currentIndex = 0.obs;

  // Fungsi untuk ganti tab
  void changeTab(int index) {
    currentIndex.value = index;
  }
}

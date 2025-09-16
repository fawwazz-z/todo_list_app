import 'package:get/get.dart';

class DashboardController extends GetxController {
  // index tab aktif
  final RxInt currentIndex = 0.obs;

  // ganti tab
  void changeTab(int index) {
    currentIndex.value = index;
  }
}

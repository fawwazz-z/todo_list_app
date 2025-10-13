import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  var isMobile = true.obs; // status layar
  var currentIndex = 0.obs; // tab index aktif

  void updateLayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }

  void changeTab(int index) {
    currentIndex.value = index;
  }
}

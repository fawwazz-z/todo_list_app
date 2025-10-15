import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'todo_controller.dart';

class HistoryController extends GetxController {
  final todoController = Get.find<TodoController>();

  var isMobile = true.obs; // status layar (mobile / widescreen)
  var currentIndex = 0.obs; // index tab atau halaman aktif

  List get history => todoController.history;

  // 🔧 Perbarui status layout berdasarkan ukuran layar
  void updateLayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }
}

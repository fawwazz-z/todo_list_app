import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'todo_controller.dart';

class AddTodoController extends GetxController {
  final todoController = Get.find<TodoController>();

  // 🧩 Controller untuk form input
  final titleController = TextEditingController();
  final descController = TextEditingController();

  // 🧩 Dropdown kategori
  final List<String> categoryList = ["Sekolah", "Pekerjaan", "Pribadi"];
  final RxString selectedCategory = "Sekolah".obs;

  // 🧩 Responsivitas
  var isMobile = true.obs;
  var currentIndex = 0.obs;

  void updateLayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }

  // 🧩 Simpan Todo baru
  void saveTodo() {
    final title = titleController.text.trim();
    final desc = descController.text.trim();

    if (title.isEmpty || desc.isEmpty) {
      Get.defaultDialog(
        title: "Error",
        middleText: "Judul dan Deskripsi tidak boleh kosong!",
      );
      return;
    }

    final dateNow = DateTime.now().toString();

    todoController.addTodo(
      title,
      desc,
      selectedCategory.value,
      dateNow,
    );

    Get.back();
    Get.snackbar(
      "Sukses",
      "Tugas berhasil ditambahkan",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.8),
      colorText: Colors.white,
    );

    // Kosongkan input setelah disimpan
    titleController.clear();
    descController.clear();
    selectedCategory.value = "Sekolah";
  }
}

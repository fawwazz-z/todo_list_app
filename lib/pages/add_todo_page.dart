import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/todo_controller.dart';

class AddTodoPage extends StatelessWidget {
  AddTodoPage({super.key});

  final TodoController todoController = Get.find();
  final titleController = TextEditingController();
  final descController = TextEditingController();
  final categoryList = ["Sekolah", "Pekerjaan", "Pribadi"];
  final RxString selectedCategory = "Sekolah".obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Tambah Tugas"),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 📌 Judul
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: "Judul",
                    hintText: "Masukkan judul tugas",
                    prefixIcon: const Icon(Icons.title),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // 📌 Deskripsi
                TextField(
                  controller: descController,
                  minLines: 1, // awalnya sama dengan input lain
                  maxLines: null, // bisa melebar sesuai isi
                  decoration: InputDecoration(
                    labelText: "Deskripsi",
                    hintText: "Tambahkan deskripsi detail",
                    prefixIcon: const Icon(Icons.description),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // 📌 Dropdown kategori
                Obx(
                  () => DropdownButtonFormField<String>(
                    value: selectedCategory.value,
                    decoration: InputDecoration(
                      labelText: "Kategori",
                      prefixIcon: const Icon(Icons.category),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    items: categoryList
                        .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                        .toList(),
                    onChanged: (value) {
                      selectedCategory.value = value!;
                    },
                  ),
                ),
                const SizedBox(height: 24),

                // 📌 Tombol Simpan
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.save),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      if (titleController.text.isNotEmpty &&
                          descController.text.isNotEmpty) {
                        final String dateNow = DateFormat(
                          'dd MMM yyyy, HH:mm',
                        ).format(DateTime.now());

                        todoController.addTodo(
                          titleController.text,
                          descController.text,
                          selectedCategory.value,
                          dateNow,
                        );

                        Get.back();
                        Get.snackbar(
                          "Sukses",
                          "Tugas berhasil ditambahkan",
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      } else {
                        Get.snackbar(
                          "Error",
                          "Judul & Deskripsi harus diisi",
                          backgroundColor: Colors.red[400],
                          colorText: Colors.white,
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }
                    },
                    label: const Text(
                      "Simpan",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

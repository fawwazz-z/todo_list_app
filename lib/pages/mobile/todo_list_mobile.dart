import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/controllers/todo_controller.dart';
import 'package:todo_list_app/routes/routes.dart';


class TodoListMobile extends StatelessWidget {
  final TodoController todoController = Get.find();

  TodoListMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Tugas", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.brown[800],
      ),
      body: Obx(() {
        if (todoController.activeTodos.isEmpty) {
          return const Center(child: Text("Belum ada tugas"));
        }
        return ListView.builder(
          itemCount: todoController.activeTodos.length,
          itemBuilder: (context, index) {
            final todo = todoController.activeTodos[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              elevation: 2,
              child: ListTile(
                title: Text(todo.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(todo.description),
                    Text("Kategori: ${todo.category}"),
                    if (todo.date != null) Text("Tanggal: ${todo.date}"),
                  ],
                ),
                trailing: Wrap(
                  spacing: 4,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.orange),
                      onPressed: () => _showEditDialog(context, todo),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _confirmDelete(todo),
                    ),
                    IconButton(
                      icon: const Icon(Icons.check, color: Colors.green),
                      onPressed: () {
                        todoController.markAsDone(index);
                        Get.snackbar("Selesai", "Tugas selesai",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.green.withOpacity(0.8),
                            colorText: Colors.white);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoute.addPage),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _confirmDelete(Todo todo) {
    Get.defaultDialog(
      title: "Konfirmasi",
      middleText: "Apakah Anda yakin ingin menghapus tugas ini?",
      textCancel: "Tidak",
      textConfirm: "Iya",
      confirmTextColor: Colors.white,
      onConfirm: () async {
        await todoController.deleteTodo(todo.id!);
        Get.back();
        Get.snackbar("Terhapus", "Tugas berhasil dihapus",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.withOpacity(0.8),
            colorText: Colors.white);
      },
    );
  }

  void _showEditDialog(BuildContext context, Todo todo) {
    final controller = Get.find<TodoController>();
    final titleCtrl = TextEditingController(text: todo.title);
    final descCtrl = TextEditingController(text: todo.description);
    final categoryList = ["Sekolah", "Pekerjaan", "Pribadi"];
    final RxString selectedCategory = todo.category.obs;

    Get.defaultDialog(
      title: "Edit Tugas",
      content: Column(
        children: [
          TextField(controller: titleCtrl, decoration: const InputDecoration(labelText: "Judul")),
          TextField(controller: descCtrl, decoration: const InputDecoration(labelText: "Deskripsi")),
          Obx(() => DropdownButtonFormField<String>(
                value: selectedCategory.value,
                decoration: const InputDecoration(labelText: "Kategori"),
                items: categoryList.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
                onChanged: (v) => selectedCategory.value = v!,
              )),
        ],
      ),
      textConfirm: "Simpan",
      textCancel: "Batal",
      confirmTextColor: Colors.white,
      onConfirm: () async {
        await controller.updateTodo(
          Todo(
            id: todo.id,
            title: titleCtrl.text,
            description: descCtrl.text,
            category: selectedCategory.value,
            date: todo.date,
            isDone: todo.isDone,
          ),
        );
        Get.back();
        Get.snackbar("Berhasil", "Tugas diperbarui",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.blue.withOpacity(0.8),
            colorText: Colors.white);
      },
    );
  }
}

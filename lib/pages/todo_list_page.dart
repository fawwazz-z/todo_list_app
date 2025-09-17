import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/todo_controller.dart';
import '../widgets/todo_card.dart';
import '../routes/routes.dart';

class TodoListPage extends StatelessWidget {
  final TodoController todoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Tugas"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 2,
      ),
      body: Obx(() {
        if (todoController.activeTodos.isEmpty) {
          return const Center(child: Text("Belum ada Tugas"));
        }
        return ListView.builder(
          itemCount: todoController.activeTodos.length,
          itemBuilder: (context, index) {
            final todo = todoController.activeTodos[index];
            return TodoCard(
              title: todo.title,
              description: todo.description,
              category: todo.category,
              isDone: todo.isDone,
              date: todo.date,
              onDone: () {
                todoController.markAsDone(todoController.todos.indexOf(todo));
                Get.snackbar(
                  "Berhasil",
                  "Tugas dipindahkan ke History",
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.green.withOpacity(0.8),
                  colorText: Colors.white,
                  margin: const EdgeInsets.all(10),
                  borderRadius: 8,
                  duration: const Duration(seconds: 2),
                );
              },
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
}

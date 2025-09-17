import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/todo_controller.dart';
import '../widgets/todo_card.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});
  final TodoController todoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History Tugas"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 2,
      ),
      body: Obx(() {
        if (todoController.history.isEmpty) {
          return const Center(child: Text("Belum ada todo selesai"));
        }
        return ListView.builder(
          itemCount: todoController.history.length,
          itemBuilder: (context, index) {
            final todo = todoController.history[index];
            return TodoCard(
              title: todo.title,
              description: todo.description,
              category: todo.category,
              isDone: true,
            );
          },
        );
      }),
    );
  }
}

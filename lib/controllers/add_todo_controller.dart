import 'package:get/get.dart';
import 'todo_controller.dart';

class AddTodoController extends GetxController {
  final todoController = Get.find<TodoController>();

  var title = ''.obs;
  var description = ''.obs;
  var category = ''.obs;

  void addNewTodo() {
    if (title.isEmpty || description.isEmpty) {
      Get.defaultDialog(
        title: "Error",
        middleText: "Judul dan Deskripsi tidak boleh kosong!",
      );
      return;
    }

    todoController.addTodo(title.value, description.value, category.value);
    Get.back();
    Get.snackbar("Sukses", "Todo berhasil ditambahkan");
  }
}

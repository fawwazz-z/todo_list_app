import 'package:get/get.dart';
import 'todo_controller.dart';
import 'package:intl/intl.dart';

class AddTodoController extends GetxController {
  final todoController = Get.find<TodoController>();

  var title = ''.obs;
  var description = ''.obs;
  var category = ''.obs;
  var dateNow = ''.obs;

  void addNewTodo() {
    if (title.isEmpty || description.isEmpty) {
      Get.defaultDialog(
        title: "Error",
        middleText: "Judul dan Deskripsi tidak boleh kosong!",
      );
      return;
    }

    // 🆕 simpan tanggal saat ini
    var today = dateNow.value = DateFormat(
      'dd MMM yyyy, HH:mm',
    ).format(DateTime.now());

    todoController.addTodo(
      title.value,
      description.value,
      category.value,
      today, // kirim dateNow ke todoController
    );

    Get.back();
    Get.snackbar("Sukses", "Todo berhasil ditambahkan");
  }
}

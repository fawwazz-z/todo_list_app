import 'package:get/get.dart';
import 'todo_controller.dart';

class HistoryController extends GetxController {
  final todoController = Get.find<TodoController>();

  List get history => todoController.history;
}

import 'package:get/get.dart';
import 'todo_controller.dart';
import 'package:intl/intl.dart';

class HistoryController extends GetxController {
  final todoController = Get.find<TodoController>();

  List get history => todoController.history;
}
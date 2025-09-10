import 'package:get/get.dart';
import 'package:todo_list_app/controllers/dashboard_controller.dart';
import 'package:todo_list_app/controllers/todo_controller.dart';
import 'package:todo_list_app/controllers/add_todo_controller.dart';
import 'package:todo_list_app/controllers/history_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<TodoController>(() => TodoController());
    Get.lazyPut<AddTodoController>(() => AddTodoController());
    Get.lazyPut<HistoryController>(() => HistoryController(), fenix: true);
  }
}

import 'package:get/get.dart';
import 'package:todo_list_app/controllers/todo_controller.dart';
import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<TodoController>(() => TodoController());
  }
}

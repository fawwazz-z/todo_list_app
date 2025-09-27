import 'package:get/get.dart';
import 'package:todo_list_app/controllers/splashscreen_controller.dart';

class Splashbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashscreenController>(() => SplashscreenController());
  }
}

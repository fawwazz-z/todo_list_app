import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/add_todo_controller.dart';
import '../mobile/add_todo_mobile.dart';
import '../widescreen/add_todo_widescreen.dart';

class AddTodoTransform extends StatelessWidget {
  const AddTodoTransform({super.key});

  @override
  Widget build(BuildContext context) {
    final AddTodoController controller = Get.put(AddTodoController());

    return LayoutBuilder(
      builder: (context, constraints) {
        controller.updateLayout(constraints);
        return Obx(() {
          return controller.isMobile.value
              ? const AddTodoMobile()
              : const AddTodoWidescreen();
        });
      },
    );
  }
}

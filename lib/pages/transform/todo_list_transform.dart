import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/controllers/todo_controller.dart';
import 'package:todo_list_app/pages/mobile/todo_list_mobile.dart';
import 'package:todo_list_app/pages/widescreen/todo_list_widescreen.dart';

class TodoListTransform extends StatelessWidget {
  const TodoListTransform({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoController controller = Get.find<TodoController>();

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);

          return Obx(() {
            return controller.isMobile.value
                ? TodoListMobile() // tanpa const
                : TodoListWidescreen(); // tanpa const
          });
        },
      ),
    );
  }
}

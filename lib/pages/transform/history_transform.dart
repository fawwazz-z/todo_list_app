import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/controllers/todo_controller.dart';
import 'package:todo_list_app/pages/mobile/history_mobile.dart';
import 'package:todo_list_app/pages/widescreen/history_widescreen.dart';

class HistoryTransform extends StatelessWidget {
  const HistoryTransform({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoController controller = Get.find();

    return LayoutBuilder(
      builder: (context, constraints) {
        controller.updateLayout(constraints);
        return Obx(() {
          return controller.isMobile.value
              ? HistoryMobile()
              : HistoryWidescreen();
        });
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/controllers/dashboard_controller.dart';
import 'package:todo_list_app/pages/mobile/dashboard_mobile.dart';
import 'package:todo_list_app/pages/widescreen/dashboard_widescreen.dart';

class DashboardTransform extends StatelessWidget {
  DashboardTransform({super.key});

  final DashboardController controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);

          return Obx(() {
            return controller.isMobile.value
                ? const DashboardMobile()
                : const DashboardPage();
          });
        },
      ),
    );
  }
}

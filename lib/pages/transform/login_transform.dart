import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/login_controller.dart';
import 'package:todo_list_app/pages/mobile/login_mobile.dart';
import 'package:todo_list_app/pages/widescreen/login_widescreen.dart';

class LoginTransform extends StatelessWidget {
  LoginTransform({super.key});

  final LoginController controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);
          return Obx(
            () => controller.isMobile.value
                ? const LoginMobile()
                : const LoginWidescreen(),
          );
        },
      ),
    );
  }
}

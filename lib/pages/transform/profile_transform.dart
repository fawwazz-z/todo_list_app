import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/controllers/profile_controller.dart';
import 'package:todo_list_app/pages/mobile/profile_mobile.dart';
import 'package:todo_list_app/pages/widescreen/profile_widescreen.dart';

class ProfileTransform extends StatelessWidget {
  const ProfileTransform({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find<ProfileController>();

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);

          return Obx(() {
            return controller.isMobile.value
                ? ProfileMobile() // ✅ untuk HP
                : ProfileWidescreen(); // ✅ untuk layar besar
          });
        },
      ),
    );
  }
}

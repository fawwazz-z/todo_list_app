import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/controllers/splashscreen_controller.dart';
import 'package:todo_list_app/pages/mobile/splashscreen_mobile.dart'; // ✅ ubah nama import
import 'package:todo_list_app/pages/widescreen/splashscreen_widescreen.dart'; // ✅ sudah benar

class SplashscreenTransform extends StatelessWidget {
  const SplashscreenTransform({super.key}); // ✅ gunakan const di sini

  @override
  Widget build(BuildContext context) {
    final SplashscreenController controller = Get.find<SplashscreenController>();

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Ubah status layout (mobile atau widescreen)
          controller.updateLayout(constraints);

          return Obx(() {
            return controller.isMobile.value
                ? const SplashscreenMobile() // ✅ ubah nama class sesuai file
                : const SplashscreenWidescreen(); // ✅ versi laptop
          });
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/login_controller.dart';
import '../../widgets/input_field.dart';
import 'package:todo_list_app/widgets/custom_color.dart';
import '../../widgets/primary_button.dart';

class LoginWidescreen extends StatelessWidget {
  const LoginWidescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    return Scaffold(
      backgroundColor: AppColors.darkBrown,
      body: Center(
        child: Container(
          width: 800,
          height: 450,
          color: AppColors.white,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: AppColors.darkBrown,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.check_circle,
                          size: 100,
                          color: AppColors.white,
                        ),
                        SizedBox(height: 16),
                        Text(
                          "CheckUp App",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppColors.brown,
                        ),
                      ),
                      const SizedBox(height: 40),

                      // Username
                      InputField(
                        controller: controller.usernameController,
                        label: "Username",
                        icon: Icons.person,
                      ),
                      const SizedBox(height: 24),

                      // Password
                      InputField(
                        controller: controller.passwordController,
                        label: "Password",
                        icon: Icons.lock,
                        obscureText: true,
                      ),
                      const SizedBox(height: 36),

                      // Tombol login
                      PrimaryButton(text: "Login", onPressed: controller.login),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

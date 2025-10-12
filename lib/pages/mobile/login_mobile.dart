import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/controllers/login_controller.dart';
import 'package:todo_list_app/widgets/input_field.dart';
import 'package:todo_list_app/widgets/primary_button.dart';

class LoginMobile extends StatelessWidget {
  LoginMobile({Key? key}) : super(key: key);
  final LoginController loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[900],
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(24),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "CheckUp App",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Login to continue",
                  style: TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 32),

                InputField(
                  controller: loginController.usernameController,
                  label: "Username",
                  icon: Icons.person,
                ),
                const SizedBox(height: 20),

                InputField(
                  controller: loginController.passwordController,
                  label: "Password",
                  icon: Icons.lock,
                  obscureText: true,
                ),
                const SizedBox(height: 24),

                PrimaryButton(
                  text: "Login",
                  onPressed: loginController.login,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

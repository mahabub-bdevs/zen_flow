import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zen_flow/core/core.dart';

import '../controller/reset_password_controller.dart';

class ResetPasswordScreen extends StatelessWidget {
  final controller = Get.put(ResetPasswordController());

  ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reset Password")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: controller.newPasswordClt,

              style: TextStyle(color: AppColors.black),
              decoration: InputDecoration(
                labelText: 'New Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: controller.confirmPasswordClt,
              style: TextStyle(color: AppColors.black),
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Obx(
              () => SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : controller.resetPassword,
                  child: controller.isLoading.value
                      ? CircularProgressIndicator()
                      : Text("Reset Password"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

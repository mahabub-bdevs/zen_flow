import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zen_flow/core/core.dart';

import '../controller/forget_password_controller.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: CustomText(
            text: "Forget Password",
            style: AppTextStyles.title2,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.padding20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(text: "email", style: AppTextStyles.body2),
            AppDimensions.space8.h.verticalSpace,
            CustomTextField(controller: controller.emailClt, hintText: "email"),
            AppDimensions.space32.h.verticalSpace,
            CustomButton(
              text: "Forget",
              onPressed: () {
                controller.forgotPassword();
              },
            ),
          ],
        ),
      ),
    );
  }
}

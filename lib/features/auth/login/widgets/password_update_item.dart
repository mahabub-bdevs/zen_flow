import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zen_flow/core/core.dart';
import 'package:zen_flow/features/auth/login/controller/update_account_controller.dart';

class PasswordUpdateItem extends StatelessWidget {
  const PasswordUpdateItem({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateAccountController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: CustomText(text: "Password Update", style: AppTextStyles.body2),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: AppDimensions.space16.w),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: AppDimensions.icon28,
              color: AppColors.black,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.space20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppDimensions.space64.h.verticalSpace,
              CustomText(text: "Current Password", style: AppTextStyles.body4),
              AppDimensions.space8.h.verticalSpace,
              CustomTextField(
                controller: controller.currentPasswordClt,
                hintText: "Current Password",
              ),
              AppDimensions.space16.h.verticalSpace,
              CustomText(text: "New PassWord", style: AppTextStyles.body4),
              AppDimensions.space8.h.verticalSpace,
              CustomTextField(
                controller: controller.newPasswordClt,
                hintText: "New Password",
              ),
              AppDimensions.space16.h.verticalSpace,
              CustomText(text: "Confirm PassWord", style: AppTextStyles.body4),
              CustomTextField(
                controller: controller.confirmPasswordClt,
                hintText: "Confirm Password",
              ),
              AppDimensions.space24.h.verticalSpace,
              CustomButton(
                text: "Update",
                onPressed: () {
                  controller.updatePassword();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

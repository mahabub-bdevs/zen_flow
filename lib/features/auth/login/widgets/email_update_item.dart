import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zen_flow/core/core.dart';
import 'package:zen_flow/features/auth/login/controller/update_account_controller.dart';

class EmailUpdateItem extends StatelessWidget {
  const EmailUpdateItem({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateAccountController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: CustomText(text: "Email Update", style: AppTextStyles.body1),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: AppDimensions.icon24.sp,
            color: AppColors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.space20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: "Email", style: AppTextStyles.body2),
            AppDimensions.space8.h.verticalSpace,
            CustomTextField(
              controller: controller.newEmailClt,
              hintText: "Email",
            ),
            AppDimensions.space20.h.verticalSpace,
            CustomButton(
              text: "Update",
              onPressed: () {
                controller.updateEmail();
              },
            ),
          ],
        ),
      ),
    );
  }
}

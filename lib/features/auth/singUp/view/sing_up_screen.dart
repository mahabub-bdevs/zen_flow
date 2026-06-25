import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zen_flow/core/core.dart';
import 'package:zen_flow/features/auth/singUp/controller/sing_up_controller.dart';
import 'package:zen_flow/routes/app_routes.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SingUpController>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: 80,
        leading: Padding(
          padding: EdgeInsets.only(left: AppDimensions.space24),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: AppDimensions.size50.h,
              width: AppDimensions.size50.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimensions.radius10.r),
                color: AppColors.borderLight,
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: AppDimensions.space8.w),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: AppDimensions.icon24.sp,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: AppDimensions.space20.w,
          right: AppDimensions.space20.w,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: controller.globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppDimensions.size80.h.verticalSpace,
                CustomText(
                  text: AppStrings.createAccount.tr,
                  style: AppTextStyles.heading8,
                ),
                AppDimensions.space16.h.verticalSpace,
                CustomText(
                  text: AppStrings.enterCredentialsAccess.tr,
                  style: AppTextStyles.body3,
                ),
                AppDimensions.space40.h.verticalSpace,
                CustomText(text: "Name", style: AppTextStyles.body2),
                AppDimensions.space16.h.verticalSpace,
                CustomTextField(
                  validator: (value) {
                    return AppValidators.defaultValidator(value);
                  },
                  controller: controller.nameClt,
                  hintText: "Enter your name ",
                ),
                AppDimensions.space20.h.verticalSpace,
                CustomText(text: "Email", style: AppTextStyles.body2),
                AppDimensions.space16.h.verticalSpace,
                CustomTextField(
                  validator: (value) {
                    return AppValidators.emailValidator(value);
                  },
                  controller: controller.emailClt,
                  hintText: "Enter Your Email",
                ),
                AppDimensions.space20.h.verticalSpace,
                CustomText(text: "PassWord", style: AppTextStyles.body2),
                AppDimensions.space16.h.verticalSpace,
                CustomTextField(
                  validator: (value) {
                    return AppValidators.passwordValidator(value);
                  },
                  controller: controller.passwordClt,
                  hintText: "Enter Your Password",
                  isPassword: true,
                  onTogglePassword: () {},
                ),
                AppDimensions.space20.h.verticalSpace,
                CustomText(text: "Confirm", style: AppTextStyles.body2),
                CustomTextField(
                  validator: (value) {
                    return AppValidators.defaultValidator(
                      value,
                      fieldName: "PassWord Don't Match",
                    );
                  },
                  controller: controller.conPasswordClt,
                  hintText: "Enter Your Confirm PassWord",
                  isPassword: true,
                  onTogglePassword: () {},
                ),
                AppDimensions.space24.h.verticalSpace,
                CustomButton(
                  text: AppStrings.register.tr,
                  onPressed: () {
                    controller.singUp();
                  },
                ),
                AppDimensions.space20.h.verticalSpace,
                Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: AppStrings.alreadyHaveAccount.tr,
                          style: AppTextStyles.body4,
                        ),
                        WidgetSpan(
                          child: SizedBox(width: AppDimensions.space4.w),
                        ),
                        TextSpan(
                          text: AppStrings.login.tr,
                          style: AppTextStyles.body3.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: AppDimensions.font15.sp,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            Get.offAllNamed(AppRoutes.login);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

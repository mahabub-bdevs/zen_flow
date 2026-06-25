import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zen_flow/features/profile/controller/profile_controller.dart';
import 'package:zen_flow/routes/app_routes.dart';
import '../../../../core/core.dart';

/// The gradient profile header card showing avatar, name, and email.
class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final avatarSize = getValue<double>(
      mobile: AppDimensions.avatar70,
      tablet: 90,
      desktop: 110,
    );
    final nameSize = getValue<double>(
      mobile: AppDimensions.font20,
      tablet: AppDimensions.font24,
      desktop: 28,
    );
    final emailSize = getValue<double>(
      mobile: AppDimensions.font10,
      tablet: AppDimensions.font15,
      desktop: AppDimensions.font16,
    );
    final controller = Get.put(ProfileController());
    return Container(
      padding: EdgeInsets.all(AppDimensions.padding20.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.radius16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary,
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: avatarSize.r,
            height: avatarSize.r,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: AppDimensions.borderWidthExtraThick,
              ),
            ),
            child: Icon(
              Icons.person,
              size: AppDimensions.icon40.r,
              color: colors.primary,
            ),
          ),
          SizedBox(width: AppDimensions.space16.w),
          Expanded(
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: controller.name.value,
                    fontSize: nameSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  CustomText(
                    text: controller.email.value,
                    fontSize: emailSize,
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              _profileShowDialog(context);
            },
            child: Icon(
              Icons.edit,
              size: AppDimensions.icon28,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  void _profileShowDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.w),
                child: Icon(
                  Icons.browser_updated_outlined,
                  size: AppDimensions.icon40.sp,
                  color: AppColors.primary,
                ),
              ),

              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.close,
                    size: AppDimensions.icon28,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
          title: CustomText(
            text: "Choose to Update !",
            style: AppTextStyles.body2.copyWith(color: AppColors.white),
          ),
          content: CustomText(
            textAlign: TextAlign.center,
            text:
                "Which one would you like to update? Please select Email or Password.",
            style: AppTextStyles.body4.copyWith(color: AppColors.success),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
                Get.toNamed(AppRoutes.emailUpdateItem);
              },
              style: TextButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.green,
              ),
              child: CustomText(
                text: "Email",
                style: AppTextStyles.title4.copyWith(color: AppColors.white),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.green),
              onPressed: () {
                Get.toNamed(AppRoutes.passwordUpdateItem);
              },
              child: CustomText(
                text: "Password",
                style: AppTextStyles.title4.copyWith(color: AppColors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}

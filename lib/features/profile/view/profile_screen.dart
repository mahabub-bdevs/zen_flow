import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zen_flow/features/auth/login/controller/login_controller.dart';
import '../../../core/core.dart';
import '../../../core/widgets/custome_dilog.dart';
import '../widgets/profile_header_widget.dart';
import '../widgets/profile_settings_section.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final maxWidth = getValue<double>(
      mobile: double.infinity,
      tablet: 640,
      desktop: 720,
    );

    return SingleChildScrollView(
      padding: EdgeInsets.all(AppDimensions.padding16.r),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProfileHeaderWidget(),
                SizedBox(height: AppDimensions.space32.h),
                const ProfileSettingsSectionWidget(),
                SizedBox(height: AppDimensions.space32.h),
                CustomButton(
                  text: AppStrings.logout.tr,
                  icon: Icons.logout_rounded,
                  color: colors.error,
                  textColor: colors.textPrimary,
                  onPressed: () async {
                    customDialog(
                      title: 'Leaving so soon',
                      cancelText: "No",
                      confirmText: "LogOut",
                      message:
                          "Don't worry, we'll keep your things safe until you return. Are you sure you want to log out?",
                      onConfirm: () {
                        loginController.getLogOut();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

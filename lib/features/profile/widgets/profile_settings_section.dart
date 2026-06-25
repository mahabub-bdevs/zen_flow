import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/core.dart';
import '../../../../core/utils/settings_util.dart';

/// The "Settings" section containing theme and language pickers.
class ProfileSettingsSectionWidget extends StatelessWidget {
  const ProfileSettingsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: AppDimensions.padding4.w,
            bottom: AppDimensions.space12.h,
          ),
          child: CustomText(
            text: AppStrings.settingsTitle.tr,
            fontSize: getValue<double>(
              mobile: AppDimensions.font18,
              tablet: AppDimensions.font20,
              desktop: AppDimensions.font24,
            ),
            fontWeight: FontWeight.bold,
          ),
        ),
        _ProfileSettingCard(
          icon: Icons.brightness_6_rounded,
          title: AppStrings.theme.tr,
          child: Obx(() => DropdownButton<String>(
                value: SettingsUtil.currentTheme.value,
                icon: Icon(Icons.keyboard_arrow_down_rounded, color: colors.primary),
                underline: const SizedBox(),
                borderRadius: BorderRadius.circular(AppDimensions.radius12.r),
                dropdownColor: Theme.of(context).cardColor,
                items: [
                  DropdownMenuItem(value: 'system', child: CustomText(text: AppStrings.themeAuto.tr)),
                  DropdownMenuItem(value: 'light', child: CustomText(text: AppStrings.themeLight.tr)),
                  DropdownMenuItem(value: 'dark', child: CustomText(text: AppStrings.themeDark.tr)),
                ],
                onChanged: (String? theme) {
                  if (theme != null) SettingsUtil.changeTheme(theme);
                },
              )),
        ),
        SizedBox(height: AppDimensions.space16.h),
        _ProfileSettingCard(
          icon: Icons.language_rounded,
          title: AppStrings.language.tr,
          child: Obx(() => DropdownButton<String>(
                value: SettingsUtil.currentLanguage.value,
                icon: Icon(Icons.keyboard_arrow_down_rounded, color: colors.primary),
                underline: const SizedBox(),
                borderRadius: BorderRadius.circular(AppDimensions.radius12.r),
                dropdownColor: Theme.of(context).cardColor,
                items: [
                  DropdownMenuItem(value: 'en', child: CustomText(text: AppStrings.langEn.tr)),
                  DropdownMenuItem(value: 'ar', child: CustomText(text: AppStrings.langAr.tr)),
                  DropdownMenuItem(value: 'bn', child: CustomText(text: AppStrings.langBn.tr)),
                ],
                onChanged: (String? lang) {
                  if (lang != null) SettingsUtil.changeLanguage(lang);
                },
              )),
        ),
      ],
    );
  }
}

/// A single settings row card (icon, title, trailing widget).
class _ProfileSettingCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget child;

  const _ProfileSettingCard({
    required this.icon,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.padding16.w,
        vertical: AppDimensions.padding8.h,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(AppDimensions.radius16.r),
        border: Border.all(color: colors.outline.withValues(alpha: 0.1)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(AppDimensions.padding8.r),
            decoration: BoxDecoration(
              color: colors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppDimensions.radius10.r),
            ),
            child: Icon(icon, color: colors.primary, size: AppDimensions.radius20.r),
          ),
          SizedBox(width: AppDimensions.space16.w),
          Expanded(
            child: CustomText(
              text: title,
              fontSize: getValue<double>(
                mobile: AppDimensions.font15,
                tablet: AppDimensions.font16,
                desktop: AppDimensions.font18,
              ),
              fontWeight: FontWeight.w500,
            ),
          ),
          child,
        ],
      ),
    );
  }
}

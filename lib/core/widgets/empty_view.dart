import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zen_flow/core/widgets/custom_svg_icon.dart';
import '../theme/app_styles.dart';
import '../theme/app_colors.dart';
import 'custom_text.dart';

class EmptyView extends StatelessWidget {
  final String message;
  final String icon;

  const EmptyView({super.key, required this.message, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomSvgIcon(assetName: icon, width: 150.w, height: 150.h),
          CustomText(
            text: message,
            style: AppTextStyles.heading3,
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zen_flow/core/core.dart';

class InformationCardItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final String action;
  final VoidCallback? onTap;
  const InformationCardItem({
    super.key,
    this.title = "No Name",
    this.subTitle = "No Student ID",
    this.action = "No Class Defind",
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsetsGeometry.only(
          top: AppDimensions.space4.h,
          bottom: AppDimensions.space4.h,
          left: AppDimensions.space12.w,
          right: AppDimensions.space12.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimensions.radius20),
          color: AppColors.primary.withValues(alpha: 0.4),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: title,
                    maxLines: 1,
                    style: AppTextStyles.body3.copyWith(
                      fontSize: AppDimensions.font15.sp,
                      color: AppColors.black,
                    ),
                  ),
                  AppDimensions.space4.h.verticalSpace,
                  CustomText(text: subTitle, style: AppTextStyles.body9),
                ],
              ),
            ),
            Spacer(),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsetsGeometry.only(
                  top: AppDimensions.space4.h,
                  bottom: AppDimensions.space4.h,
                  left: AppDimensions.space8.w,
                  right: AppDimensions.space8.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppDimensions.radius8.r),
                  color: AppColors.body,
                ),
                child: Center(
                  child: CustomText(
                    text: action,
                    style: AppTextStyles.small1.copyWith(
                      color: AppColors.backgroundLight,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

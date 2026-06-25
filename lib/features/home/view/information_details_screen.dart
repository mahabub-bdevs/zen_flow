import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zen_flow/core/core.dart';

class InformationDetailsScreen extends StatelessWidget {
  const InformationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, dynamic>?;
    final data = arguments?['data'];
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: CustomText(
          text: data['name'],
          style: AppTextStyles.body2.copyWith(color: AppColors.black),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 300.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(AppDimensions.radius20.r),
                bottomLeft: Radius.circular(AppDimensions.radius20.r),
              ),
              color: AppColors.primary,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: AppDimensions.space20.w,
                right: AppDimensions.space20.w,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppDimensions.space64.h.verticalSpace,
                  CustomText(
                    text: "Student ID Is : ${data['student_id']}",
                    style: AppTextStyles.heading5.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  AppDimensions.space8.h.verticalSpace,
                  CustomText(
                    text: "Class Is : ${data["class"]}",
                    style: AppTextStyles.heading7.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  AppDimensions.space8.h.verticalSpace,
                  Flexible(
                    child: SelectableText(
                      "Email : ${data["email"]}",
                      style: AppTextStyles.heading7.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  AppDimensions.space8.h.verticalSpace,
                  CustomText(
                    text: "Age : ${data["age"]}",
                    style: AppTextStyles.heading7.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AppDimensions.space20.h.verticalSpace,
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.space20.w,
              ),
              child: CustomText(
                text: "Description Is : ${data['description']}",
                style: AppTextStyles.heading8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zen_flow/core/core.dart';
import '../controller/add_information_controller.dart';

class AddStudentInformation extends StatelessWidget {
  const AddStudentInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddInformationController>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: AppDimensions.space20.w,
            right: AppDimensions.space20.w,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: "Name", style: AppTextStyles.body6),
                AppDimensions.space8.h.verticalSpace,
                CustomTextField(
                  controller: controller.nameClt,
                  hintText: "Enter Your Name",
                ),
                AppDimensions.space12.h.verticalSpace,
                CustomText(text: "Student ID", style: AppTextStyles.body6),
                AppDimensions.space8.h.verticalSpace,
                CustomTextField(
                  controller: controller.studentIDClt,
                  hintText: "Enter Your Student ID",
                ),
                AppDimensions.space12.h.verticalSpace,
                CustomText(text: "Class", style: AppTextStyles.body6),
                AppDimensions.space8.h.verticalSpace,
                CustomTextField(
                  controller: controller.classClt,
                  hintText: "Enter Your Class",
                ),
                AppDimensions.space12.h.verticalSpace,
                CustomText(text: "Age", style: AppTextStyles.body6),
                AppDimensions.space8.h.verticalSpace,
                CustomTextField(
                  controller: controller.ageClt,
                  hintText: "Enter Your Age",
                ),
                AppDimensions.space12.h.verticalSpace,
                CustomText(text: "Description", style: AppTextStyles.body6),
                AppDimensions.space8.h.verticalSpace,
                CustomTextField(
                  controller: controller.descriptionClt,
                  hintText: "Enter Description",
                ),
                AppDimensions.space32.h.verticalSpace,
                Obx(
                  () => CustomButton(
                    text: controller.isLoading.value
                        ? "Loading......"
                        : "Add Information",
                    onPressed: () {
                      controller.inputInformationController();
                    },
                  ),
                ),
                AppDimensions.space20.h.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

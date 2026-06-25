import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zen_flow/core/core.dart';
import 'package:zen_flow/core/utils/app_images.dart';
import 'package:zen_flow/features/home/widgets/information_card_item.dart';
import 'package:zen_flow/features/myInformationList/controller/my_in_list_controller.dart';
import 'package:zen_flow/routes/app_routes.dart';

import '../../../core/widgets/empty_view.dart';

class MyInListScreen extends StatelessWidget {
  const MyInListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyInListController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "My Information List",
          style: AppTextStyles.body2,
        ),
      ),
      body: Obx(() {
        if (controller.infoList.isEmpty) {
          return Center(
            child: EmptyView(
              message: 'No Data',
              icon: ImagePath.emptyFileImage,
            ),
          );
        }
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(height: AppDimensions.space4.h);
          },
          itemCount: controller.infoList.length,
          itemBuilder: (context, index) {
            final data = controller.infoList[index];
            return Padding(
              padding: EdgeInsets.only(
                left: AppDimensions.space20.w,
                right: AppDimensions.space20.w,
              ),
              child: InformationCardItem(
                onTap: () {
                  Get.toNamed(
                    AppRoutes.myInListDetailsScreen,
                    arguments: {
                      "data": data,
                      "controller": controller,
                      "index": index,
                    },
                  );
                },
                title: data['name'],
                subTitle: data['student_id'],
                action: data['class'],
              ),
            );
          },
        );
      }),
    );
  }
}

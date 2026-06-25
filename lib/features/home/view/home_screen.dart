import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zen_flow/core/widgets/empty_view.dart';
import 'package:zen_flow/features/home/widgets/information_card_item.dart';
import 'package:zen_flow/routes/app_routes.dart';
import '../../../core/core.dart';
import '../../../core/utils/app_images.dart';
import '../controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: CustomText(text: "Student Information List"),
        centerTitle: true,
      ),
      backgroundColor: context.appColors.background,
      body: RefreshIndicator(
        onRefresh: controller.refreshData,
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }
          if (controller.infoList.isEmpty) {
            return Center(
              child: EmptyView(
                message: 'No Data',
                icon: ImagePath.emptyFileImage,
              ),
            );
          }
          return ListView.separated(
            controller: controller.scrollController,
            separatorBuilder: (context, index) =>
                SizedBox(height: AppDimensions.space8.h),
            padding: EdgeInsets.all(AppDimensions.space16.h),
            itemCount: controller.infoList.length,
            itemBuilder: (context, index) {
              final data = controller.infoList[index];
              return InformationCardItem(
                onTap: () {
                  Get.toNamed(
                    AppRoutes.informationDetailsScreen,
                    arguments: {
                      "data": data,
                      "index": index,
                      "controller": controller,
                    },
                  );
                },
                title: data['name'],
                subTitle: data['student_id'],
                action: data['class'],
              );
            },
          );
        }),
      ),
    );
  }
}

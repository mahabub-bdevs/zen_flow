import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/widgets/custom_image_view.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<SplashController>();


    return Scaffold(
      backgroundColor: context.appColors.background,
      body: Center(
        child: const CustomImageView(
          imagePath: ImagePath.zenFlowTextLogo,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

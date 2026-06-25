import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zen_flow/routes/app_routes.dart';

import '../../../core/core.dart';
import '../controller/main_controller.dart';
import '../widgets/main_bottom_nav_bar.dart';
import '../widgets/main_navigation_rail.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MainController>();
    final colors = context.appColors;
    return Scaffold(
      backgroundColor: colors.background,

      // ── Desktop/Tablet: side NavigationRail ──────────────────────────────
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addStudentInformation);
        },
        child: Icon(
          Icons.add,
          size: AppDimensions.icon24,
          color: AppColors.backgroundLight,
        ),
      ),
      body: isTablet || isDesktop
          ? Row(
              children: [
                MainNavigationRail(controller: controller),
                const VerticalDivider(thickness: 1, width: 1),
                Expanded(
                  child: Obx(
                    () => IndexedStack(
                      index: controller.currentIndex.value,
                      children: controller.screens,
                    ),
                  ),
                ),
              ],
            )
          // ── Mobile: regular body ─────────────────────────────────────────
          : Obx(
              () => IndexedStack(
                index: controller.currentIndex.value,
                children: controller.screens,
              ),
            ),
      // Only show bottom nav on mobile
      bottomNavigationBar: (isTablet || isDesktop)
          ? null
          : MainBottomNavBar(controller: controller),
    );
  }
}

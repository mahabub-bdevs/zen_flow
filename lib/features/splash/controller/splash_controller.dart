import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToNextScreen();
  }


  Future<void> _navigateToNextScreen() async {
    // Standard delay for splash screen visibility
    await Future.delayed(const Duration(seconds: 3));
    final Session? session = Supabase.instance.client.auth.currentSession;

    if (session != null) {
      Get.toNamed(AppRoutes.main);
    } else {
      Get.toNamed(AppRoutes.onboarding);
    }
  }
}

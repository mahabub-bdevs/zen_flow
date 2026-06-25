import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class OnboardingController extends GetxController {

  // Function to complete onboarding and go to Login
  Future<void> navigateToLogin() async {
    // await _storageService.setOnboarded();
    Get.offAllNamed(AppRoutes.login);
  }

  // Function to complete onboarding and go to Login
  Future<void> navigateToRegister() async {
    // await _storageService.setOnboarded();
    Get.offAllNamed(AppRoutes.singUp);
  }
}

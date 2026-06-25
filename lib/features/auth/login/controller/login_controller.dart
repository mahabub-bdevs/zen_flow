import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zen_flow/features/auth/login/service/login_service.dart';
import 'package:zen_flow/routes/app_routes.dart';
import '../../../myInformationList/controller/my_in_list_controller.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final LoginService loginService = LoginService(Supabase.instance.client);
  final isLoading = false.obs;
  final rememberMe = false.obs;
  final isObscure = true.obs;

  void onToggleObscure() => isObscure.toggle();
  void onToggleRemember(bool? value) => rememberMe.value = value ?? false;

  Future<void> login() async {
    if (!globalKey.currentState!.validate()) return;
    try {
      isLoading.value = true;
      final AuthResponse response = await loginService.loginService(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      if (response.user != null) {
        if (Get.isRegistered<MyInListController>()) {
          Get.delete<MyInListController>(force: true);
        }
        Get.snackbar("Success", "Login Successful");
        clearFiled();
        Get.offAllNamed(AppRoutes.main);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getLogOut() async {
    if (Get.isRegistered<MyInListController>()) {
      Get.delete<MyInListController>(force: true);
    }
    await loginService.getLogOut();
    Get.snackbar("Success", "Logout Successful");
    Get.offAllNamed(AppRoutes.onboarding);
  }

  void clearFiled() {
    emailController.clear();
    passwordController.clear();
  }
}

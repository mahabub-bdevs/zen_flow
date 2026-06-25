import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../routes/app_routes.dart';

class ResetPasswordController extends GetxController {
  final newPasswordClt = TextEditingController();
  final confirmPasswordClt = TextEditingController();
  final isLoading = false.obs;

  Future<void> resetPassword() async {
    if (newPasswordClt.text.isEmpty || confirmPasswordClt.text.isEmpty) {
      Get.snackbar("Error", "সব field পূরণ করো");
      return;
    }
    if (newPasswordClt.text != confirmPasswordClt.text) {
      Get.snackbar("Error", "Password match করেনি");
      return;
    }
    if (newPasswordClt.text.length < 6) {
      Get.snackbar("Error", "কমপক্ষে 6 character হতে হবে");
      return;
    }
    try {
      isLoading.value = true;
      await Supabase.instance.client.auth.updateUser(
        UserAttributes(password: newPasswordClt.text.trim()),
      );
      Get.snackbar("Success", "Password reset successful!");
      Get.offAllNamed(AppRoutes.login);
    } on AuthException catch (e) {
      Get.snackbar("Error", e.message);
    } finally {
      isLoading.value = false;
    }
  }

  
}
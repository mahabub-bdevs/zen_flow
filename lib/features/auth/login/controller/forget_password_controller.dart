import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../service/forget_password_service.dart';

class ForgotPasswordController extends GetxController {
  final ForgotPasswordService _service = ForgotPasswordService(
    Supabase.instance.client,
  );
  final emailClt = TextEditingController();
  final isLoading = false.obs;

  Future<void> forgotPassword() async {
    if (emailClt.text.isEmpty) {
      Get.snackbar("Error", "Email দাও");
      return;
    }
    if (!GetUtils.isEmail(emailClt.text.trim())) {
      Get.snackbar("Error", "সঠিক Email দাও");
      return;
    }
    try {
      isLoading.value = true;
      await _service.forgotPassword(emailClt.text.trim());
      Get.snackbar("Success", "Reset link পাঠানো হয়েছে!");
      emailClt.clear();
      Get.back();
    } on AuthException catch (e) {
      Get.snackbar("Error", e.message);
    } finally {
      isLoading.value = false;
    }
  }
}

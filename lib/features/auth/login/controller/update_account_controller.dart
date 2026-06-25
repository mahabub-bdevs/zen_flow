import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zen_flow/features/profile/controller/profile_controller.dart';

import '../service/update_account_service.dart';

class UpdateAccountController extends GetxController {
  final UpdateAccountService _service = UpdateAccountService(
    Supabase.instance.client,
  );
  final isLoading = false.obs;

  //Profile Controller
  final _profileController = Get.put(ProfileController());

  // Email
  final newEmailClt = TextEditingController();

  // Password
  final currentPasswordClt = TextEditingController();
  final newPasswordClt = TextEditingController();
  final confirmPasswordClt = TextEditingController();

  // Email Update
  Future<void> updateEmail() async {
    if (newEmailClt.text.isEmpty) {
      Get.snackbar("Error", "Email দাও");
      return;
    }
    if (!GetUtils.isEmail(newEmailClt.text.trim())) {
      Get.snackbar("Error", "সঠিক Email দাও");
      return;
    }
    try {
      isLoading.value = true;
      await _service.updateEmail(newEmailClt.text.trim());
      Get.snackbar("Success", "Confirmation email পাঠানো হয়েছে!");
      newEmailClt.clear();
      _profileController.getProfile();
    } on AuthException catch (e) {
      debugPrint("AuthException: ${e.message}");
      Get.snackbar("Error", e.message);
    } catch (e) {
      debugPrint("Unknown Error: ${e.toString()}");
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
      Get.back();
    }
  }

  // Password Update
  Future<void> updatePassword() async {
    if (currentPasswordClt.text.isEmpty ||
        newPasswordClt.text.isEmpty ||
        confirmPasswordClt.text.isEmpty) {
      Get.snackbar("Error", "সব field পূরণ করো");
      return;
    }
    if (newPasswordClt.text != confirmPasswordClt.text) {
      Get.snackbar("Error", "New password match করেনি");
      return;
    }
    if (newPasswordClt.text.length < 6) {
      Get.snackbar("Error", "কমপক্ষে 6 character হতে হবে");
      return;
    }
    try {
      isLoading.value = true;

      // Current password verify
      final currentEmail = Supabase.instance.client.auth.currentUser!.email!;
      await Supabase.instance.client.auth.signInWithPassword(
        email: currentEmail,
        password: currentPasswordClt.text.trim(),
      );

      // Update
      await _service.updatePassword(newPasswordClt.text.trim());
      Get.snackbar("Success", "Password updated!");
      currentPasswordClt.clear();
      newPasswordClt.clear();
      confirmPasswordClt.clear();
      _profileController.getProfile();
      Navigator.pop(Get.context!);
    } on AuthException catch (e) {
      debugPrint("Error ${e.toString()}");
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}

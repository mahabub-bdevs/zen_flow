import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zen_flow/features/auth/singUp/service/sing_up_service.dart';
import 'package:zen_flow/routes/app_routes.dart';

class SingUpController extends GetxController {
  final SingUpService _signUpService = SingUpService(Supabase.instance.client);
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final nameClt = TextEditingController();
  final passwordClt = TextEditingController();
  final conPasswordClt = TextEditingController();
  final emailClt = TextEditingController();

  Future<void> singUp() async {
    if (!globalKey.currentState!.validate()) {
      return;
    }
    try {
      final AuthResponse response = await _signUpService.singUpService(
        nameClt.text.trim(),
        passwordClt.text.trim(),
        emailClt.text.trim(),
      );
      if (response.user != null) {
        Get.snackbar('Success', 'Account created successfully!');
        debugPrint(response.user!.toJson().toString());
        Get.offAllNamed(AppRoutes.login);
      }
    } catch (e) {
      debugPrint("the error is ---------${e.toString()}");
    }
  }
}

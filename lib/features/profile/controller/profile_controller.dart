import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zen_flow/features/profile/service/profile_service.dart';

class ProfileController extends GetxController {
  final profileService = ProfileService(Supabase.instance.client);
  final RxString name = ''.obs;
  final RxString email = ''.obs;
  final RxString id = ''.obs;

  Future<void> getProfile() async {
    final data = profileService.getProfileService();
    name.value = data['name'];
    email.value = data['email'];
    id.value = data['id'];
  }

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }
}

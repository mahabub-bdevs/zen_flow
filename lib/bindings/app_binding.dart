import 'package:get/get.dart';
import 'package:zen_flow/features/myInformationList/controller/my_in_list_controller.dart';
import '../core/network/network_caller.dart';
import '../features/auth/login/controller/login_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // ─── Core Global Singletons ───────────────────────────────────────────────
    // These are needed throughout the entire fd lifecycle.
    Get.put<NetworkCaller>(NetworkCaller(), permanent: true);
    Get.put<MyInListController>(MyInListController(), permanent: true);
    Get.put<LoginController>(LoginController(), permanent: true);
  }
}

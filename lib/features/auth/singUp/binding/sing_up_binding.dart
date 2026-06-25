import 'package:get/get.dart';
import 'package:zen_flow/features/auth/singUp/controller/sing_up_controller.dart';

class SingUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SingUpController>(() => SingUpController());
  }
}

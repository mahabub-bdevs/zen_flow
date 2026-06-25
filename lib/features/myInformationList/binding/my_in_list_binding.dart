import 'package:get/get.dart';
import 'package:zen_flow/features/myInformationList/controller/my_in_list_controller.dart';

class MyInListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyInListController>(() => MyInListController());
  }
}

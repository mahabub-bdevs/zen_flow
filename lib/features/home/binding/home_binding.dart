import 'package:get/get.dart';
import '../../myInformationList/controller/my_in_list_controller.dart';
import '../controller/add_information_controller.dart';
import '../controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AddInformationController>(() => AddInformationController());
    Get.lazyPut<MyInListController>(() => MyInListController());
  }
}

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zen_flow/features/home/controller/home_controller.dart';
import 'package:zen_flow/features/home/service/information_service.dart';
import 'package:zen_flow/features/myInformationList/controller/my_in_list_controller.dart';
import 'package:zen_flow/routes/app_routes.dart';

class AddInformationController extends GetxController {
  final nameClt = TextEditingController();
  final studentIDClt = TextEditingController();
  final classClt = TextEditingController();
  final ageClt = TextEditingController();
  final descriptionClt = TextEditingController();
  final RxBool isLoading = false.obs;
  final InformationService informationService = InformationService(
    Supabase.instance.client,
  );

  final _homeController = Get.put(HomeController());
  final _myInListController = Get.put(MyInListController());

  Future<void> inputInformationController() async {
    try {
      isLoading.value = true;
      if (nameClt.text.isEmpty ||
          descriptionClt.text.isEmpty ||
          studentIDClt.text.isEmpty ||
          classClt.text.isEmpty ||
          ageClt.text.isEmpty) {
        Get.snackbar("error", "Please fill all fields");
        return;
      }
      Map<String, dynamic> body = {
        "name": nameClt.text.trim(),
        "description": descriptionClt.text.trim(),
        "student_id": studentIDClt.text.trim(),
        "class": classClt.text.trim(),
        "age": ageClt.text.trim(),
        "email": Supabase.instance.client.auth.currentUser!.email ?? "no Email",
      };
      await informationService.inputInformation(body);
      Get.snackbar("Success", "Successfully information Details");
      clearFiled();
      Get.toNamed(AppRoutes.main);
      _homeController.refreshData();
      _homeController.infoList();
      _myInListController.refreshData();
      _myInListController.infoList();
    } catch (e) {
      debugPrint("Error ===============>>>>>>${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }

  void clearFiled() {
    nameClt.clear();
    descriptionClt.clear();
    studentIDClt.clear();
    classClt.clear();
    ageClt.clear();
  }
}

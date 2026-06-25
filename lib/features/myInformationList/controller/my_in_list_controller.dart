import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zen_flow/features/home/controller/home_controller.dart';

import '../service/my_in_list_service.dart';

class MyInListController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxString errorMsg = ''.obs;
  final RxList<Map<String, dynamic>> infoList = <Map<String, dynamic>>[].obs;

  final ScrollController scrollController = ScrollController();
  final myInListService = MyInListService(
    Supabase.instance.client,
  ); // ← MyInListService
  final homeController = Get.put(HomeController());
  @override
  void onInit() {
    super.onInit();
    _fetchInitialData();
  }

  Future<void> _fetchInitialData() async {
    try {
      isLoading.value = true;
      final response = await myInListService
          .getMyListService(); // ← MyInListService
      infoList.value = response;
    } catch (e) {
      errorMsg.value = e.toString();
      debugPrint("Error: ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }

  // void _subscribeRealtime() {
  //   final currentEmail = Supabase.instance.client.auth.currentUser!.email ?? '';
  //
  //   Supabase.instance.client
  //       .from('zon_flow')
  //       .stream(primaryKey: ['id'])
  //       .eq('email', currentEmail)
  //       .order('id', ascending: false)
  //       .listen((data) {
  //         infoList.value = data;
  //       });
  // }

  Future<void> refreshData() async => _fetchInitialData();

  Future<void> getDeleteInformation(int id) async {
    try {
      await myInListService.deleteInformation(id);
      Get.back();
      refreshData();
      homeController.refreshData();
      Get.snackbar("Success", "Your item has deen successfully");
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    Supabase.instance.client.removeAllChannels();
    super.onClose();
  }
}

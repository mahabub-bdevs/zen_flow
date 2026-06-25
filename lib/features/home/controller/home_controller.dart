import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zen_flow/features/home/service/home_service.dart';

class HomeController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxString errorMsg = ''.obs;
  final RxList<Map<String, dynamic>> infoList = <Map<String, dynamic>>[].obs;

  final ScrollController scrollController = ScrollController();
  final homeService = HomeService(Supabase.instance.client);

  @override
  void onInit() {
    super.onInit();
    _fetchInitialData();
    _subscribeRealtime();
    refreshData();
  }

  Future<void> _fetchInitialData() async {
    try {
      isLoading.value = true;
      final response = await homeService.getFaceInformation();
      infoList.value = response;
     // debugPrint("Success: ${response.toString()}");
    } catch (e) {
      errorMsg.value = e.toString();
      debugPrint("Error: ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }

  void _subscribeRealtime() {
    Supabase.instance.client
        .from('zon_flow')
        .stream(primaryKey: ['id'])
        .order('id', ascending: false)
        .listen((data) {
          infoList.value = data;
        });
  }

  Future<void> refreshData() async => _fetchInitialData();

  @override
  void onClose() {
    scrollController.dispose();
    Supabase.instance.client.removeAllChannels();
    super.onClose();
  }
}

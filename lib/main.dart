import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zen_flow/core/utils/supa_base_key.dart';

import 'app.dart';
import 'core/storage/storage_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Supabase.initialize(
    url: supBaseUrl,
    publishableKey: supAppKey,
    authOptions: FlutterAuthClientOptions(authFlowType: AuthFlowType.pkce),
  );
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Get.put<StorageService>(StorageService(), permanent: true);
  runApp(DevicePreview(enabled: false, builder: (context) => const MyApp()));
}

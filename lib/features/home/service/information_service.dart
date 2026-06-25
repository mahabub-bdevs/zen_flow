import 'package:supabase_flutter/supabase_flutter.dart';

class InformationService {
  final SupabaseClient supaBaseClient;
  InformationService(this.supaBaseClient);
  final String tableName = "zon_flow";
  Future<void> inputInformation(Map<String, dynamic> body) async {
    await supaBaseClient.from(tableName).insert(body);
  }
}

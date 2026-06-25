import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zen_flow/features/home/service/information_service.dart';

class HomeService {
  final SupabaseClient supabaseClient;
  HomeService(this.supabaseClient);
  final _informationService = InformationService(Supabase.instance.client);
  // SupaBase theke Data neuyar jonno
  Future<List<Map<String, dynamic>>> getFaceInformation() async {
    final response = await supabaseClient
        .from(_informationService.tableName)
        .select('id, name, description, student_id, class, age, email')
        .order('id', ascending: false);
    return response;
  }
}

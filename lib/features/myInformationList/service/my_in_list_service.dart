import 'package:supabase_flutter/supabase_flutter.dart';

class MyInListService {
  final SupabaseClient supabaseClient;
  MyInListService(this.supabaseClient);

  Future<List<Map<String, dynamic>>> getMyListService() async {
    final currentEmail = Supabase.instance.client.auth.currentUser!.email!;

    final response = await supabaseClient
        .from("zon_flow")
        .select('id, name, description, student_id, class, age, email')
        .eq("email", currentEmail)
        .order("id", ascending: false);
    return response;
  }

  Future<void> deleteInformation(int id) async {
    await supabaseClient.from('zon_flow').delete().eq('id', id);
  }
}

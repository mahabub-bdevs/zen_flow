import 'package:supabase_flutter/supabase_flutter.dart';

class UpdateAccountService {
  final SupabaseClient supabaseClient;
  UpdateAccountService(this.supabaseClient);
  Future<void> updateEmail(String email) async {
    await supabaseClient.auth.updateUser(UserAttributes(email: email));
  }

  Future<void> updatePassword(String password) async {
    await supabaseClient.auth.updateUser(UserAttributes(password: password));
  }
}

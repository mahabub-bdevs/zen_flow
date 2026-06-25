import 'package:supabase_flutter/supabase_flutter.dart';

class ForgotPasswordService {
  final SupabaseClient supBaseClient;
  ForgotPasswordService(this.supBaseClient);

  Future<void> forgotPassword(String email) async {
    await supBaseClient.auth.resetPasswordForEmail(
      email,
      redirectTo: 'io.supabase.zenflow://reset-callback',
    );
  }
}

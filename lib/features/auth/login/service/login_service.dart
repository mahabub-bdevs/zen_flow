import 'package:supabase_flutter/supabase_flutter.dart';

class LoginService {
  final SupabaseClient supBaseClient;
  LoginService(this.supBaseClient);

  Future<AuthResponse> loginService(String email, String passWord) async {
    AuthResponse response = await supBaseClient.auth.signInWithPassword(
      email: email,
      password: passWord,
    );
    return response;
  }

  Future<void> getLogOut() async {
    await supBaseClient.auth.signOut();
  }
}

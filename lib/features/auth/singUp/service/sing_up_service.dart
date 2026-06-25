import 'package:supabase_flutter/supabase_flutter.dart';

class SingUpService {
  final SupabaseClient supBaseClient;
  SingUpService(this.supBaseClient);

  Future<AuthResponse> singUpService(
    String name,
    String password,
    String email,
  ) async {
    final AuthResponse response = await supBaseClient.auth.signUp(
      email: email,
      password: password,
      data: {"name": name},
    );
    return response;
  }
}

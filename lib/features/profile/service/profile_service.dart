import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileService {
  final SupabaseClient supBaseClient;
  ProfileService(this.supBaseClient);
//supaBasee theke Data input kora

  Map<String, dynamic> getProfileService() {
    final user = supBaseClient.auth.currentUser!;
    return {
      'name': user.userMetadata?['name'] ?? 'No Name',
      'email': user.email ?? 'No Email',
      'id': user.id,
    };
  }
}

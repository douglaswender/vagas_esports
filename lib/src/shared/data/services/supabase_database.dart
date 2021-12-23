import 'package:supabase/supabase.dart';
import 'package:vagas_esports/src/shared/data/services/app_database.dart';

class SupabaseDatabase implements AppDatabase {
  late final SupabaseClient client;
  @override
  void init() {
    client = SupabaseClient(const String.fromEnvironment("SUPABASEURL"),
        const String.fromEnvironment("SUPABASEKEY"));
  }
}

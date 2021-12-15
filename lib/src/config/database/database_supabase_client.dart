import 'package:supabase/supabase.dart';

class DatabaseClient {
  final String supabaseUrl = "https://lillhpygvxhzocazorpr.supabase.co";
  final String supabaseKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYzODkwNjU1MCwiZXhwIjoxOTU0NDgyNTUwfQ.kuNS18aRqcT47cyY3tjSpL9Tqwni1IooAxaXIRr7Zwc";

  DatabaseClient();

  SupabaseClient get client => SupabaseClient(supabaseUrl, supabaseKey);
}

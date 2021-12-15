import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vagas_esports/src/app/app_module.dart';
import 'package:vagas_esports/src/app/app_widget.dart';
import 'package:vagas_esports/src/config/database/database_supabase_client.dart';

void main() {
  return runApp(ModularApp(module: AppModule(), child: AppWidget()));
}

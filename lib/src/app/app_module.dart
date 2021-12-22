import 'package:flutter_modular/flutter_modular.dart';
import 'package:vagas_esports/src/features/home/home_page.dart';
import 'package:vagas_esports/src/features/login/presentation/login_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => HomePage()),
        ChildRoute('/login', child: (context, args) => LoginPage()),
      ];
}

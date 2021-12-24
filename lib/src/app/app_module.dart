import 'package:flutter_modular/flutter_modular.dart';
import 'package:vagas_esports/src/pages/home/home_page.dart';
import 'package:vagas_esports/src/pages/login/login_module.dart';
import 'package:vagas_esports/src/pages/register/presentation/register_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/home', child: (context, args) => HomePage()),
        ModuleRoute('/', module: LoginModule()),
        ChildRoute('/register', child: (context, args) => RegisterPage()),
      ];
}

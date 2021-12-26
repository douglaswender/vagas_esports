import 'package:flutter_modular/flutter_modular.dart';
import 'package:vagas_esports/src/pages/home/cubit/home_cubit.dart';
import 'package:vagas_esports/src/pages/home/home_page.dart';
import 'package:vagas_esports/src/pages/login/login_module.dart';
import 'package:vagas_esports/src/pages/register/presentation/register_page.dart';
import 'package:vagas_esports/src/shared/data/models/user_model.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        //Models
        Bind(
          (i) => UserModel(),
        ),

        //Controllers
        Bind((i) => HomeCubit()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => HomePage()),
        ModuleRoute('/login', module: LoginModule()),
        ChildRoute('/register', child: (context, args) => RegisterPage()),
      ];
}

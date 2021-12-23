import 'package:flutter_modular/flutter_modular.dart';
import 'package:vagas_esports/src/pages/login/cubit/login_cubit.dart';

import 'login_page.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    //Controller
    Bind(
      (i) => LoginCubit(),
    )
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (context, args) => LoginPage()),
  ];
}

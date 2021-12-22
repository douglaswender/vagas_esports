import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vagas_esports/src/shared/theme/app_theme.dart';
import 'package:vagas_esports/src/shared/widgets/button_primary/button_primary.dart';
import 'package:vagas_esports/src/shared/widgets/button_secondary/button_secondary.dart';
import 'package:vagas_esports/src/shared/widgets/input_text/input_text.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppTheme.sizes.s64),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: AppTheme.sizes.s8),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Entrar',
                    style: AppTheme.textStyles.header,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: AppTheme.sizes.s8),
                    child: TextButton(
                      onPressed: () {
                        print('registro');
                        Modular.to.pushNamed('/register');
                      },
                      child: Text(
                        'Registre-se',
                        style: AppTheme.textStyles.buttonSecondary,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: AppTheme.sizes.s16,
            ),
            Expanded(
              child: Column(
                children: [
                  InputText(label: "Email"),
                  InputText(
                    label: "Senha",
                    isPassword: true,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                ButtonPrimary(
                  onPressed: () {
                    print('login');
                  },
                  text: "Entrar",
                ),
                SizedBox(
                  height: AppTheme.sizes.s8,
                ),
                ButtonSecondary(
                  text: "Esqueceu a senha?",
                  onPressed: () {
                    print('senha');
                  },
                ),
                SizedBox(
                  height: AppTheme.sizes.s8,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vagas_esports/src/pages/login/cubit/login_cubit.dart';
import 'package:vagas_esports/src/shared/theme/app_theme.dart';
import 'package:vagas_esports/src/shared/widgets/bottom_sheet_loading/bottom_sheet_loading.dart';
import 'package:vagas_esports/src/shared/widgets/button_primary/button_primary.dart';
import 'package:vagas_esports/src/shared/widgets/button_secondary/button_secondary.dart';
import 'package:vagas_esports/src/shared/widgets/input_text/input_text.dart';
import 'package:validators/validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginCubit> {
  @override
  void initState() {
    controller.listen((state) {
      if (state is LoginSuccess) {
        Modular.to.pushReplacementNamed("/home");
      }
    });
    super.initState();
  }

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
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    height: 128,
                    width: 128,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: AppTheme.sizes.s16),
                    child: InputText(
                      label: "Email",
                      validator: (value) =>
                          isEmail(value) ? null : "Digite um e-mail válido",
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) => controller.onChange(email: value),
                    ),
                  ),
                  SizedBox(
                    height: AppTheme.sizes.s16,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: AppTheme.sizes.s16),
                    child: InputText(
                      label: "Senha",
                      obscure: true,
                      validator: (value) =>
                          value.length > 5 ? null : "Informe uma senha válida",
                      onChanged: (value) =>
                          controller.onChange(password: value),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              ButtonPrimary(
                onPressed: () {
                  controller.login();
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
      )),
      bottomSheet: BlocBuilder<LoginCubit, LoginState>(
        bloc: controller,
        builder: (context, state) {
          if (state is LoginLoading) {
            return BottomSheetLoading();
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}

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

class _LoginPageState extends State<LoginPage> {
  final LoginCubit _bloc = Modular.get<LoginCubit>();

  @override
  void initState() {
    _bloc.listen((state) {
      if (state is LoginSuccess) {
        print('success');
        Modular.to
            .pushNamedAndRemoveUntil("/home", ModalRoute.withName('/login'));
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
              key: _bloc.formKey,
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    height: 128,
                    width: 128,
                  ),
                  InputText(
                    label: "Email",
                    validator: (value) =>
                        isEmail(value) ? null : "Digite um e-mail válido",
                  ),
                  InputText(
                    label: "Senha",
                    obscure: true,
                    validator: (value) =>
                        value.length > 6 ? null : "Informe uma senha válida",
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              ButtonPrimary(
                onPressed: () {
                  _bloc.login();
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
        bloc: _bloc,
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

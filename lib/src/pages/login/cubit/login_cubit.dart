import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:vagas_esports/src/shared/data/models/user_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  //TODO: Login Repository
  //final LoginRepository repository;
  LoginCubit() : super(LoginInitial());

  final formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";

  Future<void> login() async {
    if (validate()) {
      emit(LoginLoading());
      await Future.delayed(Duration(seconds: 4));
      /* 
      final response = await repository.login(email: _email, password: _password);
      */
      //TODO: mudar para: LoginSuccess<UserModel>(response)
      emit(LoginSuccess<UserModel>(UserModel(email: 'email')));
    }
  }

  void onChange({String? email, String? password}) {
    _email = email ?? _email;
    _password = password ?? _password;
  }

  bool validate() {
    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}

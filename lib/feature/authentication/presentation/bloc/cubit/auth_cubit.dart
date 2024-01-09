import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  bool showPassword = true;
  bool agreetoterms = false;
  String? verificationCode = '';
  int? resendtoken;
  bool stayLogin = false;
  String countrycode = '+234';

  final emailController = TextEditingController();
  final firstNameController = TextEditingController();

  changeShowpassword() {
    emit(AuthLoadingState());
    showPassword = !showPassword;
    log(showPassword.toString());
    emit(AuthLoadedState());
  }

  changeStaylogin() {
    emit(AuthLoadingState());
    stayLogin = !stayLogin;
    log(stayLogin.toString());
    emit(AuthLoadedState());
  }

  changeAgreetoterms() {
    emit(AuthLoadingState());
    agreetoterms = !agreetoterms;
    emit(AuthLoadedState());
  }
}

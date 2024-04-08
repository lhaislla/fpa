import 'package:flutter/material.dart';
import 'package:fpa/views/LoginScreen/login.dart';
import 'package:fpa/views/LoginScreen/cadastro.dart';
import 'package:fpa/views/LoginScreen/reset_password.dart';

Map<String, WidgetBuilder> loadRoutes(BuildContext context) {
  return {
    '/login': (context) => LoginScreen(),
    '/cadastro': (context) => CadastroScreen(),
    '/reset_password': (context) => ResetPasswordScreen()
  };
}

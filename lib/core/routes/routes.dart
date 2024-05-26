import 'package:flutter/material.dart';
import 'package:fpa/views/LoginScreen/login.dart';
import 'package:fpa/views/LoginScreen/cadastro.dart';
import 'package:fpa/views/LoginScreen/reset_password.dart';
import 'package:fpa/views/ViewScreen/home_monitoramento.dart';
import 'package:fpa/views/ViewScreen/view.dart';
import 'package:fpa/views/ViewScreen/new_view.dart';

Map<String, WidgetBuilder> loadRoutes(BuildContext context) {
  return {
    '/login': (context) => LoginScreen(),
    '/cadastro': (context) => CadastroScreen(),
    '/reset_password': (context) => ResetPasswordScreen(),
    '/homeMonitoramento': (context) => Home(),
    '/view_monitoramento': (context) => ViewMonitoramento(),
    '/new_view': (context) => NewViewScreen(),
  };
}

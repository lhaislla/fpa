import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogOut {
  static Future<void> signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    } catch (e) {
      print('Erro ao sair da conta: $e');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:fpa/core/widgets/AppIcon/icon.dart';
import 'package:fpa/shared/widgets/Buttons/DefaultButton.dart';
import 'package:fpa/shared/widgets/Buttons/SecondButton.dart';
import 'package:fpa/shared/widgets/Inputs/AppInput.dart';
import 'package:fpa/views/LoginScreen/cadastro.dart';
import 'package:fpa/views/LoginScreen/reset_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpa/views/tela_branca.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Future<void> _signInWithEmailAndPassword(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProximaTela()),
      );
    } catch (e) {
      print("Error signing in: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20),
                AppIcon(),
                SizedBox(height: 20),
                AppInput(
                  hintText: "Login/E-mail",
                  controller: _emailController,
                ),
                SizedBox(height: 20),
                AppInput(
                    hintText: "Password",
                    obscureText: true,
                    controller: _passwordController),
                SizedBox(height: 20),
                DefaultButton(
                  onPressed: () async {
                    await _signInWithEmailAndPassword(context);
                  },
                  text: 'Sign in',
                ),
                SecondButton(
                  padding: "8",
                  onPressed: () async {},
                  icon: Icons.account_circle,
                  text: 'Conectar com Google',
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CadastroScreen()),
                    );
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResetPasswordScreen()),
                    );
                  },
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpa/core/widgets/AppIcon/icon.dart';
import 'package:fpa/shared/widgets/Buttons/DefaultButton.dart';
import 'package:fpa/shared/widgets/Buttons/SecondButton.dart';
import 'package:fpa/shared/widgets/Inputs/AppInput.dart';
import 'package:fpa/views/LoginScreen/cadastro.dart';
import 'package:fpa/views/LoginScreen/reset_password.dart';
import 'package:fpa/views/ViewScreen/home_monitoramento.dart';
import 'package:fpa/services/auth_service.dart';
import 'package:fpa/shared/widgets/menu_lateral.dart';

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

      // Se o login for bem-sucedido, navegue para a próxima tela
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } catch (e) {
      // Em caso de erro, exiba um AlertDialog com a mensagem de erro
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Erro de Login"),
            content: Text(
                "Ocorreu um erro ao fazer login. Verifique suas credenciais e tente novamente."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Fecha o AlertDialog
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
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
                  controller: _passwordController,
                ),
                SizedBox(height: 20),
                DefaultButton(
                  onPressed: () async {
                    await _signInWithEmailAndPassword(context);
                  },
                  text: 'Sign in',
                ),
                SecondButton(
                  padding: "8",
                  onPressed: () async {
                    try {
                      UserCredential? userCredential = await signInWithGoogle();
                      if (userCredential != null) {
                        // Se o login com Google for bem-sucedido, navegue para a próxima tela
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      } else {
                        // Handle null case if needed
                        print("Login com Google falhou");
                      }
                    } catch (e) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Erro ao fazer login com Google"),
                            content: Text(
                                "Ocorreu um erro ao fazer login com Google. Tente novamente."),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // Fecha o AlertDialog
                                },
                                child: Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                      print("Erro ao fazer login com Google: $e");
                    }
                  },
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
      drawer: MenuLateral(), // Adiciona o menu lateral no lado esquerdo
    );
  }
}

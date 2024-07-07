import 'package:flutter/material.dart';
import 'package:fpa/core/widgets/AppIcon/icon.dart';
import 'package:fpa/shared/widgets/Buttons/DefaultButton.dart';
import 'package:fpa/shared/widgets/Inputs/AppInput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CadastroScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  Future<void> _registerUser(BuildContext context) async {
    try {
      if (_passwordController.text != _confirmPasswordController.text) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Registration Failed"),
              content: Text("Passwords do not match."),
              actions: <Widget>[
                TextButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
        return;
      }

      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Salvar os dados no Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'username': _usernameController.text,
        'email': _emailController.text,
        // Adicione mais campos conforme necessário
      });

      // Mostra um diálogo de sucesso ou mensagem
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Registration Successful"),
            content: Text("User registered successfully."),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    } catch (e) {
      // Exibe uma mensagem de erro em caso de falha no cadastro
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Registration Failed"),
            content: Text("Error: $e"),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
      print("Error registering user: $e");
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
                  controller: _usernameController,
                  hintText: "Username",
                ),
                SizedBox(height: 20),
                AppInput(
                  controller: _emailController,
                  hintText: "E-mail",
                ),
                SizedBox(height: 20),
                AppInput(
                  controller: _passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),
                SizedBox(height: 20),
                AppInput(
                  controller: _confirmPasswordController,
                  hintText: "Confirm Password",
                  obscureText: true,
                ),
                SizedBox(height: 20),
                DefaultButton(
                  onPressed: () {
                    _registerUser(context);
                  },
                  text: 'Sign up',
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Back to Sign in',
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

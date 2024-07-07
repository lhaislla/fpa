import 'package:flutter/material.dart';
import 'package:fpa/core/widgets/AppIcon/icon.dart';
import 'package:fpa/shared/widgets/Buttons/DefaultButton.dart';
import 'package:fpa/shared/widgets/Inputs/AppInput.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  String _errorMessage = '';

  Future<void> _resetPassword(BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text,
      );
      // Mostra um diálogo de sucesso ou mensagem
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Password Reset"),
            content: Text("Password reset email has been sent."),
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
      setState(() {
        _errorMessage = "Error: $e";
      });
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
                  controller: _emailController,
                  hintText: "E-mail",
                ),
                SizedBox(height: 20),
                DefaultButton(
                  onPressed: () {
                    _resetPassword(context);
                  },
                  text: 'Send password reset email',
                ),
                SizedBox(height: 20),
                if (_errorMessage.isNotEmpty)
                  Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.redAccent,
                    child: Text(
                      _errorMessage,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
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

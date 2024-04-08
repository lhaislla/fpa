import 'package:flutter/material.dart';
import 'package:fpa/core/widgets/AppIcon/icon.dart';
import 'package:fpa/shared/widgets/Buttons/DefaultButton.dart';
import 'package:fpa/shared/widgets/Inputs/AppInput.dart';

class CadastroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              AppIcon(),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppInput(
                  hintText: "Username",
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppInput(
                  hintText: "E-mail",
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppInput(
                  hintText: "Password",
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppInput(
                  hintText: "Confirm Password",
                ),
              ),
              SizedBox(height: 20),
              DefaultButton(
                onPressed: () {
                  // Lógica de cadastro
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
    );
  }
}

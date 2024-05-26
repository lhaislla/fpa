import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const AppInput({
    Key? key,
    required this.hintText,
    this.obscureText = false,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
          ),
        ),
        obscureText: obscureText,
        validator: (value) {
          if (hintText == "E-mail") {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            } else if (!value.contains('@')) {
              return 'Please enter a valid email';
            }
          } else if (hintText == "Password") {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            } else if (value.length < 6) {
              return 'Password must be at least 6 characters long';
            }
          } else if (hintText == "Confirm Password") {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            } else if (value != controller.text) {
              return 'Passwords do not match';
            }
          }
          return null;
        },
      ),
    );
  }
}

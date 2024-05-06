import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const AppInput(
      {Key? key,
      required this.hintText,
      this.obscureText = false,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
          ),
        ),
        obscureText: obscureText,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool isObscure;
  const AuthField({
    super.key,
    required this.hintText,
    required this.controller,
    this.inputType = TextInputType.text,
    this.isObscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}

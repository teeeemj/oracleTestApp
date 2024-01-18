import 'package:flutter/material.dart';

import '../../../../core/config/theme/app_fonts.dart';

class RegisterTextField extends StatelessWidget {
  final String hintTitle;
  final bool obscureText;
  const RegisterTextField(
      {super.key,
      required this.registerLoginController,
      required this.hintTitle,
      this.obscureText = false});

  final TextEditingController registerLoginController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: registerLoginController,
      obscureText: obscureText,
      cursorColor: Colors.black,
      style: AppFonts.s15w400rob.copyWith(color: Colors.black),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(17),
        hintText: hintTitle,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.black),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.black),
        ),
      ),
    );
  }
}

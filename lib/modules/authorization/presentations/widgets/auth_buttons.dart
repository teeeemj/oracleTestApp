import 'package:flutter/material.dart';
import 'package:testapp/core/config/theme/app_fonts.dart';

class AuthButtons extends StatelessWidget {
  final String title;
  final Function() onpressed;
  final Color backButtonColor;
  const AuthButtons({
    super.key,
    required this.title,
    required this.onpressed,
    required this.backButtonColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backButtonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Text(
          title,
          style: AppFonts.s13w900rob.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

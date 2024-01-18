import 'package:flutter/material.dart';

import 'package:testapp/core/config/theme/app_fonts.dart';

class StartScreenButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final EdgeInsets buttonPaddings;
  final BorderSide? borderSide;
  final Color btnColor;
  final Color bgColor;
  const StartScreenButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.buttonPaddings,
    this.borderSide,
    required this.btnColor,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: buttonPaddings,
        backgroundColor: bgColor,
        side: borderSide,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Text(
        title,
        style: AppFonts.s13w900rob.copyWith(color: btnColor),
      ),
    );
  }
}

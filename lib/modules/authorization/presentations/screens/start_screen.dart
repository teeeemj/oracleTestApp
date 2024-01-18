import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:testapp/core/config/routes/app_router.dart';
import 'package:testapp/core/config/theme/app_colors.dart';

import '../widgets/start_screen_button.dart';

@RoutePage()
class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Image(
            width: double.infinity,
            fit: BoxFit.fill,
            height: 707,
            image: AssetImage('assets/images/pngs/Rectangle.png'),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StartScreenButton(
                title: 'LOG IN',
                onPressed: () {
                  context.router.push(
                    const LoginRoute(),
                  );
                },
                buttonPaddings: const EdgeInsets.only(
                  left: 61,
                  top: 19,
                  right: 62,
                  bottom: 18,
                ),
                borderSide: const BorderSide(
                  width: 2,
                  color: AppColors.buttonColorBlack,
                ),
                btnColor: AppColors.textColorBlack,
                bgColor: AppColors.buttonColorWhite,
              ),
              const SizedBox(
                width: 9,
              ),
              StartScreenButton(
                title: 'REGISTER',
                onPressed: () {
                  context.router.push(
                    const RegisterRoute(),
                  );
                },
                buttonPaddings: const EdgeInsets.only(
                  left: 51,
                  top: 19,
                  right: 51,
                  bottom: 18,
                ),
                btnColor: AppColors.textColorWhite,
                bgColor: AppColors.buttonColorBlack,
              )
            ],
          )
        ],
      ),
    );
  }
}

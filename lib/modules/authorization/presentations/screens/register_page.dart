import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:testapp/core/config/routes/app_router.dart';
import 'package:testapp/core/config/theme/app_colors.dart';
import 'package:testapp/core/config/theme/app_fonts.dart';

import '../widgets/auth_buttons.dart';
import '../widgets/register_textfield.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController registerLoginController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgrColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            context.router.pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.textColorBlack,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 32.65,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Register',
              style: AppFonts.s36w400rob.copyWith(
                color: AppColors.textColorBlack,
              ),
            ),
            const SizedBox(height: 32),
            RegisterTextField(
              registerLoginController: registerLoginController,
              hintTitle: 'type your e-mail',
            ),
            const SizedBox(height: 16),
            RegisterTextField(
                registerLoginController: registerPasswordController,
                obscureText: true,
                hintTitle: 'type your password'),
            const SizedBox(height: 16),
            AuthButtons(
              title: 'NEXT',
              onpressed: () {
                context.router.push(
                  AfterRegisterRoute(),
                );
              },
              backButtonColor: AppColors.buttonColorBlack,
            ),
          ],
        ),
      ),
    );
  }
}

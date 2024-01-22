import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/core/config/routes/app_router.dart';
import 'package:testapp/core/config/theme/app_fonts.dart';
import 'package:testapp/core/data/user_data.dart';
import 'package:testapp/modules/authorization/presentations/widgets/auth_buttons.dart';
import 'package:testapp/modules/authorization/presentations/widgets/register_textfield.dart';

import '../../../../core/config/theme/app_colors.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController loginLoginController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context, listen: false);
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
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            Text(
              'Log in',
              style: AppFonts.s36w400rob.copyWith(
                color: AppColors.textColorBlack,
              ),
            ),
            const SizedBox(height: 32),
            RegisterTextField(
              registerLoginController: loginLoginController,
              hintTitle: 'type your e-mail',
            ),
            const SizedBox(height: 16),
            RegisterTextField(
              registerLoginController: loginPasswordController,
              hintTitle: 'type your password',
              obscureText: true,
            ),
            const SizedBox(height: 16),
            AuthButtons(
                title: 'LOG IN',
                onpressed: () {
                  if (userData.users.any((user) =>
                      user['username'] == loginLoginController.text &&
                      user['password'] == loginPasswordController.text)) {
                    context.router.push(DiscoverRoute());
                  } else {
                    print('Invalid datas');
                  }
                },
                backButtonColor: AppColors.buttonColorBlack)
          ],
        ),
      ),
    );
  }
}

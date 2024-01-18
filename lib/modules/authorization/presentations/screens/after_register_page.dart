import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:testapp/core/config/theme/app_colors.dart';
import 'package:testapp/core/config/theme/app_fonts.dart';
import 'package:testapp/modules/authorization/presentations/widgets/auth_buttons.dart';
import 'package:testapp/modules/authorization/presentations/widgets/register_textfield.dart';

@RoutePage()
class AfterRegisterPage extends StatefulWidget {
  const AfterRegisterPage({super.key});

  @override
  State<AfterRegisterPage> createState() => _AfterRegisterPageState();
}

class _AfterRegisterPageState extends State<AfterRegisterPage> {
  TextEditingController afterRegisterLoginController = TextEditingController();
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
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32.65),
            Text(
              'Register',
              style: AppFonts.s36w400rob.copyWith(
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 32),
            RegisterTextField(
              registerLoginController: afterRegisterLoginController,
              hintTitle: 'type your e-mail',
            ),
            const SizedBox(height: 16),
            AuthButtons(
              title: 'SIGN UP',
              onpressed: () {},
              backButtonColor: Colors.black,
            ),
            const SizedBox(height: 32),
            const Text(
                'By signing up, you agree to Photo’s Terms of Service and\nPrivacy Policy.')
          ],
        ),
      ),
    );
  }
}

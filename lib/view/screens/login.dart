import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';
import 'package:reqres/utils/consts.dart';
import 'package:reqres/view/widgets/confirm_button.dart';
import 'package:reqres/view/widgets/login_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reqres/controller/login_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}


//TODO: Add validator to textfields
//TODO: Add error messages
class _LoginScreenState extends LoginController {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          buildContainerPaddingAndHeight(context),
          const Text(
            AppStrings.appName,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: AppColors.greenish,
              fontSize: 36,
            ),
          ),
          Padding(
            padding: context.padding.onlyBottomMedium,
            child: const Text(
              AppStrings.loginDesc,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: AppColors.greenish,
                fontSize: 16,
              ),
            ),
          ),
          LoginTextField(
            label: AppStrings.email,
            hintText: AppStrings.emailHint,
            controller: emailController,
            isEmail: true,
            isPassword: false,
          ),
          LoginTextField(
            label: AppStrings.password,
            hintText: AppStrings.passwordHint,
            controller: passwordController,
            isPassword: true,
          ),
          const Spacer(),
          Padding(
            padding: context.padding.verticalMedium,
            child: ConfirmButton(
              title: AppStrings.login,
              onPressed: () => login(emailController.text, passwordController.text),
              isDisabled: false,
            ),
          ),
        ],
      ),
    );
  }

    @override
    void dispose() {
      super.dispose();
      emailController.dispose();
      passwordController.dispose();
  }

}

Widget buildContainerPaddingAndHeight(BuildContext context) {
  return Container(
    padding: context.padding.verticalMedium,
    height: context.sized.dynamicHeight(0.30),
    child: SvgPicture.asset('assets/undraw_working.svg'),
  );
}

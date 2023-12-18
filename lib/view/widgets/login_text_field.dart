import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:reqres/utils/consts.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    Key? key,
    this.controller,
    required this.hintText,
    required this.label,
    this.onTap,
    required this.isPassword,
    this.isEmail,
  }) : super(key: key);

  final TextEditingController? controller;
  final String hintText;
  final String label;
  final VoidCallback? onTap;
  final bool isPassword;
  final bool? isEmail;

  //REGEX for email validation
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: context.padding.verticalLow,
          child: Padding(
            padding: context.padding.horizontalMedium,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: context.padding.onlyLeftLow,
                      child: Text(
                        label,
                        style: const TextStyle(color: AppColors.greyish),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                TextFormField(
                  style:
                      const TextStyle(color: AppColors.greyish, fontSize: 14),
                  obscureText: isPassword ? true : false,
                  controller: controller,
                  cursorColor: AppColors.greyish,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: context.border.highBorderRadius,
                      borderSide: const BorderSide(color: AppColors.greyish),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: context.border.highBorderRadius,
                      borderSide: const BorderSide(color: AppColors.white),
                    ),
                    hintText: hintText,
                    hintStyle:
                        const TextStyle(color: AppColors.greyish, fontSize: 14),
                    labelStyle:
                        const TextStyle(color: AppColors.greyish, fontSize: 14),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: isEmail == true ? _validateEmail : null,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

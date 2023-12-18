import 'package:kartal/kartal.dart';
import 'package:flutter/material.dart';
import '../../utils/consts.dart';

class ConfirmButton extends StatelessWidget {
  final String title;
  final bool isDisabled;
  final VoidCallback onPressed;
  const ConfirmButton(
      {Key? key, required this.isDisabled, required this.title, required this.onPressed})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.sized.dynamicHeight(0.08),
      width: context.sized.dynamicWidth(0.9),
      padding: context.padding.low,
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: context.border.highBorderRadius,
                    side: BorderSide.none)),
            backgroundColor:
                MaterialStateProperty.all<Color>(AppColors.greenish)),
        onPressed: isDisabled? null: onPressed,
        child: Text(title,
            style: const TextStyle(
                fontSize: 18,
                color: AppColors.backgroundColor,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}

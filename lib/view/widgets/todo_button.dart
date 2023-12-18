import 'package:flutter/material.dart';
import '../../utils/consts.dart';

class TodoButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Icon icon;
  const TodoButton(
      {Key? key,
      required this.icon,
      required this.title,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          icon,
          Text(
            title,
            style: const TextStyle(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}

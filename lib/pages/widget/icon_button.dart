import 'package:flutter/material.dart';
import 'package:flutter_chat_app/utils/themes.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.icon,
    required this.onTap,
    this.isBorderColor = false,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback onTap;
  final bool isBorderColor;

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: isBorderColor
            ? Border.all(
                color: AppColors.textLigth,
                width: 0,
              )
            : null,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(6),
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          splashColor: AppColors.secondary,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Icon(
              icon,
              size: 22,
            ),
          ),
        ),
      ),
    );
  }
}

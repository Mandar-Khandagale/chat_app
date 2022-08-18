import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    required this.color,
    required this.onTap,
    required this.icon,
    this.size = 54,
  }) : super(key: key);

  final Color color;
  final VoidCallback onTap;
  final IconData icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 50,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: InkWell(
        onTap: onTap,
        splashColor: Theme.of(context).cardColor,
        child: SizedBox(
            height: size,
            width: size,
            child: Icon(icon)),
      ),
    );
  }
}

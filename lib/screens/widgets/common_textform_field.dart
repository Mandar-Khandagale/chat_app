import 'package:flutter/material.dart';

class CommonTextFormField extends StatelessWidget {
  const CommonTextFormField({
    Key? key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.padding,
    this.validation,
  }) : super(key: key);

  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final EdgeInsetsGeometry? padding;
  final validation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(8.0),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validation,
        controller: controller,
        decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            labelText: labelText ?? "-",
            hintText: hintText ?? "-",
            helperStyle: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis
            )
        ),
      ),
    );
  }
}

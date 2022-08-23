import 'package:flutter/material.dart';

class ErrorDisplayWidget extends StatelessWidget {
  const ErrorDisplayWidget({Key? key, this.error}) : super(key: key);

  final Object? error;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(
      "Something went wrong pls check the \n $error"
    ),);
  }
}

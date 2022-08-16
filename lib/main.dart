import 'package:flutter/material.dart';
import 'package:flutter_chat_app/screens/imports.dart';
import 'package:flutter_chat_app/utils/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: AppTheme().light,
      darkTheme: AppTheme().dark,
      themeMode: ThemeMode.light,
      home: HomeScreen(),
    );
  }
}


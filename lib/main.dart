import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants.dart';
import 'package:flutter_chat_app/screens/imports.dart';
import 'package:flutter_chat_app/utils/themes.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

void main() {
  final client = StreamChatClient(streamKey);
  runApp(MyApp(client: client,));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key,required this.client}) : super(key: key);

  final StreamChatClient client;
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().light,
      darkTheme: AppTheme().dark,
      themeMode: ThemeMode.light,
      builder: (context, child) {
        return StreamChatCore(
            client: client,
            child: child!);
      },
      home: const UserSelectionScreen(),
    );
  }
}


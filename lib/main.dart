import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants.dart';
import 'package:flutter_chat_app/di/di.dart';
import 'package:flutter_chat_app/screens/imports.dart';
import 'package:flutter_chat_app/screens/sign_in_screen.dart';
import 'package:flutter_chat_app/utils/themes.dart';
import 'package:get/get.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

void main() {

  ///added dependency injection to connect with controller
  init();

  /// get your stream key and initialized StreamChatClient
  final client = StreamChatClient(streamKey);
  runApp(MyApp(
    client: client,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key,required this.client}) : super(key: key);

  final StreamChatClient client;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().light,
      darkTheme: AppTheme().dark,
      themeMode: ThemeMode.light,
      builder: (context, child) {

        ///Wrap with StreamChatCore to get access of client in all ancestors
        return StreamChatCore(
          client: client,
          child: ChannelsBloc(
            child: UsersBloc(
              child: StreamChat(client: client, child: child!),
            ),
          ),
        );
      },
      home: SignInScreen(),
    );
  }
}

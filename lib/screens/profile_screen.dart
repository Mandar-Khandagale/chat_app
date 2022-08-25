import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants.dart';
import 'package:flutter_chat_app/pages/widget/circle_avatar.dart';
import 'package:flutter_chat_app/pages/widget/icon_button.dart';
import 'package:flutter_chat_app/screens/imports.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.getCurrentUser;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 54,
        leading: Align(
          alignment: Alignment.centerRight,
          child: CustomIconButton(
            icon: CupertinoIcons.back,
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Column(
        children: [
           Expanded(
             child: Column(
               children: [
                 Align(
                   alignment: Alignment.center,
                   child: Hero(
                     tag: "user-profile-tag",
                     child: CustomCircleAvatar.xlarge(
                       url: user?.image,
                     ),
                   ),
                 ),
                 const SizedBox(height: 15.0,),
                 Text(
                   user?.name ?? "-",
                   style: const TextStyle(
                       fontSize: 20.0,
                       fontWeight: FontWeight.bold,
                       color: Colors.black),
                 ),
               ],
             ),
           ),
          SafeArea(
            top: false,
            bottom: true,
            child: ElevatedButton(
              onPressed: () {
                final client = StreamChatCore.of(context).client;
                client.disconnectUser();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const UserSelectionScreen()));
              },
              child: const Text(
                "Sign-Out",
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants.dart';
import 'package:flutter_chat_app/controllers/profile_screen_controller.dart';
import 'package:flutter_chat_app/pages/widget/circle_avatar.dart';
import 'package:flutter_chat_app/pages/widget/icon_button.dart';
import 'package:flutter_chat_app/screens/imports.dart';
import 'package:get/get.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({Key? key}) : super(key: key);

  final controller = Get.put(ProfileScreenController());

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
        actions: [
          GetBuilder<ProfileScreenController>(builder: (_) {
            return Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: Align(
                alignment: Alignment.center,
                child: CustomIconButton(
                  icon: controller.isThemeChanged
                      ? Icons.light_mode_outlined
                      : Icons.dark_mode_outlined,
                  onTap: () {
                    if (controller.isThemeChanged) {
                      controller.changeTheme(false);
                    } else {
                      controller.changeTheme(true);
                    }
                  },
                ),
              ),
            );
          }),
        ],
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
                   ),
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

import 'package:flutter/material.dart';
import 'package:flutter_chat_app/models/user_data_model.dart';
import 'package:get/get.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import '../screens/imports.dart';

class SelectUserScreenController extends GetxController {

  Future<void> connectUser(BuildContext context, int index) async{
    try{
      final client = StreamChatCore.of(context).client;
      await client.connectUser(
        User(id: users[index].id, extraData: {
          'name': users[index].userName,
          'image': users[index].userImg,
        }),
        client.devToken(users[index].id).rawValue,
      );
      Get.to(() => HomeScreen());
    } catch(e) {
      print(e);
    }
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/screens/imports.dart';
import 'package:get/get.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ContactPageController extends GetxController {

  Future<void> createChannel(BuildContext context, User user, bool value) async{
    final core = StreamChatCore.of(context);
    final channel = core.client.channel(
        "messaging",
        extraData: {
          'members': [
            core.currentUser!.id,
            user.id,
          ]});

    await channel.watch();

    if(value){
      Get.back();
    }
    Get.to(() => StreamChannel(channel: channel, child: const ChatScreen()));
  }



}
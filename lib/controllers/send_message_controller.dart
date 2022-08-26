import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class SendMessageController extends GetxController {

  TextEditingController textController = TextEditingController();


  Future<void> sendMessage(BuildContext context) async{
    if(textController.text.isNotEmpty) {
      await StreamChannel.of(context).channel.sendMessage(Message(text: textController.text),);
      textController.clear();
    }
  }

}
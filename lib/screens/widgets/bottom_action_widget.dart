import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/controllers/send_message_controller.dart';
import 'package:flutter_chat_app/pages/widget/action_button.dart';
import 'package:flutter_chat_app/utils/themes.dart';
import 'package:get/get.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class BottomTextWidget extends StatelessWidget {
   BottomTextWidget({Key? key}) : super(key: key);

  final controller = Get.find<SendMessageController>();

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<SendMessageController>(
      builder: (_) {
        return SafeArea(
          bottom: true,
          top: false,
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                            width: 2, color: Theme.of(context).dividerColor),
                      ),
                    ),
                    child: const Icon(CupertinoIcons.camera_fill),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                    child: TextField(
                      controller: controller.textController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type Here.....",
                          helperStyle: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis
                          )
                      ),
                      onChanged: (value) {
                        StreamChannel.of(context).channel.keyStroke();
                      },
                      onSubmitted: (value) {
                        controller.sendMessage(context);
                      },
                    ),
                  ),
                ),
                ActionButton(
                  color: AppColors.red,
                  onTap: () {
                    controller.sendMessage(context);
                  },
                  icon: Icons.send_rounded,
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
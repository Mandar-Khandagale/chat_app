import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/pages/widget/action_button.dart';
import 'package:flutter_chat_app/utils/themes.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class BottomTextWidget extends StatefulWidget {
  const BottomTextWidget({Key? key}) : super(key: key);

  @override
  State<BottomTextWidget> createState() => _BottomTextWidgetState();
}

class _BottomTextWidgetState extends State<BottomTextWidget> {

  TextEditingController controller = TextEditingController();

  Future<void> _sendMessage() async{
    if(controller.text.isNotEmpty) {
      await StreamChannel.of(context).channel.sendMessage(Message(text: controller.text),);
      controller.clear();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
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
                  controller: controller,
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
                    _sendMessage();
                  },
                ),
              ),
            ),
            ActionButton(
              color: AppColors.red,
              onTap: () {
                _sendMessage();
              },
              icon: Icons.send_rounded,
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/helpers.dart';
import 'package:flutter_chat_app/pages/widget/action_button.dart';
import 'package:flutter_chat_app/pages/widget/circle_avatar.dart';
import 'package:flutter_chat_app/pages/widget/icon_button.dart';
import 'package:flutter_chat_app/utils/themes.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.only(top: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: const  BorderRadius.all(Radius.circular(15.0)),
                        color: Theme.of(context).cardColor,
                      ),
                      child: const Text(
                        "Yesterday",
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  const ReceivedMessage(message: "Hello", date: "12-1-2022",),
                  const SentMessage(message: "Hi....", date: "12-1-2022",),
                  const ReceivedMessage(message: "Whats up?", date: "12-1-2022",),
                  const SentMessage(message: "Nothing much", date: "12-1-2022",),
                  const SentMessage(message: "What about you.. hows going on", date: "12-1-2022",),
                  const ReceivedMessage(message: "Good Going ", date: "12-1-2022",),
                  const ReceivedMessage(message: "Can meet?", date: "12-1-2022",),
                  const SentMessage(message: "yes sure", date: "12-1-2022",),
                  const SentMessage(message: "send place and time", date: "12-1-2022",),
                ],
              ),
            ),
            const BottomTextWidget(),
          ],
        ),
      ),

    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
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
      title: Row(
        children: [
          CustomCircleAvatar.small(url: Helper.randomImagesUrl()),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Mandar Khandagale",
                    style:  TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis
                    )),
                Text("Online now",
                    style: TextStyle(
                      fontSize: 10.0,
                      color: AppColors.green,
                    )),
              ],
            ),
          ),
        ],
      ),
      actions: [
        Align(
          alignment: Alignment.center,
          child: CustomIconButton(
            icon: CupertinoIcons.video_camera_solid,
            isBorderColor: true,
            onTap: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 15.0),
          child: Align(
            alignment: Alignment.center,
            child: CustomIconButton(
              icon: CupertinoIcons.phone_fill,
              isBorderColor: true,
              onTap: () {},
            ),
          ),
        ),
      ],
    );
  }
}


class BottomTextWidget extends StatelessWidget {
  const BottomTextWidget({Key? key}) : super(key: key);

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
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 18.0, right: 18.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Type Here.....",
                      helperStyle: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis
                      )
                  ),
                ),
              ),
            ),
            ActionButton(
              color: AppColors.red,
              onTap: (){},
              icon: Icons.send,
            ),
          ],
        ),
      ),
    );
  }
}

class ReceivedMessage extends StatelessWidget {
  const ReceivedMessage({
    Key? key,
    required this.message,
    required this.date,
  }) : super(key: key);

  final String message;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(15.0),
              decoration: const BoxDecoration(
                color: AppColors.textFaded,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: Text(
                message,
                style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,),
              ),
            ),
            const SizedBox(height: 5.0,),
            Text(
              date,
              style: const TextStyle(
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SentMessage extends StatelessWidget {
  const SentMessage({Key? key, required this.message, required this.date})
      : super(key: key);

  final String message;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(15.0),
              decoration: const BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: Text(
                message,
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,),
              ),
            ),
            const SizedBox(height: 5.0,),
            Text(
              date,
              style: const TextStyle(
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}




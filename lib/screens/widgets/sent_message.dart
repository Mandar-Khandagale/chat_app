import 'package:flutter/material.dart';
import 'package:flutter_chat_app/utils/themes.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class SentMessage extends StatelessWidget {
  const SentMessage({Key? key, required this.message,})
      : super(key: key);

  final Message message;

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
                message.text ?? "",
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,),
              ),
            ),
            const SizedBox(height: 5.0,),
            Text(
              Jiffy(message.createdAt.toLocal().toString()).jm,
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
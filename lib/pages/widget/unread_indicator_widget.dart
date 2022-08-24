import 'package:flutter/material.dart';
import 'package:flutter_chat_app/utils/themes.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class UnReadIndicator extends StatelessWidget {
  const UnReadIndicator({Key? key, required this.channel}) : super(key: key);

  final Channel channel;

  @override
  Widget build(BuildContext context) {
    return BetterStreamBuilder<int>(
      stream: channel.state!.unreadCountStream,
      initialData: channel.state?.unreadCount ?? 0,
      builder: (context, data) {
        if(data == 0) {
          return const SizedBox.shrink();
        }else {
          return Material(
            borderRadius: BorderRadius.circular(8.0),
            color: AppColors.secondary,
            child: Text('${data > 99 ? "99+" : data}',
                style: const TextStyle(
                  fontSize: 10.0,
                  color: AppColors.textLigth,
                )),
          );
        }
      },
    );
  }
}

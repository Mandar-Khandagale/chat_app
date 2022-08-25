import 'dart:async';

import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants.dart';
import 'package:flutter_chat_app/helpers.dart';
import 'package:flutter_chat_app/pages/widget/circle_avatar.dart';
import 'package:flutter_chat_app/pages/widget/error_widget.dart';
import 'package:flutter_chat_app/pages/widget/icon_button.dart';
import 'package:flutter_chat_app/screens/widgets/bottom_action_widget.dart';
import 'package:flutter_chat_app/screens/widgets/custom_typing_indicator.dart';
import 'package:flutter_chat_app/screens/widgets/date_label_widget.dart';
import 'package:flutter_chat_app/screens/widgets/received_message.dart';
import 'package:flutter_chat_app/screens/widgets/sent_message.dart';
import 'package:flutter_chat_app/utils/themes.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  late StreamSubscription<int> unreadCountSubscription;

  @override
  void initState() {
    unreadCountSubscription = StreamChannel.of(context).channel.state!.unreadCountStream.listen(unreadCount);
    super.initState();
  }

  @override
  void dispose() {
    unreadCountSubscription.cancel();
    super.dispose();
  }

  Future<void> unreadCount(int count) async{
    if(count > 0){
      await StreamChannel.of(context).channel.markRead();
    }
  }

  @override
  Widget build(BuildContext context) {
    final channel = StreamChannel.of(context).channel;
    return Scaffold(
      appBar: _buildAppBar(context,channel),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            Expanded(
              child: MessageListCore(
                loadingBuilder: (context) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                errorBuilder: (context, error) {
                  return ErrorDisplayWidget(error: error,);
                },
                emptyBuilder: (BuildContext context) {
                  return const SizedBox.shrink();
                },
                messageListBuilder: (context, messages) {
                  return MessagesList(message: messages,);
                },
              ),
              // ListView(
              //   children: [
              //     dateDayWidget(context),
              //     const SizedBox(height: 25.0),
              //     const ReceivedMessage(message: "Hello", date: "12-1-2022",),
              //     const SentMessage(message: "Hi....", date: "12-1-2022",),
              //     const ReceivedMessage(message: "Whats up?", date: "12-1-2022",),
              //     const SentMessage(message: "Nothing much", date: "12-1-2022",),
              //     const SentMessage(message: "What about you.. hows going on", date: "12-1-2022",),
              //     const ReceivedMessage(message: "Good Going ", date: "12-1-2022",),
              //     const ReceivedMessage(message: "Can meet?", date: "12-1-2022",),
              //     const SentMessage(message: "yes sure", date: "12-1-2022",),
              //     const SentMessage(message: "send place and time", date: "12-1-2022",),
              //   ],
              // ),
            ),
            const BottomTextWidget(),
          ],
        ),
      ),

    );
  }

  AppBar _buildAppBar(BuildContext context, Channel channel) {
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
          CustomCircleAvatar.small(url: Helper.getChannelImage(channel, context.getCurrentUser!)),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Helper.getChannelName(channel, context.getCurrentUser!) ?? "-",
                    style:  const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis
                    )),

                _buildStatusTile(channel),
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

  _buildStatusTile(Channel channel) {
    return BetterStreamBuilder<List<Member>>(
        stream: channel.state!.membersStream,
        initialData: channel.state!.members,
        builder: (context, data) {
          return ConnectionStatusBuilder(
            statusBuilder: (context, status) {
              switch (status) {
                case ConnectionStatus.connected:
                  return _buildConnectedStatusWidget(context, data);
                case ConnectionStatus.connecting:
                  return const Text("Connecting....",
                      style: TextStyle(
                        fontSize: 10.0,
                        color: AppColors.secondary,
                      ));
                case ConnectionStatus.disconnected:
                  return const Text("Offline",
                      style: TextStyle(
                        fontSize: 10.0,
                        color: AppColors.red,
                      ));
                default:
                  return const SizedBox.shrink();
              }
            },
          );
        });
  }

  _buildConnectedStatusWidget(BuildContext context, List<Member> members) {
    Widget? displayWidget;
    final channel = StreamChannel.of(context).channel;
    final memberCount = channel.memberCount;

    if (memberCount != null && memberCount > 2) {
      var text = 'Members: $memberCount';
      final watchCount = channel.state!.watcherCount ?? 0;
      if (watchCount > 0) {
        text = 'watchers: $watchCount';
      }
      displayWidget = Text(text);
    } else {
      final userId = StreamChatCore.of(context).currentUser!.id;
      final otherMembers =
          members.firstWhereOrNull((element) => element.userId != userId);

      if (otherMembers != null) {
        if (otherMembers.user?.online == true) {
          displayWidget = const Text("Online",
              style: TextStyle(
                fontSize: 10.0,
                color: AppColors.green,
              ));
        } else {
          displayWidget = Text(
              "Last seen: ${Jiffy(otherMembers.user?.lastActive).fromNow()}",
              style: const TextStyle(
                fontSize: 10.0,
                color: AppColors.green,
              ));
        }
      }
    }
    return CustomTypingIndicator(
      alternativeWidget: displayWidget,
    );
  }
}


class MessagesList extends StatelessWidget {
  const MessagesList({Key? key, required this.message}) : super(key: key);

  final List<Message> message;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      reverse: true,
      itemCount: message.length + 1,
      separatorBuilder: (context, index) {
        if(index == message.length -1) {
          return DateLabel(dateTime: message[index].createdAt,);
        }
        if(message.length ==1) {
          return const SizedBox.shrink();
        } else if(index >= message.length -1) {
          return const SizedBox.shrink();
        } else if(index <= message.length) {
          final messages = message[index];
          final nextMessage = message[index + 1];

          if(!Jiffy(messages.createdAt.toLocal()).isSame(nextMessage.createdAt.toLocal(), Units.DAY)) {
            return DateLabel(dateTime: message[index].createdAt,);
          }else {
            return const SizedBox.shrink();
          }
        }else {
          return const SizedBox.shrink();
        }
      },
      itemBuilder: (context, index) {
        if(index < message.length) {
          final messages = message[index];
          if(messages.user?.id == context.getCurrentUser?.id) {
            return SentMessage(message: messages,);
          }else {
            return ReceivedMessage(message: messages);
          }
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}




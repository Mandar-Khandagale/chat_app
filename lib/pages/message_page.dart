import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants.dart';
import 'package:flutter_chat_app/helpers.dart';
import 'package:flutter_chat_app/pages/widget/circle_avatar.dart';
import 'package:flutter_chat_app/pages/widget/error_widget.dart';
import 'package:flutter_chat_app/pages/widget/unread_indicator_widget.dart';
import 'package:flutter_chat_app/screens/imports.dart';
import 'package:flutter_chat_app/utils/themes.dart';
import 'package:get/route_manager.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ///Wrapped with ChannelListCore to get the list of all channels
    return ChannelListCore(
      filter: Filter.and([
        Filter.equal("type", "messaging"),
        Filter.in_("members", [StreamChatCore.of(context).currentUser!.id]),
      ]),
      errorBuilder: (context, error) {
        return ErrorDisplayWidget(error: error,);
      },
      emptyBuilder: (context) {
        return const Center(
          child: Text("No message to display \n Go and message someone",
              textAlign: TextAlign.center,
              style:  TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              )),
        );
      },
      loadingBuilder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      listBuilder: (context, channels) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const StoriesCard(),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: channels.length,
                  itemBuilder: (context, index) {
                    return MessageCard(
                      channel: channels[index],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child:  Divider(
                        thickness: 1.0,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class MessageCard extends StatelessWidget {
  const MessageCard({Key? key, required this.channel}) : super(key: key);

  final Channel channel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.to(() =>
          StreamChannel(channel: channel,child: const ChatScreen())
        );
      },
      leading: CustomCircleAvatar.large(url: Helper.getChannelImage(channel, context.getCurrentUser!)),
      title: Text(Helper.getChannelName(channel, context.getCurrentUser!) ?? "-",
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          )),
      subtitle: _buildLastMsgWidget(),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildLastMsgTimeWidget(),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            height: 18,
            width: 18,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
            ),
            child:  Center(
              child:  UnReadIndicator(channel: channel,),
            ),
          ),
        ],
      ),
    );
  }

  _buildLastMsgTimeWidget() {
    return BetterStreamBuilder<DateTime>(
      stream: channel.lastMessageAtStream,
      initialData: channel.lastMessageAt,
      builder: (context, dateTime) {
        final lastMsgTime = dateTime.toLocal();
        String stringDate;
        final now = DateTime.now();
        final startOfDay = DateTime(now.year, now.month, now.day);
        if (lastMsgTime.millisecondsSinceEpoch >=
            startOfDay.millisecondsSinceEpoch) {
          stringDate = Jiffy(lastMsgTime.toLocal()).jm;
        } else if (lastMsgTime.millisecondsSinceEpoch >=
            startOfDay
                .subtract(const Duration(days: 1))
                .millisecondsSinceEpoch) {
          stringDate = 'YESTERDAY';
        } else if (startOfDay
            .difference(lastMsgTime)
            .inDays < 7) {
          stringDate = Jiffy(lastMsgTime.toLocal()).EEEE;
        } else {
          stringDate = Jiffy(lastMsgTime.toLocal()).yMd;
        }

        return Text(stringDate,
            style: const TextStyle(
              fontSize: 14.0,
            ));
      }
    );
  }

  _buildLastMsgWidget() {
    return BetterStreamBuilder<int>(
      stream: channel.state!.unreadCountStream,
      initialData: channel.state?.unreadCount ?? 0,
      builder: (context, count) {
        return BetterStreamBuilder<Message>(
          stream: channel.state!.lastMessageStream,
          initialData: channel.state!.lastMessage,
          builder: (context, message) {
            return Text(message.text ?? "-",
                style: TextStyle(
                  fontSize: 14.0,
                  color: count > 0 ? AppColors.secondary : AppColors.textFaded,
                ));
          }
        );
      }
    );
  }
}



class StoriesCard extends StatelessWidget {
  const StoriesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
           const Text("Stories",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 10.0,),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  final fakeData = Faker();
                  return Column(
                    children: [
                      CustomCircleAvatar.large(url: Helper.randomImagesUrl()),
                      const SizedBox(height: 10.0,),
                      Text(fakeData.person.firstName(),
                          style: const TextStyle(
                            fontSize: 14.0,
                          )),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 10.0,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

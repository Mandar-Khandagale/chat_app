import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants.dart';
import 'package:flutter_chat_app/pages/widget/error_widget.dart';
import 'package:flutter_chat_app/screens/imports.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserListCore(
      filter: Filter.notEqual("id", context.getCurrentUser!.id),
      errorBuilder: (context, error) {
        return ErrorDisplayWidget(error: error,);
      },
      emptyBuilder: (context) {
        return const Center(
          child: Text("No Contacts to display",
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
      listBuilder: (context, items) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.separated(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return items[index].when(
                headerItem: (_) => const SizedBox.shrink(),
                userItem: (user) {
                  return ListTile(
                    onTap: () {
                      createChannel(context, user);
                    },
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(28.0),
                      child: CircleAvatar(
                        radius: 28.0,
                        backgroundColor: Theme.of(context).cardColor,
                        child: Image.network(
                          user.image ?? "-",
                          fit: BoxFit.fill,
                          errorBuilder: (context, index, _) {
                            return const FlutterLogo();
                          },
                        ),
                      ),
                    ),
                    title: Text(user.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        )),
                  );
                },
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 25.0,);
            },
          ),
        );
      },
    );
  }

  Future<void> createChannel(BuildContext context, User user) async{
    final core = StreamChatCore.of(context);
    final channel = core.client.channel(
      "messaging",
      extraData: {
        'members': [
          core.currentUser!.id,
          user.id,
        ]});

    await channel.watch();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                StreamChannel(channel: channel, child: const ChatScreen())));
  }

}

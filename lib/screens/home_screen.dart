import 'package:flutter/material.dart';
import 'package:flutter_chat_app/pages/calls_page.dart';
import 'package:flutter_chat_app/pages/contact_page.dart';
import 'package:flutter_chat_app/pages/message_page.dart';
import 'package:flutter_chat_app/pages/notification_page.dart';
import 'package:flutter_chat_app/pages/widget/bottom_navigation_bar.dart';
import 'package:flutter_chat_app/utils/themes.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<String> title = ValueNotifier("Messages");

  final pages = const [
    MessagePage(),
    NotificationPage(),
    CallsPage(),
    ContactPage(),
  ];

  final titles = const ["Messages", "Notifications", "Calls", "Contacts"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder(
            valueListenable: title,
            builder: (context, String value, _) {
              return Text(value,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ));
            }),
        leading: const Icon(Icons.search),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (context, int index, _) {
          return pages[index];
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemSelected: (index) {
          pageIndex.value = index;
          title.value = titles[index];
        },
      ),
    );
  }
}

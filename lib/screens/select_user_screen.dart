import 'package:flutter/material.dart';
import 'package:flutter_chat_app/controllers/select_user_screen_controller.dart';
import 'package:flutter_chat_app/models/user_data_model.dart';
import 'package:get/get.dart';

class UserSelectionScreen extends StatelessWidget {
   UserSelectionScreen({Key? key}) : super(key: key);

  final controller = Get.find<SelectUserScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Select User",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.separated(
        shrinkWrap: true,
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: ListTile(
              onTap: () {
                controller.connectUser(context, index);
              },
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(28.0),
                child: CircleAvatar(
                  radius: 28.0,
                  backgroundColor: Theme.of(context).cardColor,
                  child: Image.network(
                    users[index].userImg,
                    fit: BoxFit.fill,
                    errorBuilder: (context, index, _) {
                      return const FlutterLogo();
                    },
                  ),
                ),
              ),
              title: Text(
                users[index].userName,
                style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 20.0,
          );
        },
      ),
    );
  }
}

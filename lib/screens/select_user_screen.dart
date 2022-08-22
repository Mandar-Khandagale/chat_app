import 'package:flutter/material.dart';
import 'package:flutter_chat_app/models/user_data_model.dart';
import 'package:flutter_chat_app/screens/imports.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class UserSelectionScreen extends StatelessWidget {
  const UserSelectionScreen({Key? key}) : super(key: key);

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
              onTap: () async{
                try{
                  final client = StreamChatCore.of(context).client;
                  await client.connectUser(
                    User(id: users[index].id, extraData: {
                      'name': users[index].userName,
                      'image': users[index].userImg,
                    }),
                    client.devToken(users[index].id).rawValue,
                  );
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                } catch(e) {
                  print(e);
                }
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

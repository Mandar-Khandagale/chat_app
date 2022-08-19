import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/helpers.dart';
import 'package:flutter_chat_app/pages/widget/circle_avatar.dart';
import 'package:flutter_chat_app/screens/imports.dart';
import 'package:flutter_chat_app/utils/themes.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: StoriesCard(),
            ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => const MessageCard()),
          ),
        ],
      ),
    );
  }
}

class MessageCard extends StatelessWidget {
  const MessageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        final data = Faker();
        return ListTile(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const ChatScreen()));
          },
          leading: CustomCircleAvatar.large(url: Helper.randomImagesUrl()),
          title: Text(data.person.firstName(),
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              )),
          subtitle: Text(data.address.streetAddress(),
              style: const TextStyle(
                fontSize: 14.0,
                color: AppColors.textFaded,
              )),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text( data.date.time(),
                  style: const TextStyle(
                    fontSize: 14.0,
                  )),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                height: 18,
                width: 18,
                decoration: const BoxDecoration(
                  color: AppColors.secondary,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child:  Text("1",
                      style: TextStyle(
                        fontSize: 10.0,
                        color: AppColors.textLigth,
                      )),
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 20.0,);
      },
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

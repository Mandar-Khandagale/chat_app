import 'dart:math';

import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

abstract class Helper{

  static final random = Random();


  static String randomImagesUrl() {
    final value = random.nextInt(1000);
    return 'https://picsum.photos/seed/$value/300/300';
  }


  /// to get the image of channels from the stream channel
  static String? getChannelImage(Channel channel, User currentUser) {
    if(channel.image != null) {
      return channel.image!;
    } else if(channel.state?.members.isNotEmpty ?? false) {
      final otherMembers = channel.state?.members.where((element) => element.userId != currentUser.id,).toList();
      if(otherMembers?.length == 1) {
        return otherMembers!.first.user?.image;
      }
    }
    return null;
  }

  /// to get the name of channels from the stream channel
  static String? getChannelName(Channel channel, User currentUser) {
    if(channel.name != null) {
      return channel.name!;
    } else if(channel.state?.members.isNotEmpty ?? false) {
      final otherMembers = channel.state?.members.where((element) => element.userId != currentUser.id,).toList();
      if(otherMembers?.length == 1) {
        return otherMembers!.first.user?.name;
      }
    }
    return null;
  }

}
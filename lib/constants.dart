import 'package:flutter/material.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

const String streamKey = "s8k43m9bhkhq";


extension StreamChatContext on BuildContext {

 User? get getCurrentUser => StreamChatCore.of(this).currentUser;
 String? get  getUserImage => getCurrentUser?.image;

}
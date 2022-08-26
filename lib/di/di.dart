import 'package:flutter_chat_app/controllers/contact_page_controller.dart';
import 'package:flutter_chat_app/controllers/profile_screen_controller.dart';
import 'package:flutter_chat_app/controllers/select_user_screen_controller.dart';
import 'package:flutter_chat_app/controllers/send_message_controller.dart';
import 'package:get/get.dart';

 /// put all controllers here and using Get.find get access to the controllers
 init() {
  Get.put(ProfileScreenController());
  Get.put(SendMessageController());
  Get.put(ContactPageController());
  Get.put(SelectUserScreenController());
}
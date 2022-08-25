import 'package:flutter_chat_app/utils/themes.dart';
import 'package:get/get.dart';

class ProfileScreenController extends GetxController {

  var isThemeChanged = false;


  void changeTheme(value) {
    if(value == true) {
      isThemeChanged = true;
      Get.changeTheme(AppTheme().dark);
    }else {
      isThemeChanged = false;
      Get.changeTheme(AppTheme().light);
    }
  }


}
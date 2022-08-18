import 'dart:math';

abstract class Helper{

  static final random = Random();


  static String randomImagesUrl() {
    final value = random.nextInt(1000);
    return 'https://picsum.photos/seed/$value/300/300';
  }

}
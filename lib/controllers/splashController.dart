//flutter
import 'dart:async';
//packages
import 'package:get/get.dart';
import 'package:paneasy/views/Introduction/introduction_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    _init();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  _init() {
    Timer(Duration(seconds: 4), () {
      Get.off(() => IntroductionScreen1(), routeName: "CustomerListScreen");
    });
  }
}

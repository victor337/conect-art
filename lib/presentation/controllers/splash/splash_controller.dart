import 'package:conecta_arte/helpers/pages/name_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  Future<void> getData() async {
    await Future.delayed(const Duration(seconds: 3)).then((value) {
      Get.offAllNamed(onboarding);
    });
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}

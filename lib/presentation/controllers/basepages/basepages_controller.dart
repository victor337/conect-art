import 'package:get/get.dart';

class BasepagesController extends GetxController {
  int index = 0;
  void setindex(int setindex) {
    index = setindex;
    update();
  }
}

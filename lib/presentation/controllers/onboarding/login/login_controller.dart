import 'package:get/get.dart';

class LoginController extends GetxController {
  bool isLoading = false;

  String email;
  void setemail(String setemail) {
    email = setemail;
    update();
  }

  String pass;
  void setpass(String setpass) {
    pass = setpass;
    update();
  }
}

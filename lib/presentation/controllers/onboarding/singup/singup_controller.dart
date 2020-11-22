import 'package:get/get.dart';

class SingupController extends GetxController {
  bool isLoading = false;

  String name;
  void setname(String setname) {
    name = setname;
    update();
  }

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

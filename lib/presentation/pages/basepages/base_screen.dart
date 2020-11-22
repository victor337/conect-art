import 'package:conecta_arte/presentation/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './tabs/hometab/hometab_screen.dart';

class BaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BasepagesController>(
      init: BasepagesController(),
      builder: (basePagesController) {
        if (basePagesController.index == 0) {
          return HomeTab();
        }
        return Container();
      },
    );
  }
}

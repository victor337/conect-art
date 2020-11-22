import 'package:conecta_arte/presentation/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (splashController) {
        return Scaffold(
          backgroundColor: const Color(0xff13609e),
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'conect',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                  ),
                ),
                Text(
                  'art',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 35,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:conecta_arte/helpers/helpers.dart';
import 'package:flutter/material.dart';

import 'package:conecta_arte/presentation/widgets/widgets.dart';
import 'package:get/get.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Seja vindo ao',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'conect',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              Text(
                'art',
                style: TextStyle(color: Colors.orange, fontSize: 30),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButtons(
                initText: 'Conectar-',
                endText: 'se',
                onPressed: () {
                  Get.offNamed(login);
                },
              ),
              CustomButtons(
                initText: 'Cadastra-',
                endText: 'se',
                onPressed: () {
                  Get.offNamed(singup);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

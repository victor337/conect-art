import 'package:conecta_arte/presentation/controllers/home/tabs/hometab_controller.dart';
import 'package:flutter/material.dart';

import 'package:conecta_arte/presentation/widgets/widgets.dart';
import 'package:get/get.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Olá, Victor!'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: SearchWidget(),
            ),
            GetBuilder<HometabController>(
              init: HometabController(),
              builder: (hometabController) {
                if (hometabController.professionalslist == null) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ),
                  );
                } else if (hometabController.professionalslist.isEmpty) {
                  return const Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Ainda não há nada por aqui'),
                    ),
                  );
                }
                return Expanded(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: ListView.builder(
                      itemCount: hometabController.professionalslist.length,
                      itemBuilder: (ctx, index) {
                        return ProfessionalCard(
                          professionalEntity:
                              hometabController.professionalslist[index],
                          index: index,
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

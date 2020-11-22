import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:conecta_arte/helpers/helpers.dart';

import '../../../controllers/controllers.dart';
import '../../../widgets/widgets.dart';

class SingupScreen extends StatelessWidget {
  final FocusNode focusName = FocusNode();
  final FocusNode focusEmail = FocusNode();
  final FocusNode focusPass = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Text(
              'Cadastrar',
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: GetBuilder<SingupController>(
              init: SingupController(),
              builder: (singupController) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'conect',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        Text(
                          'art',
                          style: TextStyle(color: Colors.orange, fontSize: 22),
                        ),
                      ],
                    ),
                    CustomFormField(
                      focusNode: focusName,
                      onChanged: singupController.setname,
                      hintText: 'Nome',
                      onFieldSubmitted: (email) {
                        focusName.unfocus();
                        FocusScope.of(context).requestFocus(focusEmail);
                      },
                      textInputAction: TextInputAction.next,
                      keyBoardType: TextInputType.name,
                      iconData: Icons.person,
                      enabled: !singupController.isLoading,
                      initalValue: singupController.name,
                    ),
                    CustomFormField(
                      focusNode: focusEmail,
                      onChanged: singupController.setemail,
                      hintText: 'Email',
                      onFieldSubmitted: (email) {
                        focusEmail.unfocus();
                        FocusScope.of(context).requestFocus(focusPass);
                      },
                      textInputAction: TextInputAction.next,
                      keyBoardType: TextInputType.emailAddress,
                      iconData: Icons.email,
                      enabled: !singupController.isLoading,
                      initalValue: singupController.email,
                    ),
                    CustomFormField(
                      focusNode: focusPass,
                      onChanged: singupController.setpass,
                      hintText: 'Senha',
                      onFieldSubmitted: (pass) {
                        focusPass.unfocus();
                      },
                      textInputAction: TextInputAction.done,
                      keyBoardType: TextInputType.visiblePassword,
                      iconData: Icons.lock,
                      enabled: !singupController.isLoading,
                      initalValue: singupController.pass,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        disabledColor: const Color.fromARGB(100, 255, 255, 255),
                        color: const Color(0xff13609e),
                        onPressed: () {
                          Get.offNamed(basepages);
                        },
                        child: singupController.isLoading
                            ? const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(
                                  Colors.white,
                                ),
                              )
                            : const Text(
                                'Cadastrar',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        Get.offNamed(login);
                      },
                      child: const Text(
                        'Já possui conta? Clique aqui',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

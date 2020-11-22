import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:conecta_arte/helpers/helpers.dart';

import '../../../controllers/controllers.dart';
import '../../../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
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
              'Login',
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
            child: GetBuilder<LoginController>(
              init: LoginController(),
              builder: (loginController) {
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
                      focusNode: focusEmail,
                      onChanged: loginController.setemail,
                      hintText: 'Email',
                      onFieldSubmitted: (email) {
                        focusEmail.unfocus();
                        FocusScope.of(context).requestFocus(focusPass);
                      },
                      textInputAction: TextInputAction.next,
                      keyBoardType: TextInputType.emailAddress,
                      iconData: Icons.email,
                      enabled: !loginController.isLoading,
                      initalValue: loginController.email,
                    ),
                    CustomFormField(
                      focusNode: focusPass,
                      onChanged: loginController.setpass,
                      hintText: 'Senha',
                      onFieldSubmitted: (pass) {
                        focusPass.unfocus();
                      },
                      textInputAction: TextInputAction.done,
                      keyBoardType: TextInputType.visiblePassword,
                      iconData: Icons.lock,
                      enabled: !loginController.isLoading,
                      initalValue: loginController.pass,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        disabledColor: const Color.fromARGB(100, 255, 255, 255),
                        color: const Color(0xff13609e),
                        onPressed: () {
                          Get.offNamed(basepages);
                        },
                        child: loginController.isLoading
                            ? const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(
                                  Colors.white,
                                ),
                              )
                            : const Text(
                                'Entrar',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        Get.offNamed(singup);
                      },
                      child: const Text(
                        'Não tem conta? Clique aqui',
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

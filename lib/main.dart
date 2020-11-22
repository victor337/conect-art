import 'package:conecta_arte/presentation/pages/onboarding/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import './helpers/helpers.dart';
import './presentation/pages/pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: splash,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        appBarTheme: const AppBarTheme(elevation: 0),
        scaffoldBackgroundColor: Theme.of(context).primaryColor,
      ),
      defaultTransition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 150),
      getPages: [
        GetPage(name: splash, page: () => SplashScreen()),
        GetPage(name: onboarding, page: () => Onboarding()),
        GetPage(name: login, page: () => LoginScreen()),
        GetPage(name: singup, page: () => SingupScreen()),
        GetPage(name: singup, page: () => SingupScreen()),
        GetPage(name: basepages, page: () => BaseScreen()),
      ],
    );
  }
}

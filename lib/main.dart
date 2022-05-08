import 'package:chat_app/app/controllers/auth_controller.dart';
import 'package:chat_app/app/utils/error_screen.dart';
import 'package:chat_app/app/utils/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

import 'package:firebase_core/firebase_core.dart';

import 'app/utils/splash_screen.dart';
// import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  final authController = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const ErrorScreen();
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return FutureBuilder(
                future: Future.delayed(Duration(seconds: 3)),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Obx(() => GetMaterialApp(
                          debugShowCheckedModeBanner: false,
                          title: "Chat App",
                          initialRoute: authController.isSkipIntro.isTrue
                              ? authController.isAuth.isTrue
                                  ? Routes.HOME
                                  : Routes.LOGIN
                              : Routes.INTRODUCTION,
                          getPages: AppPages.routes,
                        ));
                  }

                  return FutureBuilder(
                      future: authController.firstInitialized(),
                      builder: (context, snapshot) => SplasScreen());
                });
          }

          return const LoadingScreen();
        });
  }
}

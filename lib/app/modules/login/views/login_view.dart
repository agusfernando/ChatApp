import 'package:chat_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../controllers/auth_controller.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final AuthController authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                height: Get.height * .6,
                width: Get.width * .6,
                child: Lottie.asset('assets/lottie/google_animation.json'),
              ),
              ElevatedButton(
                onPressed: () => authController.login(),
                child: const Text('Sign in with Google'),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

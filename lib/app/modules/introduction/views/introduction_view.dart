import 'package:chat_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "Title of first page",
              body:
                  "Here you can write the description of the page, to explain someting...",
              image: Container(
                height: Get.height * .6,
                width: Get.width * .6,
                child: Center(
                  child: Lottie.asset('assets/lottie/girl_chatting.json'),
                ),
              ),
            ),
            PageViewModel(
              title: "Title of second page",
              body:
                  "Here you can write the description of the page, to explain someting...",
              image: Container(
                height: Get.height * .6,
                width: Get.width * .6,
                child: Center(
                  child: Lottie.asset('assets/lottie/man_chatting.json'),
                ),
              ),
            ),
            PageViewModel(
              title: "Title of third page",
              body:
                  "Here you can write the description of the page, to explain someting...",
              image: Container(
                height: Get.height * .6,
                width: Get.width * .6,
                child: Center(
                  child: Lottie.asset('assets/lottie/sending_chat.json'),
                ),
              ),
            )
          ],
          onDone: () => Get.offAllNamed(Routes.LOGIN),
          showBackButton: false,
          showSkipButton: true,
          skip: const Text('skip'),
          next: const Text('next'),
          done: const Text("Login",
              style: TextStyle(fontWeight: FontWeight.w600)),
          dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0))),
        ),
      ),
    );
  }
}

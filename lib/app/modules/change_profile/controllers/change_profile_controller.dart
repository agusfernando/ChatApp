import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeProfileController extends GetxController {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController nameTextController = TextEditingController();
  TextEditingController statusTextController = TextEditingController();

  Map<String, dynamic>? user;

  @override
  void onClose() {
    emailTextController.dispose();
    nameTextController.dispose();
    statusTextController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    user = Get.arguments;
    emailTextController.text = user?['email'];
    nameTextController.text = user?['name'];

    super.onInit();
  }
}

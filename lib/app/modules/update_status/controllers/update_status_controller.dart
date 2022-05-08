import 'package:get/get.dart';
import 'package:flutter/material.dart';

class UpdateStatusController extends GetxController {
  TextEditingController updateStatusTextController = TextEditingController();

  @override
  void onClose() {
    updateStatusTextController.dispose();

    super.onClose();
  }
}

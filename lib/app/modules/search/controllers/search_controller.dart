import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  TextEditingController searchTextController = TextEditingController();

  @override
  void onClose() {
    searchTextController.dispose();

    super.onClose();
  }
}

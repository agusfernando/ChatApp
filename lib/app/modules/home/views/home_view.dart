import 'package:chat_app/app/routes/app_pages.dart';
import 'package:chat_app/app/widgets/person_chat.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  List<Widget> listChat =
      List.generate(5, (index) => PersonChat(index: index)).reversed.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.SEARCH),
        child: const Icon(Icons.message),
      ),
      body: SafeArea(
        child: Column(
          children: [
            //Header
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              decoration: const BoxDecoration(
                  border:
                      Border(bottom: BorderSide(width: 1, color: Colors.grey))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Chat',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.PROFILE);
                    },
                    icon: const Icon(
                      Icons.person,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ),
            //Body
            Expanded(
              child: ListView.builder(
                itemCount: listChat.length,
                itemBuilder: (context, index) => listChat[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:avatar_glow/avatar_glow.dart';
import 'package:chat_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';
import '../../../controllers/auth_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final AuthController authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.lightBlue[900],
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => authController.logout(),
                icon: Icon(
                  Icons.logout,
                  color: Colors.lightBlue[900],
                ))
          ],
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  //image profile
                  AvatarGlow(
                    endRadius: 110,
                    glowColor: Colors.black,
                    duration: const Duration(seconds: 2),
                    child: Container(
                      margin: const EdgeInsets.all(18),
                      width: 175,
                      height: 175,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue[500],
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                            image: NetworkImage(
                                '${authController.currentUser?.photoUrl}'),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  //name
                  Text(
                    authController.currentUser?.displayName ?? '',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.lightBlue[900],
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  //email
                  Text(
                    authController.currentUser?.email ?? '',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.lightBlue[900],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  ListTile(
                    onTap: () => Get.toNamed(Routes.UPDATE_STATUS),
                    leading: const Icon(Icons.note_add_outlined),
                    title: const Text(
                      'Update Status',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  ListTile(
                    onTap: () => Get.toNamed(Routes.CHANGE_PROFILE, arguments: {
                      'name': authController.currentUser?.displayName,
                      'email': authController.currentUser?.email
                    }),
                    leading: const Icon(Icons.person),
                    title: const Text(
                      'Change Profile',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.color_lens),
                    title: const Text(
                      'Change Theme',
                      style: TextStyle(fontSize: 22),
                    ),
                    trailing: const Text('Light'),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: context.mediaQueryPadding.bottom),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Chat App',
                    style: TextStyle(color: Colors.black54),
                  ),
                  Text(
                    'v1.0',
                    style: TextStyle(color: Colors.black54),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

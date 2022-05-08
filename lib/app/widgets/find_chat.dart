import 'package:chat_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FindChat extends StatelessWidget {
  int index;
  FindChat({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.toNamed(Routes.CHAT_ROOM),
      leading: const CircleAvatar(
        backgroundColor: Colors.black26,
        radius: 30,
        backgroundImage: AssetImage('assets/logo/no_profile.png'),
      ),
      title: Text(
        'Nama $index',
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        'status $index',
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      // trailing: Chip(label: Text('$index')),
    );
  }
}

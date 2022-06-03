import 'package:chat_app/app/widgets/card_chats.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_room_controller.dart';

class ChatRoomView extends GetView<ChatRoomController> {
  List<CardChat> chats = [
    CardChat(
      isMe: true,
      text: 'Hallo',
      color: Colors.blue,
    ),
    CardChat(
      isMe: true,
      text: 'Bales dong ............................................',
      color: Colors.yellow,
    ),
    CardChat(
      isMe: false,
      text: 'Iya, \nsiapa ya?.................................',
      color: Colors.green,
    ),
    CardChat(
      isMe: false,
      text: 'Akku lahhhh',
      color: Colors.red,
    ),
    CardChat(
      isMe: true,
      text: 'Hallo',
      color: Colors.blue,
    ),
    CardChat(
      isMe: true,
      text: 'Bales dong ............................................',
      color: Colors.yellow,
    ),
    CardChat(
      isMe: false,
      text: 'Iya, \nsiapa ya?.................................',
      color: Colors.green,
    ),
    CardChat(
      isMe: false,
      text: 'Akku lahhhh',
      color: Colors.red,
    ),
    CardChat(
      isMe: false,
      text: 'Lah iya siapa?',
      color: Colors.black,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.blueAccent,
          titleSpacing: 0,
          title: const ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage('assets/logo/no_profile.png'),
            ),
            title: Text(
              'Name',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'status',
              style: TextStyle(color: Colors.white),
            ),
          ),
          centerTitle: false,
        ),
        body: Column(
          children: [
            //List Chat
            Expanded(
                child: Container(
              color: Colors.cyan[100],
              child: ListView(
                controller: controller.scrollController,
                reverse: false,
                shrinkWrap: true,
                children: chats.map((e) => e).toList(),
              ),
            )),
            //Text Message
            Container(
              margin: EdgeInsets.only(bottom: context.mediaQueryPadding.bottom),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                          onPressed: () {
                            controller.isEmojiShow.toggle();
                          },
                          icon: Icon(
                            Icons.emoji_emotions_outlined,
                            color: Colors.lightBlue.shade700,
                          )),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      hintText: 'Type a message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.lightBlue.shade900,
                          )),
                    ),
                  )),
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[900],
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

import 'package:chat_app/app/widgets/card_chats.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_room_controller.dart';

class ChatRoomView extends GetView<ChatRoomController> {
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
              child: ListView(
                children: [
                  CardChat(
                    isMe: true,
                  ),
                  CardChat(
                    isMe: false,
                  ),
                  CardChat(
                    isMe: true,
                  ),
                  CardChat(
                    isMe: false,
                  ),
                ],
              ),
            )),
            //Text Message
            Container(
              margin: EdgeInsets.only(bottom: context.mediaQueryPadding.bottom),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                  SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[900],
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
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

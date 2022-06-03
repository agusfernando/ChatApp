import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardChat extends StatelessWidget {
  const CardChat(
      {Key? key, required this.text, required this.isMe, required this.color})
      : super(key: key);

  final String text;
  final bool isMe;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      padding: const EdgeInsets.all(5),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: Get.width * .65,
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
            color: isMe ? Colors.blue.shade100 : Colors.grey.shade300,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(20),
              topRight: const Radius.circular(20),
              bottomLeft:
                  isMe ? const Radius.circular(20) : const Radius.circular(0),
              bottomRight:
                  isMe ? const Radius.circular(0) : const Radius.circular(20),
            )),
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 18),
              softWrap: true,
            ),
            const SizedBox(height: 10),
            Text(
              '07.00 PM',
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}

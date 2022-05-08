import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardChat extends StatelessWidget {
  CardChat({Key? key, required this.isMe}) : super(key: key);

  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      padding: EdgeInsets.all(12),
      child: Container(
        width: Get.width * .65,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: isMe ? Colors.blue.shade100 : Colors.grey.shade300,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: isMe ? Radius.circular(20) : Radius.circular(0),
              bottomRight: isMe ? Radius.circular(0) : Radius.circular(20),
            )),
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              'datadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadata',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
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

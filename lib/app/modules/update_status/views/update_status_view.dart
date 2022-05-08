import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/update_status_controller.dart';

class UpdateStatusView extends GetView<UpdateStatusController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // iconTheme: IconThemeData(
        //   color: Colors.lightBlue[900],
        // ),
        elevation: 0,
        backgroundColor: Colors.lightBlue[300],
        title: Text('Update Status'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller.updateStatusTextController,
              style: TextStyle(fontSize: 18),
              cursorColor: Colors.blueAccent,
              decoration: InputDecoration(
                hintText: 'Write Status...',
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: const BorderSide(color: Colors.black26),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: const BorderSide(color: Colors.black26),
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: Get.width,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Update',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlueAccent[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 30)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:avatar_glow/avatar_glow.dart';
import 'package:chat_app/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/change_profile_controller.dart';

class ChangeProfileView extends GetView<ChangeProfileController> {
  final AuthController authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // iconTheme: IconThemeData(
        //   color: Colors.lightBlue[900],
        // ),
        elevation: 0,
        backgroundColor: Colors.lightBlue[300],
        title: Text('Change Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(18),
          child: Column(
            children: [
              AvatarGlow(
                endRadius: 75,
                glowColor: Colors.black,
                duration: const Duration(seconds: 2),
                child: Container(
                  margin: const EdgeInsets.all(15),
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue[500],
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                          image: NetworkImage(
                              authController.currentUser!.photoUrl!),
                          fit: BoxFit.cover)),
                ),
              ),
              SizedBox(height: 20),
              TextFieldDefault(
                hint: 'Email',
                textEditingController: controller.emailTextController,
              ),
              SizedBox(height: 10),
              TextFieldDefault(
                hint: 'Name',
                textEditingController: controller.nameTextController,
              ),
              SizedBox(height: 10),
              TextFieldDefault(
                hint: 'Status',
                textEditingController: controller.statusTextController,
              ),
              SizedBox(height: 20),
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
      ),
    );
  }
}

class TextFieldDefault extends StatelessWidget {
  TextFieldDefault(
      {Key? key, required this.textEditingController, required this.hint})
      : super(key: key);
  TextEditingController textEditingController;
  String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 18),
      cursorColor: Colors.blueAccent,
      decoration: InputDecoration(
        labelText: hint,
        labelStyle: TextStyle(color: Colors.black),
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
    );
  }
}

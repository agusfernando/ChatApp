import 'package:chat_app/app/widgets/find_chat.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  List<Widget> listFind = List.generate(10, (index) => FindChat(index: index));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text('Search'),
          centerTitle: true,
          elevation: 0,
          flexibleSpace: Padding(
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TextField(
                controller: controller.searchTextController,
                cursorColor: Colors.blueAccent,
                decoration: InputDecoration(
                  hintText: 'Search new friend...',
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(color: Colors.black26),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(color: Colors.black26),
                  ),
                ),
              ),
            ),
          ),
        ),
        preferredSize: const Size.fromHeight(140),
      ),
      body: listFind.isEmpty
          ? SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 55,
                    ),
                    Container(
                        height: Get.height * .3,
                        width: Get.width * .3,
                        child:
                            Lottie.asset('assets/lottie/no_data_found.json')),
                    const Text(
                      'No Data Found',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )
          : ListView.builder(
              itemCount: listFind.length,
              itemBuilder: (context, index) => listFind[index],
            ),
    );
  }
}

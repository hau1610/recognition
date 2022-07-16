import 'dart:io';

import 'package:aplusphoto/page/HomePage/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../svg.dart';

class HomePage extends StatelessWidget {
  HomePageController h = Get.put(HomePageController());

  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    void _showOptions(BuildContext context) {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return SizedBox(
                height: 120,
                child: Column(children: <Widget>[
                  ListTile(
                      onTap: () {
                        Get.back();
                        h.showImagePicker(ImageSource.gallery);
                      },
                      leading: const Icon(Icons.photo_library),
                      title: const Text("Chọn ảnh từ thư viện")),
                  ListTile(
                      onTap: () {
                        Get.back();
                        h.showImagePicker(ImageSource.camera);
                      },
                      leading: const Icon(Icons.camera_alt_rounded),
                      title: const Text("Chọn ảnh từ máy ảnh"))
                ]));
          });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(12, 52, 61, 1),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          child: Text(
            'A+ FACE RECOGNITION',
            style: TextStyle(
                fontFamily: 'NotoSans',
                color: Color.fromRGBO(54, 238, 236, 0.5),
                fontSize: 23,
                //17
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            color: const Color.fromRGBO(12, 52, 61, 1),
            child: const Image(
              image: AssetImage(Picture.bg),
              fit: BoxFit.contain,
            ),
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  _showOptions(context);
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 30, left: 50, right: 50),
                  height: 50,
                  child: const Center(
                    child: Text(
                      'Chọn ảnh',
                      style: TextStyle(
                          fontFamily: 'NotoSans',
                          fontSize: 18,
                          color: Color.fromRGBO(243, 243, 243, 1),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(54, 238, 236, 0.6),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              Obx(() => h.pathImage.value.isNotEmpty
                  ? GestureDetector(
                      onTap: () {
                        h.upload(h.pathImage.value);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 50),
                        height: 50,
                        child: const Center(
                          child: Text(
                            'Nhận diện',
                            style: TextStyle(
                                fontFamily: 'NotoSans',
                                fontSize: 18,
                                color: Color.fromRGBO(243, 243, 243, 1),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(54, 238, 236, 0.6),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    )
                  : Container()),
              const SizedBox(height: 20),
              Obx(() => h.pathImage.value.isNotEmpty
                  ? Expanded(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.file(
                            File(h.pathImage.value),
                            height: 350,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Name : ${h.name.value}',
                          style: const TextStyle(
                              fontFamily: 'NotoSans',
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ))
                  : Container())
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:aplusphoto/svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../get_routes.dart';

class Introduction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
            height: Get.height,
            width: Get.width,
            color: const Color.fromRGBO(12, 52, 61, 1)),
        Container(
          margin: const EdgeInsets.only(top: 30),
          child: const Image(
            image: AssetImage(Picture.bg),
            fit: BoxFit.fill,
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: Get.height / 1.75,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'Chào mừng bạn đến với',
                  style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: Color.fromRGBO(243, 243, 243, 1),
                      fontSize: 28,
                      //24
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  'A+ FACE RECOGNITION',
                  style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: Color.fromRGBO(54, 238, 236, 0.5),
                      fontSize: 28,
                      //25
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                'A+ Face Recognition là một ứng dụng giúp nhận diện khuôn mặt thông qua hình ảnh',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontFamily: 'NotoSans',
                    color: Color.fromRGBO(243, 243, 243, 1),
                    fontSize: 17,
                    //14
                    fontWeight: FontWeight.w100),
              ),
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                Get.offAllNamed(Routes.home);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 60),
                height: 50,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(54, 238, 236, 0.6),
                    borderRadius: BorderRadius.circular(40)),
                child: const Center(
                  child: Text(
                    'Khám phá ngay',
                    style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: Color.fromRGBO(243, 243, 243, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

import '../Nav_Home.dart';

class UserGuide extends StatefulWidget {
  const UserGuide({super.key});

  @override
  State<UserGuide> createState() => _UserGuideState();
}

class _UserGuideState extends State<UserGuide> {
  final controller = PageController();
  final viewTransformationController = TransformationController();

  @override
  void initState() {
    const zoomFactor = 2.0;
    var yTranslate = Get.height * 0.45;
    viewTransformationController.value.setEntry(0, 0, zoomFactor);
    viewTransformationController.value.setEntry(1, 1, zoomFactor);
    viewTransformationController.value.setEntry(2, 2, zoomFactor);
    viewTransformationController.value.setEntry(0, 3, 0);
    viewTransformationController.value.setEntry(1, 3, -yTranslate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.home, color: Colors.blueGrey[600]),
                onPressed: () {
                  Get.offAll(const NavigationHome());
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Text(
                      "User Mannual",
                      style: TextStyle(
                          color: Colors.blueGrey[700],
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.menu_book,
                      color: Colors.blueGrey[600],
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(width: Get.height * 0.02)
                ],
              ),
            ],
          ),
        ),
        Row(
          children: [
            const Spacer(),
            IconButton(
              onPressed: () => controller.previousPage(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut),
              icon: const Icon(Icons.keyboard_arrow_left),
              color: Colors.blueGrey[900],
            ),
            IconButton(
              onPressed: () => controller.nextPage(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut),
              icon: const Icon(Icons.keyboard_arrow_right),
              color: Colors.blueGrey[900],
            ),
          ],
        ),
        SizedBox(
          width: Get.width,
          height: Get.height * 0.75,
          child: PageView(
            controller: controller,
            children: [
              PinchZoom(
                maxScale: 10,
                resetDuration: const Duration(seconds: 100),
                child: Image.asset(
                  "Assets/guide/1.png",
                ),
              ),
              PinchZoom(
                maxScale: 10,
                resetDuration: const Duration(seconds: 100),
                child: Image.asset("Assets/guide/2.png"),
              ),
              PinchZoom(
                maxScale: 10,
                resetDuration: const Duration(seconds: 100),
                child: Image.asset("Assets/guide/3.png"),
              ),
              PinchZoom(
                maxScale: 10,
                resetDuration: const Duration(seconds: 100),
                child: Image.asset("Assets/guide/4.png"),
              ),
              PinchZoom(
                maxScale: 10,
                resetDuration: const Duration(seconds: 100),
                child: Image.asset("Assets/guide/5.png"),
              ),
              PinchZoom(
                maxScale: 10,
                resetDuration: const Duration(seconds: 100),
                child: Image.asset("Assets/guide/6.png"),
              ),
            ],
          ),
        ),
      ],
    ));
    ;
  }
}

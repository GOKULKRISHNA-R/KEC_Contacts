import 'package:cached_network_image/cached_network_image.dart';
import 'package:contacts_app_kec/Nav_Home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:provider/provider.dart';
import 'abt_db_service.dart';

class AboutImageList extends StatelessWidget {
  final controller = PageController(initialPage: 1);
  AboutImageList({super.key});

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<AboutImage>>(context);

    users.sort((a, b) {
      return int.parse(a.id).compareTo(int.parse(b.id));
    });

    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.home, color: Colors.blueGrey[600]),
                      onPressed: () {
                        Get.offAll(const NavigationHome());
                      },
                    ),
                    Row(
                      children: [
                        Center(
                          child: Text(
                            "About Our KEC",
                            style: TextStyle(
                                color: Colors.blueGrey[700],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.face_outlined,
                            color: Colors.blueGrey[600],
                          ),
                          onPressed: () {},
                        ),
                        SizedBox(width: Get.width * 0.02)
                      ],
                    ),
                  ],
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
              ],
            ),
          ),
          Container(
            height: Get.height * 0.8,
            width: Get.width,
            child: PageView(
              controller: controller,
              children: users
                  .map((e) => PinchZoom(
                        resetDuration: const Duration(seconds: 100),
                        child: CachedNetworkImage(
                          imageUrl:
                              e.imgurl.replaceAll('"', '').replaceAll("'", ''),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

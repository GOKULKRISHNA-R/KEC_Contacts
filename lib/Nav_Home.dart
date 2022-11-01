import 'package:contacts_app_kec/Shared/background.dart';
import 'package:contacts_app_kec/Shared/design.dart';
import 'package:contacts_app_kec/calander/calander_home.dart';
import 'package:contacts_app_kec/contacts/home.dart';
import 'package:contacts_app_kec/developer/developer_home.dart';
import 'package:contacts_app_kec/guide/guide.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'Academic Shedule/AcademicSheduleHome.dart';
import 'about/img_traversal.dart';

class NavigationHome extends StatefulWidget {
  const NavigationHome({super.key});

  @override
  State<NavigationHome> createState() => _NavigationHomeState();
}

class _NavigationHomeState extends State<NavigationHome>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: kPrimaryMediumColor,
        statusBarBrightness: Brightness.light));

    return Scaffold(
      body: Background(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Row(
                children: [
                  const Spacer(),
                  const Spacer(),
                  Image.asset(
                    "Assets/Images/kec_main.png",
                    height: Get.height * 0.13,
                  ),
                  const Spacer(),
                  Image.asset(
                    "Assets/Images/kec_transform.png",
                    height: Get.height * 0.1,
                  ),
                  const Spacer(),
                  const Spacer(),
                ],
              ),
              const Spacer(),
              Container(
                height: Get.height * 0.4,
                margin: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(const AbtImgs());
                      },
                      onTapDown: _onTapDown,
                      onTapUp: _onTapUp,
                      child: Transform.scale(
                        scale: _scale,
                        child: _RanimatedButtonUI(
                            Image.asset(
                              "Assets/icons/about.png",
                              height: 33,
                            ),
                            "About Our KEC"),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(const ContactHome());
                      },
                      onTapDown: _onTapDown,
                      onTapUp: _onTapUp,
                      child: Transform.scale(
                        scale: _scale,
                        child: _LanimatedButtonUI(
                            Image.asset(
                              "Assets/icons/phonebook.png",
                              height: 33,
                            ),
                            "KEC Contacts"),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(const CalanderHome());
                      },
                      onTapDown: _onTapDown,
                      onTapUp: _onTapUp,
                      child: Transform.scale(
                        scale: _scale,
                        child: _RanimatedButtonUI(
                            Image.asset(
                              "Assets/icons/calander.png",
                              height: 33,
                            ),
                            "Academic Calendar"),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(const AcademicSheduleHome());
                      },
                      onTapDown: _onTapDown,
                      onTapUp: _onTapUp,
                      child: Transform.scale(
                        scale: _scale,
                        child: _LanimatedButtonUI(
                            Image.asset(
                              "Assets/icons/Acalendar.png",
                              height: 33,
                            ),
                            "Academic Shedule"),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  const Spacer(),
                  TextButton.icon(
                    style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(kPrimaryMediumColor)),
                    icon: Image.asset(
                      "Assets/icons/coding.png",
                      height: 24,
                    ),
                    onPressed: () {
                      Get.to(const DevHome());
                    },
                    label: const Text(
                      "Queries",
                      style: TextStyle(color: kPrimaryColor, fontSize: 12),
                    ),
                  ),
                  const Spacer(),
                  TextButton.icon(
                    style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(kPrimaryMediumColor)),
                    icon: const Icon(
                      Icons.my_library_books_rounded,
                      color: kPrimaryColor,
                    ),
                    onPressed: () {
                      Get.to(const UserGuide());
                    },
                    label: const Text(
                      "User Mannual",
                      style: TextStyle(color: kPrimaryColor, fontSize: 12),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const Spacer(),
            ]),
      ),
    );
  }

  Widget _RanimatedButtonUI(Image icon, String text) => Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            height: 40,
            width: 400,
            decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(50)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Expanded(
                  flex: 5,
                  child: Text(''),
                ),
                Text(text),
                const Spacer(),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30),
            height: 60,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                boxShadow: const [
                  BoxShadow(
                    color: kPrimaryColor,
                    blurRadius: 20.0,
                    offset: Offset(0.0, 5.0),
                  ),
                ],
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    kPrimaryMediumColor,
                    kPrimaryLightColor,
                  ],
                )),
            child: Center(
              child: icon,
            ),
          ),
        ],
      );

  Widget _LanimatedButtonUI(Image icon, String text) => Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(50)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Spacer(),
                Text(text),
                const Expanded(
                  flex: 5,
                  child: Text(''),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 30),
            height: 60,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                boxShadow: const [
                  BoxShadow(
                    color: kPrimaryColor,
                    blurRadius: 20.0,
                    offset: Offset(0.0, 5.0),
                  ),
                ],
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    kPrimaryLightColor,
                    kPrimaryMediumColor,
                  ],
                )),
            child: Center(
              child: icon,
            ),
          ),
        ],
      );

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }
}

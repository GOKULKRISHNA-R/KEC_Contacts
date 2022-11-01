import 'package:contacts_app_kec/Shared/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Nav_Home.dart';
import '../contacts/dev_Home.dart';

class DevHome extends StatefulWidget {
  const DevHome({super.key});

  @override
  State<DevHome> createState() => _DevHomeState();
}

class _DevHomeState extends State<DevHome> {
  @override
  Widget build(BuildContext context) {
    var h = Get.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 20, 59),
      body: Container(
        margin: EdgeInsets.only(
            top: h * 0.037, left: h * 0.02, right: h * 0.02, bottom: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color: kPrimaryLightColor,
                size: h * 0.037,
              ),
              onPressed: () {
                Get.offAll(const NavigationHome());
              },
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            const Text(
              '''Greetings
              If you find any Correction with any of your data you can send that to the mail below''',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            ElevatedButton.icon(
                icon: const Icon(
                  Icons.mail,
                  color: kPrimaryColor,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryLightColor,
                ),
                onLongPress: () {
                  Clipboard.setData(
                      const ClipboardData(text: "cseautomation@kongu.edu"));
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: kPrimaryColor,
                      content: Text('Email is Copied',
                          style: TextStyle(color: kPrimaryLightColor)),
                      duration: Duration(seconds: 1),
                      dismissDirection: DismissDirection.horizontal));
                },
                onPressed: () async {
                  final Uri params = Uri(
                    scheme: 'mailto',
                    path: "cseautomation@kongu.edu",
                  );
                  if (await canLaunchUrl(params)) {
                    await launchUrl(params);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: kPrimaryColor,
                        content: Text(
                          "Email couldn't be sent ",
                          style: TextStyle(color: kPrimaryLightColor),
                        ),
                        duration: Duration(seconds: 1),
                        dismissDirection: DismissDirection.horizontal));
                    throw 'NO EMAIL SENT $params';
                  }
                },
                label: const Text(
                  "cseautomation@kongu.edu",
                  style: TextStyle(color: kPrimaryColor),
                )),
            const Text(
              '''Or
      You can Message to this number''',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            ElevatedButton.icon(
                icon: const Icon(
                  Icons.whatsapp,
                  color: Colors.green,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryLightColor,
                ),
                onLongPress: () {
                  Clipboard.setData(const ClipboardData(text: "6383846825"));
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: kPrimaryColor,
                      content: Text('Phone Number is Copied',
                          style: TextStyle(color: kPrimaryLightColor)),
                      duration: Duration(seconds: 1),
                      dismissDirection: DismissDirection.horizontal));
                },
                onPressed: () async {
                  var whatsappUrl =
                      Uri.parse("whatsapp://send?phone= +916383846825");
                  await canLaunchUrl(whatsappUrl)
                      ? launchUrl(whatsappUrl)
                      : ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                              backgroundColor: kPrimaryColor,
                              content: Text(
                                "There is no whatsapp installed",
                                style: TextStyle(color: kPrimaryLightColor),
                              ),
                              duration: Duration(seconds: 1),
                              dismissDirection: DismissDirection.horizontal));
                },
                label: const Text(
                  "6383846825",
                  style: TextStyle(color: kPrimaryColor),
                )),
            SizedBox(
              height: h * 0.01,
            ),
            const Text(
              "Would you like to fill the feed back form ?",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            SizedBox(
              height: h * 0.01,
            ),
            ElevatedButton.icon(
              onLongPress: () {
                Clipboard.setData(const ClipboardData(
                    text:
                        "https://docs.google.com/forms/d/e/1FAIpQLSeYJGJDvYFd_DG6veyQLOeKkiJqUN4998AO2RKugDZy1fr_ig/viewform?usp=sf_link"));
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: kPrimaryColor,
                    content: Text('Link is Copied',
                        style: TextStyle(color: kPrimaryLightColor)),
                    duration: Duration(seconds: 1),
                    dismissDirection: DismissDirection.horizontal));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryLightColor,
              ),
              onPressed: () async {
                Uri url = Uri.parse(
                    'https://docs.google.com/forms/d/e/1FAIpQLSeYJGJDvYFd_DG6veyQLOeKkiJqUN4998AO2RKugDZy1fr_ig/viewform?usp=sf_link');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  throw 'Could not launch $url';
                }
              },
              icon: Icon(
                Icons.feedback,
                color: kPrimaryColor,
                size: h * 0.025,
              ),
              label: const Text(
                "Feed Back form",
                style: TextStyle(color: kPrimaryColor),
              ),
            ),
            SizedBox(
              height: h * 0.009,
            ),
            Text(
              "( Long Press and copy things !!! )",
              style: TextStyle(color: Colors.white, fontSize: h * 0.01),
            ),
            const Spacer(),
            const Spacer(),
            const Spacer(),
            const Spacer(),
            const Spacer(),
            const Spacer(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Get.to(const ContactDEVHome());
                    },
                    child: const Text("DEVELOPER DETAILS")),
              ],
            ),
            const Spacer(),
            Text(
              "THIS APP IS UNDER TESTING KINDLY SUPPORT US TO DEVELOP",
              style: TextStyle(color: Colors.white, fontSize: h * 0.01),
            ),
          ],
        ),
      ),
    );
  }
}
